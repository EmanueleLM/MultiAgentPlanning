from langchain_core.messages import SystemMessage, HumanMessage, AIMessage, AnyMessage
from langchain_core.tools import tool
from langchain_openai import ChatOpenAI
from langgraph.graph import START, END, StateGraph, MessagesState
from langgraph.graph.message import add_messages
from langgraph.prebuilt import tools_condition, ToolNode, create_react_agent
from langchain.output_parsers import PydanticOutputParser
from typing import Annotated, TypedDict, Literal, List, Dict, Optional, Any
from langgraph.types import Command, interrupt
from pydantic import BaseModel, Field
from pathlib import Path

MODEL = "gpt-4o"  # use same model for all workflow agents for now


# helper functions
# set once reducer for initial description
def _set_once(curr: str | None, new: str | None) -> str | None:
    return curr if curr else new


class QnA(TypedDict):
    """Storing clarification questions and answers."""

    question: str
    answer: str


# helper functions
def _get_qa(messages: List[AnyMessage]) -> List[QnA]:
    qa_list: List[QnA] = []
    pending_q = None
    for msg in messages:
        if getattr(
            msg, "tool_name", None
        ) == "AskClarify" and msg.additional_kwargs.get("args"):
            pending_q = msg.additional_kwargs["args"].get("question")
        elif msg.type == "human" and pending_q:
            qa_list.append({"question": pending_q, "answer": msg.content})
            pending_q = None
    return qa_list


def _read_file_snippet(p: Path, max_chars: int = 12_000) -> str:
    try:
        txt = p.read_text(encoding="utf-8")
    except Exception:
        return f"# Could not read file: {p}"
    if len(txt) > max_chars:
        return txt[:max_chars] + "\n# ...truncated..."
    return txt


# Schemas for controlling JSON format
class AgentInfo(BaseModel):
    mode: str = Field(..., description="Representation mode (e.g. 'pddl').")
    private_information: List[str] = Field(
        default_factory=list, description="Private facts/constraints for the agent."
    )
    goal: str = Field(
        ..., description="Agent-specific (possibly global) goal description."
    )


class AgentsSection(BaseModel):
    number: int = Field(..., description="Number of agents.")
    names: List[str] = Field(..., description="List of agent names.")
    agent_details: Dict[str, AgentInfo] = Field(
        default_factory=dict,
        description="Mapping of agent name to AgentInfo. Keys are entries listed in 'names'.",
    )


class OrchestratorSpec(BaseModel):
    name: str = Field(..., description="Orchestrator agent name.")
    enabled: Optional[bool] = Field(
        None, description="Whether the orchestrator is enabled."
    )
    goal: Optional[str] = Field(None, description="Global coordination goal.")


class Environment(BaseModel):
    init: Dict = Field(
        ...,
        description="Initial world state, different depending on the planning task.",
    )
    goal: Dict = Field(
        ...,
        description="Goal state for the environment, different depending on the planning task.",
    )
    public_information: List[str] = Field(
        default_factory=list, description="Global public facts about the environment."
    )


class AgentSpec(BaseModel):
    input: Any = Field(..., description="Inputs (references to other artifacts).")
    output: str = Field(..., description="Output artifact name.")
    system_prompt: str = Field(..., description="System prompt for this agent.")
    prompt: str = Field(
        ..., description="Human prompt (task specific prompt) for this agent."
    )


class WorkflowSpec(BaseModel):
    # mapping of participant name to AgentSpec
    participants: Dict[str, AgentSpec] = Field(
        default_factory=dict,
        description="Per-participant generation specification.",
    )
    constraints: List[str] = Field(
        default_factory=list,
        description="List of constraint expressions for which tasks should come before others.",
    )


class PlanSchema(BaseModel):
    name: str = Field(..., description="Environment name.")
    author: Optional[str] = Field(None, description="Author metadata.")
    agents: AgentsSection = Field(
        ..., description="Agents section with counts, names and details."
    )
    orchestrator: Optional[OrchestratorSpec] = Field(
        None, description="Orchestrator metadata."
    )
    environment: Environment = Field(
        ..., description="Environment initial state and public info."
    )
    workflow: WorkflowSpec = Field(
        ...,
        description="Workflow specifications for each participant (pddl prompts, constraints).",
    )


plan_parser = PydanticOutputParser(pydantic_object=PlanSchema)


# state setup
class State(TypedDict):
    """Graph state"""

    messages: Annotated[List[AnyMessage], add_messages]
    initial_description: Annotated[
        str, _set_once
    ]  # initial human NL description of the task
    clarifications: Annotated[
        List[QnA], list.__add__
    ]  # sequence of interactions for clarification
    revised_description: str  # revised, structured description of the task
    plan: Optional[Dict[str, Any]]  # parsed_model.model_dump() -> Dict[str, Any]
    env_class: Optional[str]  # code string for the environment class


# tools
@tool("AskClarify", return_direct=True)
def ask_clarify(question: str) -> str:
    """
    Asks for clarification if task description is ambiguous or missing details.
    Pass a concise question. Returns the user's answer.

    Args:
        question (str): Question asking for clarification.
    """
    answer = interrupt({"purpose": "clarification", "question": question})
    return answer if isinstance(answer, str) else answer.get("answer", "")


# define llms
oracle_llm = ChatOpenAI(model=MODEL, temperature=0)
# summarizer_llm = ChatOpenAI(model=MODEL, temperature=0)
# use schema to enforce json structure to some extent
coder_json_llm = ChatOpenAI(model=MODEL, temperature=0).with_structured_output(
    PlanSchema
)
coder_py_llm = ChatOpenAI(model=MODEL, temperature=0)
refiner_llm = ChatOpenAI(model=MODEL, temperature=0)


# define agents
oracle = create_react_agent(
    model=oracle_llm,
    tools=[ask_clarify],
)


def agent_oracle(state: State):
    init = {}
    if not state.get("initial_description"):
        human_texts = [
            m.content for m in state["messages"] if getattr(m, "type", "") == "human"
        ]
        if human_texts:
            # first human message is used to invoke graph, should just be a single message with task desc.
            init["initial_description"] = human_texts[0]

    sys_msg = (
        "You are an expert in planning. Given a description of a planning task, your job is only to decide "
        "whether there is sufficient information to come up with a plan. If not, or if anything is unclear,"
        "ask a concise question for more details or clarification."
    )
    inp = {"messages": [SystemMessage(content=sys_msg)] + state["messages"]}
    out = oracle.invoke(inp)
    return {
        **init,
        "messages": out["messages"],
        "clarifications": _get_qa(out["messages"]),
    }


def agent_summarizer(state: State):
    sys_msg = (
        "You are given the initial description of a planning task and subsequent clarifications."
        "Rewrite task descriptions into a crisp, structured brief. Prefer specifics from clarifications"
        "over the initial description."
    )
    task_info = (
        f"Initial description: {state["initial_description"]}\n"
        f"clarifications: {'\n'.join([f'{pair["question"]} - {pair["answer"]}' for pair in state["clarifications"]])}"
    )
    inp = [SystemMessage(content=sys_msg), HumanMessage(content=task_info)]
    out = oracle_llm.invoke(inp)
    return {"messages": out, "revised_description": out}


def agent_coder_json(state: State):
    sys_msg = (
        "You are an expert programmer. Given a structured brief of a planning task, "
        "generate a comprehensive JSON representation of the planning task, following the example given."
        "The JSON should include a breakdown of tasks and knowledge for each agent and the orchestrator."
        "Depending on the task, the structure of the init and goal fields of the environment may vary."
        "Ensure the JSON is well-structured and adheres to best practices."
    )

    human_prompt = (
        f"\n{state.get('revised_description', '')}\n\n"
        "Return only the JSON that conforms to the schema."
    )

    inp = [SystemMessage(content=sys_msg), HumanMessage(content=human_prompt)]
    out = coder_json_llm.invoke(inp)

    parsed_plan = None
    if isinstance(out, dict):
        # in case the output is structured in a specific way
        for key in ("parsed", "structured", "structured_output", "parsed_output"):
            if key in out:
                parsed_plan = out[key]
                break

    # extract json depending on the output structure. Extra safety checks
    if parsed_plan is None:
        assistant_text = ""
        if isinstance(out, dict) and out.get("messages"):
            for m in out["messages"]:
                if getattr(m, "type", "") == "ai":
                    assistant_text = m.content
                    break
        elif hasattr(out, "content"):
            assistant_text = out.content
        else:
            assistant_text = str(out)

        try:
            parsed_model = plan_parser.parse(assistant_text)
            parsed_plan = parsed_model.model_dump()
        except Exception as e:
            return {"messages": out.get("messages", out), "json_error": str(e)}

    return {"messages": out.get("messages", out), "plan": parsed_plan}


def agent_coder_py(state: State):
    sys_msg = (
        "You are an expert Python programmer. Given a JSON representation of a planning task, "
        "complete a class description for the problem, adhering closely to the given template and example(s). "
        "Only implement the environment setup in reset() and a render() method. "
        "Return only the Python code for the completed Problem class (no explanation)."
    )

    # reference files (base Environment class and template)
    base = Path(__file__).parent
    env_path = base / "Environment.py"
    tmpl_path = base / "environment_class_template.py"

    env_snip = _read_file_snippet(env_path)
    tmpl_snip = _read_file_snippet(tmpl_path)

    human_prompt = (
        f"Task JSON:\n{state.get('plan', {})}\n\n"
        "Reference: Environment base class:\n"
        "```python\n"
        f"{env_snip}\n"
        "```\n\n"
        "Reference: Class template to complete:\n"
        "```python\n"
        f"{tmpl_snip}\n"
        "```\n"
    )

    inp = [SystemMessage(content=sys_msg), HumanMessage(content=human_prompt)]
    out = coder_py_llm.invoke(inp)
    return {"messages": out.get("messages", out), "env_class": out}


# build graph
builder = StateGraph(State)

# nodes
builder.add_node("Oracle", agent_oracle)
# builder.add_node("Tool: ask_clarify", ToolNode([ask_clarify]))
builder.add_node("Reworder", agent_summarizer)
builder.add_node("JSON coder", agent_coder_json)
builder.add_node("Python coder", agent_coder_py)

# edges
builder.add_edge(START, "Oracle")
builder.add_edge("Oracle", "Reworder")
builder.add_edge("Reworder", "JSON coder")
builder.add_edge("JSON coder", "Python coder")
builder.add_edge("Python coder", END)

graph = builder.compile()
