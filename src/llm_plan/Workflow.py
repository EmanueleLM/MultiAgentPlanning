import json
import subprocess
import shlex
from datetime import datetime
from langchain_core.messages import SystemMessage, HumanMessage, AIMessage, AnyMessage
from langchain_core.tools import tool
from langchain_openai import ChatOpenAI
from langgraph.graph import START, END, StateGraph, MessagesState
from langgraph.graph.message import add_messages
from langgraph.prebuilt import tools_condition, ToolNode, create_react_agent
from langgraph.constants import Send
from langchain.output_parsers import PydanticOutputParser
from typing import Annotated, TypedDict, Literal, List, Dict, Optional, Any, Tuple
from langgraph.types import Command, interrupt
from pydantic import BaseModel, Field
from pathlib import Path
from llm_plan.environment import Environment as TaskEnvironment

MODEL = "gpt-4o"  # use same model for all workflow agents for now
JSON_OUTPUT_PATH = "../../environments/static"
ACTOR_OUTPUT_PATH = "../../environments/static/temp"
EXAMPLE_JSON = "./example_schema.json"
ENVIRONMENT_CLASS = "./environment.py"


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
    """Extract question-answer pairs from messages."""
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


def _win_to_wsl_path(p: Path) -> str:
    """Convert a Windows path to WSL (/mnt/drive/...) form."""
    p = p.resolve()
    drive = p.drive.rstrip(":").lower()
    return f"/mnt/{drive}" + "/" + "/".join(p.parts[1:])


def _solve_pddl(
    domain_path,
    problem_path,
    plan_out_path,
    fd_dir_wsl="~/fast-downward",
    search="astar(blind())",
):
    """
    Run Fast Downward via WSL. Re-implement this depending on your OS to call fast-downward or any other planner.
    Ensure the output plan is in the same format as that of fast-downward.
    Args:
        domain_path (str): Windows path to domain.pddl
        problem_path (str): Windows path to problem.pddl
        plan_out_path (str): Windows path where plan file will be saved.
        fd_dir_wsl (str): WSL directory where fast-downward.py resides (default: ~/fast-downward)
        search (str): Fast Downward search spec, e.g. 'astar(lmcut())'
    """
    domain_path = Path(domain_path)
    problem_path = Path(problem_path)
    plan_out_path = Path(plan_out_path)

    plan_out_path.parent.mkdir(parents=True, exist_ok=True)

    domain_wsl = _win_to_wsl_path(domain_path)
    problem_wsl = _win_to_wsl_path(problem_path)
    outdir_wsl = _win_to_wsl_path(plan_out_path)

    # Build inner bash command:
    # 1) cd into FD folder
    # 2) run planner to produce sas_plan
    # 3) copy sas_plan* into Windows folder
    # 4) remove sas_plan* from WSL side
    run_cmd = " ".join(
        [
            "python3",
            "fast-downward.py",
            shlex.quote(domain_wsl),
            shlex.quote(problem_wsl),
            "--search",
            shlex.quote(search),
        ]
    )
    copy_cmd = (
        "if ls sas_plan* >/dev/null 2>&1; then "
        "mkdir -p " + shlex.quote(outdir_wsl) + " && "
        "cp -f sas_plan* " + shlex.quote(outdir_wsl) + "/ && "
        "rm -f sas_plan*; "
        "fi"
    )

    inner_cmd = f"cd {fd_dir_wsl} && {run_cmd} && {copy_cmd}"

    proc = subprocess.run(
        ["wsl", "bash", "-lc", inner_cmd], capture_output=True, text=True
    )

    if proc.returncode != 0:
        raise RuntimeError(
            "Fast Downward failed.\n"
            f"STDOUT:\n{proc.stdout}\n\nSTDERR:\n{proc.stderr}\n"
        )


# Schemas for controlling JSON format
class AgentInfo(BaseModel):
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
    task: str = Field(..., description="Task name for this agent.")  # pddl or obs
    input: List[str] = Field(..., description="Inputs (references to other artifacts).")
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
        description="List of constraint expressions for which tasks should come before others, e.g. 'task1->task2'.",
    )


class PlanSchema(BaseModel):
    name: str = Field(..., description="Environment name.")
    author: Optional[str] = Field(None, description="Author metadata.")
    agents: AgentsSection = Field(
        ..., description="Agents section with counts, names and details."
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
    plan_json: Dict[str, Any]  # parsed_model.model_dump() -> Dict[str, Any]
    problem_name: str  # name of the planning problem
    environment: TaskEnvironment  # environment object for the problem
    workflow: List[List[str]]  # environment.plan
    current_step: int = 0
    num_steps: int  # number of sequential steps in the planning workflow
    pddl: Dict[
        str, str
    ]  # domain and problem PDDL names and paths from orchestrator, for solver
    agent_configs: List[Tuple]  # configurations for agents in the current parallel step
    is_final: bool = False  # whether this is the final step in the workflow


# state for a generic agent, including actors and orchestrator
class AgentState(TypedDict):
    problem_name: str  # problem name, to save output in correct folder
    name: str  # agent name
    task: Literal["pddl", "obs"]  # task mode, e.g. pddl
    sys_msg: str
    prompt: str
    inputs: List[str]
    output: str
    is_final: bool


# tools
@tool("AskClarify")
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
# use schema to enforce json structure to some extent
# somehow ChatOpenAI doesn't like .with_structured_output, so have to put format instructions in agent
coder_json_llm = ChatOpenAI(model=MODEL, temperature=0)
pddl_llm = ChatOpenAI(model=MODEL, temperature=0)
refiner_llm = ChatOpenAI(model=MODEL, temperature=0)


# define agents
oracle_sys_msg = (
    "You are an expert in planning. Given a description of a planning task, your job is only to decide "
    "whether there is sufficient information to come up with a plan. If not, or if anything is unclear,"
    "ask a concise question for more details or clarification. Do not ask to ask. If you have a question, "
    "just make a tool call. You do not need to come up with a plan."
)
oracle = create_react_agent(
    model=oracle_llm,
    tools=[ask_clarify],
    state_modifiers=[SystemMessage(content=oracle_sys_msg)],
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

    inp = {"messages": state["messages"]}
    out = oracle.invoke(inp)
    return {
        **init,
        "messages": state["messages"] + out["messages"],
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
    return {"messages": state["messages"] + [out], "revised_description": out}


def agent_coder_json(state: State):
    # TODO: for now, specify pddl in the system prompt. Will have to revise if we want observations instead.
    sys_msg = (
        "You are an expert programmer. Given a structured brief of a planning problem, "
        "generate a comprehensive JSON representation of the planning problem, following the example given. "
        "The JSON should include a breakdown of tasks and knowledge for each agent and the orchestrator (also an agent). "
        "Each agent generates a PDDL domain + problem and sends it to the orchestrator that generates the final plan. "
        "Depending on the problem, the structure of the init and goal fields of the environment may vary. "
        "Each constraint should strictly be of the form [agent name].[task]->[agent name].[task], specifying which"
        "tasks should be completed before which others. For example, 'Agent1.pddl->orchestrator.pddl.'"
    )
    format_instructions = plan_parser.get_format_instructions()
    with open(EXAMPLE_JSON, "r") as f:
        example_json = f.read()
    with open(ENVIRONMENT_CLASS, "r") as f:
        environment_class = f.read()

    human_prompt = (
        "Return only the JSON that conforms to the schema below.\n\n"
        f"{format_instructions}\n\n"
        f"[Example]\n{example_json}\n\n"
        "You should make sure the json conforms to the following environment class, which will access it:"
        f"[Environment]\n{environment_class}\n\n"
        f"[Problem]\n{state.get('revised_description', '')}\n\n"
        "Do not include any extra commentary or Markdown, only the JSON."
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
            return {
                "messages": state["messages"] + [out],
                "json_error": str(e),
            }

    # write json to file, name with timestamp to avoid clash
    plan_name = parsed_plan.get("name", "unnamed_plan").replace(" ", "_")
    timestamp = datetime.now().strftime("%Y%m%d_%H%M%S")
    json_path = Path(f"{JSON_OUTPUT_PATH}/{plan_name}_{timestamp}.json")
    json_path.write_text(json.dumps(parsed_plan, indent=2))

    return {
        "messages": state["messages"] + [out],
        "plan_json": parsed_plan,
        "problem_name": parsed_plan.get("name", "unnamed_problem"),
    }


def construct_environment(state: State):
    env = TaskEnvironment(state["plan_json"])
    workflow = env.plan
    num_steps = len(workflow)
    return {
        "messages": state["messages"],
        "environment": env,
        "workflow": env.plan,
        "num_steps": num_steps,
        "current_step": 0,
    }


# keep all the initialising in construct_environment so continue_to_workflow can loop.
def workflow_splitter(state: State):
    environment = state["environment"]
    parallel_steps = state["workflow"][state["current_step"]]
    agent_configs = []
    for step in parallel_steps:
        agent_name, action = step.split(".")
        agent_spec = environment.workflow["participants"][agent_name]
        assert (
            action in agent_spec["task"]
        ), f"Action {action} not found in agent {agent_name} spec."

        sys_msg = agent_spec["system_prompt"]
        prompt = agent_spec["prompt"]
        inputs = agent_spec["input"]
        output = agent_spec["output"]
        task = agent_spec["task"]
        agent_configs.append((agent_name, task, sys_msg, prompt, inputs, output))
    state["agent_configs"] = agent_configs
    state["current_step"] += 1
    state["is_final"] = False
    if state["current_step"] == state["num_steps"]:
        state["is_final"] = True
    return state


def continue_to_workflow(state: State):
    agent_configs = state["agent_configs"]
    return [
        Send(
            "Actor node",
            {
                "problem_name": state["problem_name"],
                "name": agent_name,
                "task": task,
                "sys_msg": sys_msg,
                "prompt": prompt,
                "inputs": inputs,
                "output": output,
                "is_final": state["is_final"],
            },
        )
        for agent_name, task, sys_msg, prompt, inputs, output in agent_configs
    ]


def generic_actor(state: AgentState):
    problem_name = state["problem_name"]
    name = state["name"]
    sys_msg = state["sys_msg"]
    prompt = state["prompt"]
    inputs = state["inputs"]
    output = state["output"]

    base_dir = (
        Path(__file__).parent / (ACTOR_OUTPUT_PATH + f"/{problem_name}")
    ).resolve()

    formatted_parts: List[str] = []
    # TODO: this assumes pddl mode! Need additional logic if want only observations
    for inp in inputs or []:
        d = base_dir / f"{inp}_domain.pddl"
        p = base_dir / f"{inp}_problem.pddl"
        content_domain, content_problem = "", ""
        p_file_name = p.name
        d_file_name = d.name
        try:
            content_domain = d.read_text(encoding="utf-8")
            content_problem = p.read_text(encoding="utf-8")
        except Exception as e:
            raise ValueError(f"Error reading input files for {inp}: {e}")

        formatted_parts.append(f"[{d_file_name}]:\n{content_domain}\n\n")
        formatted_parts.append(f"[{p_file_name}]:\n{content_problem}\n\n")

    formatted_inputs = "[Inputs]:\n" + "".join(formatted_parts)

    # Invoke the PDDL LLM with system message and a human message containing the prompt + formatted inputs
    prompt_with_inputs = prompt + "\n\n" + formatted_inputs
    response = pddl_llm.invoke(
        [SystemMessage(content=sys_msg), HumanMessage(content=prompt_with_inputs)]
    )
    response_text = response.content

    # if task mode is pddl:
    if state["task"] == "pddl":
        # extract domain and problem from pddl
        # assume system message instructed agent to enclose <> tags
        domain = response_text.split("<domain>")[1].split("</domain>")[0]
        problem = response_text.split("<problem>")[1].split("</problem>")[0]
        domain_path = base_dir / f"{output}_domain.pddl"
        problem_path = base_dir / f"{output}_problem.pddl"
        # create directory if doesn't exist
        base_dir.mkdir(parents=True, exist_ok=True)

        domain_path.write_text(domain, encoding="utf-8")
        problem_path.write_text(problem, encoding="utf-8")

    # If final step and orchestrator, store the final domain and problem content
    if name == "orchestrator" and state["is_final"]:
        return {
            "pddl": {
                "domain": domain,
                "problem": problem,
                "domain_path": domain_path,
                "problem_path": problem_path,
            },
        }

    # TODO: add additional logic for other task modes

    return {}


def external_solver(state: State):
    problem_name = state["problem_name"]
    base_dir = (
        Path(__file__).parent / (ACTOR_OUTPUT_PATH + f"/{problem_name}")
    ).resolve()

    domain_path = state["pddl"]["domain_path"]
    problem_path = state["pddl"]["problem_path"]
    plan_out_path = base_dir / f"{problem_name}_plan.sas"
    _solve_pddl(domain_path, problem_path, plan_out_path)
    return {}


def proceed_to_solver(
    state: State,
) -> Literal["External solver", "Workflow splitter"]:
    if state["is_final"]:
        return "External solver"
    return "Workflow splitter"


# build graph
builder = StateGraph(State)

# nodes
builder.add_node("Oracle", agent_oracle)
# builder.add_node("Tool: ask_clarify", ToolNode([ask_clarify]))
builder.add_node("Reworder", agent_summarizer)
builder.add_node("JSON coder", agent_coder_json)
builder.add_node("Task Environment Constructor", construct_environment)
builder.add_node("Workflow splitter", workflow_splitter)
builder.add_node("Actor node", generic_actor)
builder.add_node("External solver", external_solver)

# edges
builder.add_edge(START, "Oracle")
builder.add_edge("Oracle", "Reworder")
builder.add_edge("Reworder", "JSON coder")
builder.add_edge("JSON coder", "Task Environment Constructor")
builder.add_edge("Task Environment Constructor", "Workflow splitter")
builder.add_conditional_edges("Workflow splitter", continue_to_workflow, ["Actor node"])
builder.add_conditional_edges("Actor node", proceed_to_solver)
builder.add_edge("External solver", END)

graph = builder.compile()
