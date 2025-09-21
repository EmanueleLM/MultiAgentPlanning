import json
import shlex
import subprocess

# import shlex
import ast
import re
import requests
from bs4 import BeautifulSoup
from typing import Type
from datetime import datetime
from langchain_core.messages import (
    SystemMessage,
    HumanMessage,
    AIMessage,
    ToolMessage,
    AnyMessage,
)
from langchain_core.tools import tool, BaseTool
from langchain_openai import ChatOpenAI
from langgraph.graph import START, END, StateGraph
from langgraph.graph.message import add_messages
from langgraph.prebuilt import create_react_agent
from langgraph.constants import Send
from langchain.output_parsers import PydanticOutputParser
from typing import Annotated, TypedDict, Literal, Optional, Any
from langgraph.types import interrupt
from pydantic import BaseModel, Field
from pathlib import Path, PurePosixPath
from llm_plan.environment import Environment as TaskEnvironment
from llm_plan.utils import get_fields_in_formatted_string, get_json_nested_fields
from llm_plan.hypervisor import Hypervisor
from llm_plan.agent_nl import AgentNaturalLanguage
from llm_plan.meta_analyzer import MetaAnalyzer
from llm_plan.config import (
    VALIDATOR,
    VALIDATOR_BIN,
    SOLVER_FD_BINARY,
    SOLVER_POPF2_BINARY,
    SOLVER_FD_ARGS,
)
from llm_plan.parser import PDDLParser

MODEL = "gpt-5-mini"  # Use same model for everything but adjust reasoning effort.
JSON_OUTPUT_PATH = "../../tmp"
ACTOR_OUTPUT_PATH = "../../tmp"
EXAMPLE_JSON = "./example_json"
ENVIRONMENT_CLASS = "./environment.py"
TEMPORAL = True  # whether to use temporal planner POPF2. If False, use Fast Downward
if TEMPORAL:
    PLANNER = "popf2"
else:
    PLANNER = "fast-downward"

# pages for the planning.wiki search tool
VALID_PAGES = [
    "/pddl",
    "/pddl/requirements",
    "/pddl/domain",
    "/pddl/problem",
    "/pddl21",
    "/pddl21/req",
    "/pddl21/domain",
    "/pddl21/problem",
    "/pddl22",
]


# helper functions
# set once reducer for initial description
def _set_once(curr: str | None, new: str | None) -> str | None:
    return curr if curr else new


class QnA(TypedDict):
    """Storing clarification questions and answers."""

    question: str
    answer: str


# helper functions
def _collect_qas(new_msgs: list[AnyMessage]) -> list[QnA]:
    """Extract Q/A pairs from AskBatchClarify tool calls and results."""
    qas: list[QnA] = []
    questions_by_id: dict[str, list[str]] = {}

    for m in new_msgs:
        if isinstance(m, AIMessage) and m.tool_calls:
            for tc in m.tool_calls:
                if tc.get("name") == "AskBatchClarify":
                    questions_by_id[tc["id"]] = tc.get("args", {}).get("questions", [])

        elif isinstance(m, ToolMessage) and m.name == "AskBatchClarify":
            qs = questions_by_id.get(m.tool_call_id, [])
            response_dict = ast.literal_eval(m.text())
            answers = response_dict.get("answers", [])
            for q, a in zip(qs, answers):
                qas.append({"question": q, "answer": a})
    return qas


def _win_to_wsl_path(p: Path) -> str:
    """Convert a Windows path to WSL (/mnt/drive/...) form."""
    p = p.resolve()
    drive = p.drive.rstrip(":").lower()
    return f"/mnt/{drive}" + "/" + "/".join(p.parts[1:])


def _extract(text: str, anchor: str) -> str:
    start = text.find(anchor)
    if start == -1:
        raise ValueError(f"Anchor not found: {anchor!r}")
    depth = 0
    end = None
    for i, c in enumerate(text[start:], start):
        if c == "(":
            depth += 1
        elif c == ")":
            depth -= 1
            if depth == 0:
                end = i
                break
    if end is None:
        raise ValueError(f"Unbalanced parentheses for anchor {anchor!r}")
    return text[start : end + 1]  # noqa E203


# Schemas for controlling JSON format
class CustomBaseModel(BaseModel):
    model_config = {"arbitrary_types_allowed": True}


class AgentInfo(BaseModel):
    private_information: list[str] = Field(
        default_factory=list, description="Private facts/constraints for the agent."
    )
    goal: str = Field(
        ..., description="Agent-specific (possibly global) goal description."
    )


class AgentsSection(BaseModel):
    number: int = Field(..., description="Number of agents.")
    names: list[str] = Field(..., description="List of agent names.")
    agent_details: dict[str, AgentInfo] = Field(
        default_factory=dict,
        description="Mapping of agent name to AgentInfo. Keys are entries listed in 'names'.",
    )


class Environment(BaseModel):
    init: dict = Field(
        ...,
        description="Initial world state, different depending on the planning task.",
    )
    goal: str | dict = Field(
        ...,
        description="Goal state for the environment, different depending on the planning task.",
    )
    public_information: list[str] = Field(
        default_factory=list, description="Global public facts about the environment."
    )


class AgentSpec(BaseModel):
    task: str = Field(..., description="Task name for this agent.")  # pddl or obs
    input: list[str] = Field(..., description="Inputs (references to other artifacts).")
    output: str = Field(..., description="Output artifact name.")
    system_prompt: str = Field(..., description="System prompt for this agent.")
    prompt: str = Field(
        ..., description="Human prompt (task specific prompt) for this agent."
    )


class WorkflowSpec(BaseModel):
    # mapping of participant name to AgentSpec
    participants: dict[str, AgentSpec] = Field(
        default_factory=dict,
        description="Per-participant generation specification.",
    )
    order_constraints: list[str] = Field(
        default_factory=list,
        description="List of order constraint expressions for which tasks should come before others, e.g. 'task1->task2'.",
    )


class PlanSchema(CustomBaseModel):
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

    mode: Literal["pddl", "direct"]
    multi_agent: bool  # whether it's a multi agent problem
    enable_clarifications: bool = (
        True  # whether to allow the clarifier to ask clarifications
    )
    messages: Annotated[list[AnyMessage], add_messages]
    initial_description: Annotated[
        str, _set_once
    ]  # initial human NL description of the task
    clarifications: Annotated[
        list[QnA], list.__add__
    ]  # sequence of interactions for clarification
    revised_description: str  # revised, structured description of the task
    plan_json: dict[str, Any]  # parsed_model.model_dump() -> dict[str, Any]
    folder_name: str  # folder to save outputs for this problem
    environment: TaskEnvironment  # environment object for the problem
    workflow: list[list[str]]  # environment.plan
    current_step: int = 0
    num_steps: int  # number of sequential steps in the planning workflow
    pddl: dict[
        str, str
    ]  # domain and problem PDDL names and paths from orchestrator, for solver
    agent_configs: list[tuple]  # configurations for agents in the current parallel step
    is_final: bool = False  # whether this is the final step in the workflow
    refinement_iters: int  # number of refinement iterations by the hypervisor
    WSL: bool = True


# state for a generic agent, including actors and orchestrator
class AgentState(TypedDict):
    folder_name: str  # folder name, to save output in correct folder
    name: str  # agent name
    task: Literal["pddl"]  # task mode, e.g. pddl. Can add others in future
    sys_msg: str
    prompt: str
    inputs: list[str]
    output: str
    is_final: bool


class RefinerState(TypedDict):
    folder_name: str  # folder name, to save output in correct folder
    refinement_iters: int  # number of refinement iterations by the hypervisor
    curr_refinement_iter: int = 0
    hypervisor: Hypervisor
    acting_agent_name: str  # current refinement agent name
    refiner_args: dict[str, Any]  # arguments to pass to the refiner agent
    WSL: bool


def _validate_initial_state_fields(state: State):
    """
    Ensure caller supplied required initial fields and enforce:
      - if multi_agent is False, mode must be 'direct'
    Raises ValueError on invalid inputs.
    """
    if "mode" not in state or "multi_agent" not in state:
        raise ValueError(
            "Initial state must include both 'mode' and 'multi_agent' fields."
        )
    mode = state["mode"]
    multi = state["multi_agent"]
    if not isinstance(multi, bool):
        raise ValueError("'multi_agent' must be a boolean.")
    if mode not in ("pddl", "direct"):
        raise ValueError("'mode' must be one of: 'pddl', 'direct'.")
    if not multi and mode != "direct":
        raise ValueError("If 'multi_agent' is False then 'mode' must be 'direct'.")


# tools
@tool("AskBatchClarify")
def ask_batch_clarify(questions: list[str]) -> dict:
    """Ask multiple clarifications at once. Return a dict mapping to answers."""
    answers = interrupt({"purpose": "clarifications_batch", "questions": questions})
    # Expect resume payload like: {"answers": ["ans1","ans2",...]} or dict
    return {"answers": answers}


class PlanningWikiInput(BaseModel):
    """Input for the PlanningWikiTool."""

    page_suffix: str = Field(
        description=f"The specific page to retrieve from planning.wiki/ref. Must be one of {VALID_PAGES}"
    )


class PlanningWikiTool(BaseTool):
    """
    A tool to retrieve PDDL syntax and requirements documentation
    from specific pages on planning.wiki/ref.
    """

    name: str = "planning_wiki_lookup"
    description: str = (
        "Useful for when you need to verify the correct PDDL syntax, especially for specific versions "
        "like PDDL2.1 or features like durative-actions, numeric fluents or requirements."
        "Use it to look up the authoritative syntax before making corrections."
    )
    args_schema: Type[BaseModel] = PlanningWikiInput

    def _run(self, page_suffix: str) -> str:
        """Use the tool."""
        if page_suffix not in VALID_PAGES:
            return f"Error: Invalid page '{page_suffix}'. Please use one of the following valid pages: {VALID_PAGES}"

        url = f"https://planning.wiki/ref{page_suffix}"
        try:
            response = requests.get(url, timeout=5)
            response.raise_for_status()  # raise an exception for bad status codes

            soup = BeautifulSoup(response.content, "html.parser")

            # find the main content div, which seems to have the role 'main'
            main_content = soup.find("div", role="main")
            if main_content:
                # get text and clean it up a bit
                return " ".join(main_content.get_text().split())
            else:
                return "Error: Could not find the main content of the page."

        except requests.exceptions.RequestException as e:
            return f"Error: Could not retrieve the page. Reason: {e}"


# define llms
default_reasoning = {"effort": "low", "summary": None}
medium_reasoning = {"effort": "medium", "summary": None}
high_reasoning = {"effort": "high", "summary": None}

clarifier_llm = ChatOpenAI(model=MODEL, reasoning=default_reasoning)
# use schema to enforce json structure to some extent
# somehow ChatOpenAI doesn't like .with_structured_output, so have to put format instructions in agent
coder_json_llm = ChatOpenAI(model=MODEL, reasoning=default_reasoning)
pddl_llm = ChatOpenAI(model=MODEL, reasoning=medium_reasoning)
refiner_llm = ChatOpenAI(model=MODEL, reasoning=default_reasoning)
meta_analyzer_llm = ChatOpenAI(model=MODEL, reasoning=default_reasoning)


# define agents
clarifier_sys_msg = (
    "You are an expert in planning. Your job is only to decide whether there is "
    "enough info to make a plan. If more than one clarification is needed, "
    "call AskBatchClarify with a list of questions (one call per turn). Then wait for answers."
    "You do not need to make a plan or ask for confirmation to ask questions. "
    "Do not ask questions for the sake of asking. Only ask if something is unclear or unspecified in the task description."
)

clarifier = create_react_agent(
    model=clarifier_llm.bind_tools([ask_batch_clarify], parallel_tool_calls=False),
    tools=[ask_batch_clarify],
    prompt=clarifier_sys_msg,
    tool_choice="auto",
)


def agent_clarifier(state: State):
    # validate fields
    _validate_initial_state_fields(state)

    init = {}
    if not state.get("initial_description"):
        human_texts = [
            m.text() for m in state["messages"] if getattr(m, "type", "") == "human"
        ]
        if human_texts:
            # first human message is used to invoke graph, should just be a single message with task desc.
            init["initial_description"] = human_texts[0]
    if state["enable_clarifications"]:
        inp = {"messages": state["messages"]}
        out = clarifier.invoke(inp)
        return {
            **init,
            "messages": out["messages"],
            "clarifications": _collect_qas(out["messages"][1:]),
        }
    else:
        return init


def agent_summarizer(state: State):
    sys_msg = (
        "You are given the initial description of a planning task and subsequent clarifications (if any)."
        "Rewrite task descriptions into a crisp, structured brief. Prefer specifics from clarifications"
        "over the initial description."
    )
    task_info = f"Initial description: {state["initial_description"]}\n"
    if state["clarifications"]:
        task_info += f"clarifications: {'\n'.join([f'{pair["question"]} - {pair["answer"]}' for pair in state["clarifications"]])}"
    inp = [SystemMessage(content=sys_msg), HumanMessage(content=task_info)]
    out = clarifier_llm.invoke(inp)
    return {"messages": [out], "revised_description": out.text()}


def agent_coder_json(state: State):
    sys_msg_prefix = (
        "You are an expert programmer. Given a structured brief of a planning problem, "
        "generate a comprehensive JSON representation of the planning problem, following the example given. "
        "The JSON should include a breakdown of tasks and knowledge for each agent and the orchestrator (also an agent). "
        "Depending on the problem, the structure of the init and goal fields of the environment may vary. "
    )
    sys_msg_direct = (
        "The orchestrator will be the only participant in the workflow, prompted with initial information about the environment and the goal,"
        "as well as the constraints of each agent, and is responsible for generating a PDDL domain and problem file that coordinates the agents."
        "The order_constraints field of workflow should simply be 'orchestrator.pddl'."
    )
    sys_msg_pddl = (
        "Each agent generates a PDDL domain + problem and sends it to the orchestrator that generates the final plan. "
        "Each order constraint should strictly be of the form [agent name].[task]->[agent name].[task], specifying which"
        "tasks should be completed before which others. For example, 'Agent1.pddl->orchestrator.pddl.'"
    )
    # constructs prompt and selects example json based on multi/single agent and operating mode.
    if state["mode"] == "direct":
        sys_msg = sys_msg_prefix + sys_msg_direct
        if state["multi_agent"]:
            example_json_path = EXAMPLE_JSON + "/example_json_multi_direct.json"
        else:
            example_json_path = EXAMPLE_JSON + "/example_json_single.json"
    else:
        sys_msg = sys_msg_prefix + sys_msg_pddl
        example_json_path = EXAMPLE_JSON + "/example_json_multi_pddl.json"

    format_instructions = plan_parser.get_format_instructions()
    with open(example_json_path, "r") as f:
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

    # extract json depending on the output structure.
    assistant_text = ""
    if hasattr(out, "content"):
        assistant_text = out.text()
    else:
        assistant_text = out.text()

    try:
        parsed_model = plan_parser.parse(assistant_text)
        parsed_plan = parsed_model.model_dump()
    except Exception as e:
        raise ValueError(f"Error parsing plan: {str(e)}")

    # write json to file, name with timestamp to avoid clash
    plan_name = parsed_plan.get("name", "unnamed_plan").replace(" ", "_")
    timestamp = datetime.now().strftime("%Y%m%d_%H%M%S")
    folder_name = f"{timestamp}_{plan_name}"

    json_path = Path(f"{JSON_OUTPUT_PATH}/{folder_name}/{folder_name}.json")
    json_path.parent.mkdir(parents=True, exist_ok=True)
    json_path.write_text(json.dumps(parsed_plan, indent=2), encoding="utf-8")

    return {
        "messages": [out],
        "plan_json": parsed_plan,
        "folder_name": folder_name,
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

        # Extract fields from the prompt
        prompt_fields_to_fill = get_fields_in_formatted_string(prompt)

        # Fill the missing information in the prompt
        for field in prompt_fields_to_fill:
            # Static fields (i.e., what is not dynamic)
            if "->" in field:
                v = get_json_nested_fields(environment.config_data, field.split("->"))
                prompt = prompt.replace(f"{{{field}}}", str(v))

            # Dynamic fields
            else:
                prompt = prompt.replace(f"{{{field}}}", environment.config_data[field])

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
                "folder_name": state["folder_name"],
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
    folder_name = state["folder_name"]
    name = state["name"]
    sys_msg = state["sys_msg"]
    prompt = state["prompt"]
    inputs = state["inputs"]
    output = state["output"]

    base_dir = (
        Path(__file__).parent / (ACTOR_OUTPUT_PATH + f"/{folder_name}")
    ).resolve()

    formatted_parts: list[str] = []
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

    formatted_inputs = ""
    if inputs:
        formatted_inputs = "[Inputs]:\n" + "".join(formatted_parts)

    # Invoke the PDDL LLM with system message and a human message containing the prompt + formatted inputs
    prompt_with_inputs = prompt + "\n\n" + formatted_inputs
    response = pddl_llm.invoke(
        [SystemMessage(content=sys_msg), HumanMessage(content=prompt_with_inputs)]
    )
    response_text = response.text()

    # if task mode is pddl:
    if state["task"] == "pddl":
        # extract domain and problem from pddl
        # assume system message instructed agent to enclose <> tags
        domain = response_text.split("<domain>")[1].split("</domain>")[0]
        problem = response_text.split("<problem>")[1].split("</problem>")[0]

        # another safety net to ensure only raw pddl is extracted
        domain_text = _extract(domain, "(define (domain")
        problem_text = _extract(problem, "(define (problem")

        domain_path = base_dir / f"{output}_domain.pddl"
        problem_path = base_dir / f"{output}_problem.pddl"
        # create directory if doesn't exist
        base_dir.mkdir(parents=True, exist_ok=True)

        domain_path.write_text(domain_text, encoding="utf-8")
        problem_path.write_text(problem_text, encoding="utf-8")

    # If final step and orchestrator, store the final domain and problem content
    if name == "orchestrator" and state["is_final"]:
        return {
            "pddl": {
                "domain": domain_text,
                "problem": problem_text,
                "domain_path": domain_path,
                "problem_path": problem_path,
            },
        }

    # TODO: add additional logic for other task modes (this refers to the formal planning language structure used, and is not the same as the 'mode' field in state!)

    return {}


def run_planner(base_dir: Path, wsl: bool):
    if PLANNER == "popf2":
        base_dir.mkdir(parents=True, exist_ok=True)

        if wsl:
            command = ["wsl", "--", str(PurePosixPath(SOLVER_POPF2_BINARY))] + [
                _win_to_wsl_path(base_dir / "domain.pddl"),
                _win_to_wsl_path(base_dir / "problem.pddl"),
            ]
        else:
            command = [
                str(Path(SOLVER_POPF2_BINARY)),
                str(base_dir / "domain.pddl"),
                str(base_dir / "problem.pddl"),
            ]
        print("Running command:", " ".join(shlex.quote(arg) for arg in command))
        # Capture combined stdout/stderr to parse
        result = subprocess.run(
            command,
            stdout=subprocess.PIPE,
            stderr=subprocess.STDOUT,
            text=True,
            check=False,
        )

        output = result.stdout or ""
        logs_path = base_dir / "logs.txt"
        plan_path = base_dir / "sas_plan"

        # Match plan lines that typically look like: "0.000: (action arg...)  [duration]"
        plan_line_re = re.compile(r"^\s*\d+(?:\.\d+)?:\s*\(", re.ASCII)
        print("Solver output:\n", output)
        if "Solution Found" in output:
            lines = output.splitlines()

            header_lines: list[str] = []
            plan_lines: list[str] = []
            plan_started = False

            for line in lines:
                if plan_line_re.match(line):
                    plan_started = True
                    plan_lines.append(line.strip())
                else:
                    if not plan_started:
                        header_lines.append(line)

            # Write header and summary to logs.txt
            with logs_path.open("w", encoding="utf-8") as lf:
                lf.write("\n".join(header_lines).rstrip() + "\n")

            # Write the extracted plan only to sas_plan
            with plan_path.open("w", encoding="utf-8") as pf:
                pf.write("\n".join(plan_lines).rstrip() + ("\n" if plan_lines else ""))

        else:
            # No solution or error: everything goes to logs.txt
            with logs_path.open("w", encoding="utf-8") as lf:
                lf.write(output.strip())
    elif PLANNER == "fast-downward":
        if wsl:
            command = (
                ["wsl", "--"]
                + [str(PurePosixPath(SOLVER_FD_BINARY)), *SOLVER_FD_ARGS]
                + [
                    _win_to_wsl_path(base_dir / "sas_plan"),
                    _win_to_wsl_path(base_dir / "domain.pddl"),
                    _win_to_wsl_path(base_dir / "problem.pddl"),
                ]
            )
        else:
            command = [Path(SOLVER_FD_BINARY), *SOLVER_FD_ARGS] + [
                str(base_dir / "sas_plan"),
                str(base_dir / "domain.pddl"),
                str(base_dir / "problem.pddl"),
            ]

        with open(base_dir / "logs.txt", "w") as logfile:
            subprocess.run(command, stdout=logfile, stderr=subprocess.STDOUT)
    else:
        raise ValueError(f"Unknown planner: {PLANNER}")

    # Validate the plan with VAL
    if wsl:
        cmd_body = (
            f"cd {shlex.quote(str(PurePosixPath(VALIDATOR)))} && "
            f"./Validate "
            f"{shlex.quote(_win_to_wsl_path(base_dir / 'domain.pddl'))} "
            f"{shlex.quote(_win_to_wsl_path(base_dir / 'problem.pddl'))} "
            f"{shlex.quote(_win_to_wsl_path(base_dir / 'sas_plan'))}"
        )
        command = ["wsl", "bash", "-lc", cmd_body]
    else:
        command = f"{VALIDATOR_BIN} \
        {str(base_dir / 'domain.pddl')} \
        {str(base_dir / 'problem.pddl')} \
        {str(base_dir / 'sas_plan')}"

    out = subprocess.run(command, shell=True, capture_output=True, text=True)

    # This part won't be printed at test time
    if out.stderr:
        pddl_error = out.stderr
        # print(f"The validation found a problem with the plan: {out.stderr}")
    else:
        pddl_error = "No error found."
        # print("The plan is valid.")
        # print("[stdout]", out.stdout)
    return pddl_error


# This is just a shortcut branch if don't want to do refinement
def external_solver(state: State):
    folder_name = state["folder_name"]
    base_dir = (
        Path(__file__).parent / (ACTOR_OUTPUT_PATH + f"/{folder_name}")
    ).resolve()

    domain_path = state["pddl"]["domain_path"]
    problem_path = state["pddl"]["problem_path"]
    # run solver
    # if using temporal planner (popf2)
    if PLANNER == "popf2":
        base_dir.mkdir(parents=True, exist_ok=True)

        if state["WSL"]:
            command = ["wsl", "--", str(PurePosixPath(SOLVER_POPF2_BINARY))] + [
                _win_to_wsl_path(domain_path),
                _win_to_wsl_path(problem_path),
            ]
        else:
            command = [
                str(Path(SOLVER_POPF2_BINARY)),
                str(domain_path),
                str(problem_path),
            ]
        print("Running command:", " ".join(shlex.quote(arg) for arg in command))
        # Capture combined stdout/stderr to parse
        result = subprocess.run(
            command,
            stdout=subprocess.PIPE,
            stderr=subprocess.STDOUT,
            text=True,
            check=False,
        )

        output = result.stdout or ""
        logs_path = base_dir / "logs.txt"
        plan_path = base_dir / "sas_plan"

        # Match plan lines that typically look like: "0.000: (action arg...)  [duration]"
        plan_line_re = re.compile(r"^\s*\d+(?:\.\d+)?:\s*\(", re.ASCII)
        print("Solver output:\n", output)
        if "Solution Found" in output:
            lines = output.splitlines()

            header_lines: list[str] = []
            plan_lines: list[str] = []
            plan_started = False

            for line in lines:
                if plan_line_re.match(line):
                    plan_started = True
                    plan_lines.append(line.strip())
                else:
                    if not plan_started:
                        header_lines.append(line)

            # Write header and summary to logs.txt
            with logs_path.open("w", encoding="utf-8") as lf:
                lf.write("\n".join(header_lines).rstrip() + "\n")

            # Write the extracted plan only to sas_plan
            with plan_path.open("w", encoding="utf-8") as pf:
                pf.write("\n".join(plan_lines).rstrip() + ("\n" if plan_lines else ""))

        else:
            # No solution or error: everything goes to logs.txt
            with logs_path.open("w", encoding="utf-8") as lf:
                lf.write(output.strip())
    # if using fd
    elif PLANNER == "fast-downward":
        if state["WSL"]:
            command = (
                ["wsl", "--"]
                + [str(PurePosixPath(SOLVER_FD_BINARY)), *SOLVER_FD_ARGS]
                + [
                    _win_to_wsl_path(base_dir / "sas_plan"),
                    _win_to_wsl_path(domain_path),
                    _win_to_wsl_path(problem_path),
                ]
            )
        else:
            command = [Path(SOLVER_FD_BINARY), *SOLVER_FD_ARGS] + [
                str(base_dir / "sas_plan"),
                str(domain_path),
                str(problem_path),
            ]

        with open(base_dir / "logs.txt", "w") as logfile:
            subprocess.run(command, stdout=logfile, stderr=subprocess.STDOUT, text=True)
    else:
        raise ValueError(f"Unknown planner: {PLANNER}")


def proceed_to_solver(
    state: State,
) -> Literal["External solver", "Workflow splitter", "Init refiner state"]:
    if state["is_final"]:
        if state["refinement_iters"] > 0:
            return "Init refiner state"
        return "External solver"
    return "Workflow splitter"


def refine_or_end(
    state: RefinerState,
) -> Literal["Select refiner", "NL converter"]:
    if state["curr_refinement_iter"] < state["refinement_iters"]:
        return "Select refiner"
    else:
        return "NL converter"


def init_refiner_state(state: State):
    return {
        "refinement_iters": state["refinement_iters"],
        "refiner_args": {
            "target_solver": PLANNER,
            "human_specification": state["revised_description"],
            "specification": state["environment"].config_data,
            "pddl_domain": state["pddl"]["domain"],
            "pddl_problem": state["pddl"]["problem"],
            "pddl_plan": "No plan yet.",
            "syntax_errors": "No error file yet.",
            "pddl_logs": "No log file yet.",
            "history": [],
        },
        "folder_name": state["folder_name"],
        "curr_refinement_iter": 0,
        "WSL": state["WSL"],
    }


def select_agent(state: RefinerState):

    hypervisor = Hypervisor(state["refiner_args"])
    response = hypervisor.run(refiner_llm)

    match = re.search(r"<class>(.*?)</class>", response, re.DOTALL)
    if match:
        agent_name = match.group(1).strip()
    else:
        # default to AgentDeepThinkPDDL if no class is found
        agent_name = "AgentDeepThinkPDDL"

    return {
        "hypervisor": hypervisor,
        "acting_agent_name": agent_name,
        "curr_refinement_iter": state["curr_refinement_iter"] + 1,
    }


def break_loop(state: RefinerState) -> Literal["NL converter", "Refiner"]:
    if state["acting_agent_name"] == "NoOpAgent":
        return "NL converter"
    else:
        return "Refiner"


def agent_refiner(state: RefinerState):
    hypervisor = state["hypervisor"]
    acting_agent_name = state["acting_agent_name"]
    refiner_args = state["refiner_args"]
    folder_name = state["folder_name"]
    base_dir = (
        Path(__file__).parent / (ACTOR_OUTPUT_PATH + f"/{folder_name}")
    ).resolve()

    pddl_parser = PDDLParser()
    agent_class = hypervisor.agents[acting_agent_name]
    for arg in agent_class.required_args.keys():
        agent_class.required_args[arg] = refiner_args[arg]

    new_agent = agent_class(refiner_llm, agent_class.required_args)
    response = new_agent.run()

    # Get domain and plan
    domain, problem = pddl_parser.parse(response, from_file=False)
    refiner_args["pddl_domain"] = domain
    refiner_args["pddl_problem"] = problem

    with open(base_dir / "problem.pddl", "w", encoding="utf-8") as f:
        f.write(problem)

    with open(base_dir / "domain.pddl", "w", encoding="utf-8") as f:
        f.write(domain)

    # Launch the solver
    # Planner output files: sas_plan, logs.txt. Returns pddl_error string
    pddl_error = run_planner(base_dir, state["WSL"])

    with open(base_dir / "logs.txt", "r") as f:
        pddl_logs = f.read()

    # Syntax errors and logs
    refiner_args["syntax_errors"] = pddl_error
    refiner_args["pddl_logs"] = pddl_logs

    # History
    hypervisor.history.append(acting_agent_name)
    refiner_args["history"] = hypervisor.history

    return {"refiner_args": refiner_args}


def plan_produced(
    state: RefinerState,
) -> Literal["Meta analyst", "Select refiner", "NL converter"]:
    # if plan file exists and is non-empty, go to meta analyst
    folder_name = state["folder_name"]
    base_dir = (
        Path(__file__).parent / (ACTOR_OUTPUT_PATH + f"/{folder_name}")
    ).resolve()

    if (base_dir / "sas_plan").exists() and (base_dir / "sas_plan").stat().st_size > 0:
        return "Meta analyst"
    return refine_or_end(state)


def agent_meta_analyst(state: RefinerState):

    refiner_args = state["refiner_args"]
    folder_name = state["folder_name"]
    base_dir = (
        Path(__file__).parent / (ACTOR_OUTPUT_PATH + f"/{folder_name}")
    ).resolve()
    with open(base_dir / "sas_plan", "r") as f:
        refiner_args["pddl_plan"] = f.read()

    pddl_parser = PDDLParser()
    for arg in MetaAnalyzer.required_args.keys():
        MetaAnalyzer.required_args[arg] = refiner_args[arg]

    analyzer = MetaAnalyzer(meta_analyzer_llm, MetaAnalyzer.required_args)
    response = analyzer.run()

    # Get domain and plan
    domain, problem = pddl_parser.parse(response, from_file=False)
    refiner_args["pddl_domain"] = domain
    refiner_args["pddl_problem"] = problem

    with open(base_dir / "problem.pddl", "w", encoding="utf-8") as f:
        f.write(problem)

    with open(base_dir / "domain.pddl", "w", encoding="utf-8") as f:
        f.write(domain)

    # Launch the solver
    # Planner output files: sas_plan, logs.txt. Returns pddl_error string
    pddl_error = run_planner(base_dir, state["WSL"])

    with open(base_dir / "logs.txt", "r") as f:
        pddl_logs = f.read()

    # Syntax errors and logs
    refiner_args["syntax_errors"] = pddl_error
    refiner_args["pddl_logs"] = pddl_logs

    return {"refiner_args": refiner_args}


def agent_to_nl(state: State | RefinerState):
    folder_name = state["folder_name"]
    base_dir = (
        Path(__file__).parent / (ACTOR_OUTPUT_PATH + f"/{folder_name}")
    ).resolve()

    with open(base_dir / "problem.pddl", "r") as f:
        problem = f.read()

    with open(base_dir / "domain.pddl", "r") as f:
        domain = f.read()
    try:
        with open(base_dir / "sas_plan", "r") as f:
            plan = f.read()
    except FileNotFoundError:
        raise FileNotFoundError(
            f"Plan file not found in {base_dir}. Ensure the solver ran successfully and produced a plan."
        )

    prompt_args = {
        "pddl_domain": domain,
        "pddl_problem": problem,
        "pddl_plan": plan,
    }
    try:
        prompt_args["specification"] = state["plan_json"]
    except KeyError:
        prompt_args["specification"] = state["refiner_args"]["specification"]

    hypervisor_to_nl = AgentNaturalLanguage(llm=refiner_llm, prompt_args=prompt_args)

    natural_plan = hypervisor_to_nl.run()

    with open(base_dir / "refined_nl_plan.txt", "w", encoding="utf-8") as f:
        f.write(natural_plan)


# build graph
def build_graph():
    builder = StateGraph(State)

    # nodes
    builder.add_node("Clarifier", agent_clarifier)
    # builder.add_node("Tool: ask_clarify", ToolNode([ask_clarify]))
    builder.add_node("Reworder", agent_summarizer)
    builder.add_node("JSON coder", agent_coder_json)
    builder.add_node("Task Environment Constructor", construct_environment)
    builder.add_node("Workflow splitter", workflow_splitter)
    builder.add_node("Actor node", generic_actor)
    builder.add_node("External solver", external_solver)
    builder.add_node("Init refiner state", init_refiner_state)
    builder.add_node("Select refiner", select_agent)
    builder.add_node("Refiner", agent_refiner)
    builder.add_node("NL converter", agent_to_nl)
    builder.add_node("Meta analyst", agent_meta_analyst)

    # edges
    builder.add_edge(START, "Clarifier")
    builder.add_edge("Clarifier", "Reworder")
    builder.add_edge("Reworder", "JSON coder")
    builder.add_edge("JSON coder", "Task Environment Constructor")
    builder.add_edge("Task Environment Constructor", "Workflow splitter")
    builder.add_conditional_edges(
        "Workflow splitter", continue_to_workflow, ["Actor node"]
    )
    builder.add_conditional_edges(
        "Actor node",
        proceed_to_solver,
        ["External solver", "Workflow splitter", "Init refiner state"],
    )
    builder.add_edge("Init refiner state", "Select refiner")
    builder.add_conditional_edges(
        "Select refiner", break_loop, ["Refiner", "NL converter"]
    )
    builder.add_conditional_edges(
        "Refiner", plan_produced, ["Meta analyst", "Select refiner", "NL converter"]
    )
    builder.add_conditional_edges(
        "Meta analyst", refine_or_end, ["Select refiner", "NL converter"]
    )
    builder.add_edge("External solver", "NL converter")
    builder.add_edge("NL converter", END)

    return builder


graph = build_graph().compile()
