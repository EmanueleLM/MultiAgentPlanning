from langchain_core.messages import SystemMessage, HumanMessage, AIMessage, AnyMessage
from langchain_core.tools import tool
from langchain_openai import ChatOpenAI
from langgraph.graph import START, END, StateGraph, MessagesState
from langgraph.graph.message import add_messages
from langgraph.prebuilt import tools_condition, ToolNode, create_react_agent
from typing import Annotated, TypedDict, Literal, List
from langgraph.types import Command, interrupt

MODEL = "gpt-4o"  # use same model for all workflow agents for now


# state steup
# set once reducer for initial description
def _set_once(curr: str | None, new: str | None) -> str | None:
    return curr if curr else new


class QnA(TypedDict):
    """Storing clarification questions and answers."""

    question: str
    answer: str


class State(TypedDict):
    """Graph state"""

    messages: Annotated[List[AnyMessage], add_messages]
    initial_description: Annotated[str, _set_once]
    clarifications: Annotated[List[QnA], list.__add__]
    revised_description: str


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
coder_json_llm = ChatOpenAI(model=MODEL, temperature=0)
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


# build graph
builder = StateGraph(State)

# nodes
builder.add_node("Oracle", agent_oracle)
# builder.add_node("Tool: ask_clarify", ToolNode([ask_clarify]))
builder.add_node("Reworder", agent_summarizer)

# edges
builder.add_edge(START, "Oracle")
builder.add_edge("Oracle", "Reworder")
builder.add_edge("Reworder", END)

graph = builder.compile()
