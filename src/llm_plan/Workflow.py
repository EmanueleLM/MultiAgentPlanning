import json
import subprocess
import shlex
import ast
import re
from datetime import datetime
from langchain_core.messages import (
    SystemMessage,
    HumanMessage,
    AIMessage,
    ToolMessage,
    AnyMessage,
)
from langchain_core.tools import tool
from langchain_openai import ChatOpenAI
from langgraph.graph import START, END, StateGraph
from langgraph.graph.message import add_messages
from langgraph.prebuilt import tools_condition, ToolNode, create_react_agent
from langgraph.constants import Send
from langchain.output_parsers import PydanticOutputParser
from typing import Annotated, TypedDict, Literal, Optional, Any
from langgraph.types import interrupt
from pydantic import BaseModel, Field
from pathlib import Path
from llm_plan.environment import Environment as TaskEnvironment
from llm_plan.utils import get_fields_in_formatted_string, get_json_nested_fields
from llm_plan.hypervisor import Hypervisor
from llm_plan.config import (
    UNIVERSAL_VALIDATOR_BIN,
    UNIVERSAL_VALIDATOR,
    SOLVER_BINARY,
    SOLVER_ARGS,
)
from llm_plan.parser import PDDLParser

MODEL = "gpt-4o"  # use 4o for everything else
MODEL_PDDL = "gpt-4o"  # need better model for pddl
JSON_OUTPUT_PATH = "./tmp"
ACTOR_OUTPUT_PATH = "./tmp"
EXAMPLE_JSON = "./example_json"
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
def _collect_qas(new_msgs: list[AnyMessage]) -> list[QnA]:
    """Extract Q/A pairs from AskBatchClarify tool calls and results."""
    qas: list[QnA] = []
    questions_by_id: dict[str, list[str]] = {}
    print()
    print("new messages:")
    print(new_msgs)

    for m in new_msgs:
        if isinstance(m, AIMessage) and m.tool_calls:
            for tc in m.tool_calls:
                if tc.get("name") == "AskBatchClarify":
                    questions_by_id[tc["id"]] = tc.get("args", {}).get("questions", [])

        elif isinstance(m, ToolMessage) and m.name == "AskBatchClarify":
            qs = questions_by_id.get(m.tool_call_id, [])
            response_dict = ast.literal_eval(m.content)
            answers = response_dict.get("answers", [])
            for q, a in zip(qs, answers):
                qas.append({"question": q, "answer": a})
    print(f"QAs: {qas}")
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
    goal: dict = Field(
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

    mode: Literal["pddl", "direct"]
    multi_agent: bool  # whether it's a multi agent problem
    messages: Annotated[list[AnyMessage], add_messages]
    initial_description: Annotated[
        str, _set_once
    ]  # initial human NL description of the task
    clarifications: Annotated[
        list[QnA], list.__add__
    ]  # sequence of interactions for clarification
    revised_description: str  # revised, structured description of the task
    plan_json: dict[str, Any]  # parsed_model.model_dump() -> dict[str, Any]
    problem_name: str  # name of the planning problem
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
    problem_name: str  # problem name, to save output in correct folder
    name: str  # agent name
    task: Literal["pddl"]  # task mode, e.g. pddl. Can add others in future
    sys_msg: str
    prompt: str
    inputs: list[str]
    output: str
    is_final: bool


class RefinerState(TypedDict):
    problem_name: str  # problem name, to save output in correct folder
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


@tool("AskBatchClarify")
def ask_batch_clarify(questions: list[str]) -> dict:
    """Ask multiple clarifications at once. Return a dict mapping to answers."""
    answers = interrupt({"purpose": "clarifications_batch", "questions": questions})
    # Expect resume payload like: {"answers": ["ans1","ans2",...]} or dict
    return {"answers": answers}


# define llms
oracle_llm = ChatOpenAI(model=MODEL, temperature=0)
# use schema to enforce json structure to some extent
# somehow ChatOpenAI doesn't like .with_structured_output, so have to put format instructions in agent
coder_json_llm = ChatOpenAI(model=MODEL, temperature=0)
pddl_llm = ChatOpenAI(model=MODEL_PDDL, temperature=0)
refiner_llm = ChatOpenAI(model=MODEL, temperature=0)


# define agents
oracle_sys_msg = (
    "You are an expert in planning. Your job is only to decide whether there is "
    "enough info to make a plan. If more than one clarification is needed, "
    "call AskBatchClarify with a list of questions (one call per turn). Then wait for answers."
    "You do not need to make a plan or ask for confirmation to ask questions. "
    "Do not ask questions for the sake of asking. Only ask if something is unclear or unspecified in the task description."
)

oracle = create_react_agent(
    model=oracle_llm.bind_tools([ask_batch_clarify], parallel_tool_calls=False),
    tools=[ask_batch_clarify],
    prompt=oracle_sys_msg,
    tool_choice="auto",
)


def agent_oracle(state: State):
    # validate fields
    _validate_initial_state_fields(state)

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
        "messages": out["messages"],
        "clarifications": _collect_qas(out["messages"][1:]),
    }


def agent_summarizer(state: State):
    sys_msg = (
        "You are given the initial description of a planning task and subsequent clarifications."
        "Rewrite task descriptions into a crisp, structured brief. Prefer specifics from clarifications"
        "over the initial description."
    )
    task_info = f"Initial description: {state["initial_description"]}\n"
    if state["clarifications"]:
        task_info += f"clarifications: {'\n'.join([f'{pair["question"]} - {pair["answer"]}' for pair in state["clarifications"]])}"
    inp = [SystemMessage(content=sys_msg), HumanMessage(content=task_info)]
    out = oracle_llm.invoke(inp)
    return {"messages": [out], "revised_description": out.content}


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
                "messages": [out],
                "json_error": str(e),
            }

    # write json to file, name with timestamp to avoid clash
    plan_name = parsed_plan.get("name", "unnamed_plan").replace(" ", "_")
    timestamp = datetime.now().strftime("%Y%m%d_%H%M%S")
    json_path = Path(f"{JSON_OUTPUT_PATH}/{plan_name}/{plan_name}_{timestamp}.json")
    json_path.write_text(json.dumps(parsed_plan, indent=2))

    return {
        "messages": [out],
        "plan_json": parsed_plan,
        "problem_name": plan_name,
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
    response_text = response.content

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


def external_solver(state: State):
    problem_name = state["problem_name"]
    base_dir = (
        Path(__file__).parent / (ACTOR_OUTPUT_PATH + f"/{problem_name}")
    ).resolve()

    domain_path = state["pddl"]["domain_path"]
    problem_path = state["pddl"]["problem_path"]
    # run fd
    command = [
        SOLVER_BINARY,
        *SOLVER_ARGS,
        str(base_dir / "sas_plan"),
        domain_path,
        problem_path,
    ]
    if state["WSL"]:
        command = ["wsl"] + command

    with open(base_dir / "logs.txt", "w") as logfile:
        subprocess.run(command, stdout=logfile, stderr=subprocess.STDOUT)


def proceed_to_solver(
    state: State,
) -> Literal["External solver", "Workflow splitter", "Init refiner state"]:
    if state["is_final"]:
        if state["refinement_iters"] > 0:
            return "Init refiner state"
        return "External solver"
    return "Workflow splitter"


def refine_or_end(state: RefinerState):
    if state["curr_refinement_iter"] < state["refinement_iters"]:
        state["curr_refinement_iter"] += 1
        return "Select refiner"
    return END


def init_refiner_state(state: State):
    return {
        "refinement_iters": state["refinement_iters"],
        "refiner_args": {
            "plan": "No plan yet.",
            "specification": state["environment"].config_data,
            "pddl_domain": state["pddl"]["domain"],
            "pddl_problem": state["pddl"]["problem"],
            "syntax_errors": "No error file yet.",
            "pddl_logs": "No log file yet.",
            "history": [],
        },
        "problem_name": state["problem_name"],
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

    return {"hypervisor": hypervisor, "acting_agent_name": agent_name}


def agent_refiner(state: RefinerState):
    hypervisor = state["hypervisor"]
    acting_agent_name = state["acting_agent_name"]
    refiner_args = state["refiner_args"]
    problem_name = state["problem_name"]
    base_dir = (
        Path(__file__).parent / (ACTOR_OUTPUT_PATH + f"/{problem_name}")
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

    with open(base_dir / "problem.pddl", "w") as f:
        f.write(problem)

    with open(base_dir / "domain.pddl", "w") as f:
        f.write(domain)

    # Launch the solver
    command = [
        SOLVER_BINARY,
        *SOLVER_ARGS,
        str(base_dir / "sas_plan"),
        str(base_dir / "domain.pddl"),
        str(base_dir / "problem.pddl"),
    ]
    if state["WSL"]:
        command = ["wsl"] + command

    with open(base_dir / "logs.txt", "w") as logfile:
        subprocess.run(command, stdout=logfile, stderr=subprocess.STDOUT)

    # Validate the plan with VAL
    if state["WSL"]:
        command = f"wsl cd {UNIVERSAL_VALIDATOR} && ./Validate \
        {base_dir / 'domain.pddl'} \
        {base_dir / 'problem.pddl'} \
        {base_dir / 'sas_plan'}"
    else:
        command = f"{UNIVERSAL_VALIDATOR_BIN} \
        {base_dir / 'domain.pddl'} \
        {base_dir / 'problem.pddl'} \
        {base_dir / 'sas_plan'}"

    out = subprocess.run(command, shell=True, capture_output=True, text=True)

    # This part won't be printed at test time
    if out.stderr:
        pddl_error = out.stderr
        # print(f"The validation found a problem with the plan: {out.stderr}")
    else:
        pddl_error = "No error found."
        # print("The plan is valid.")
        # print("[stdout]", out.stdout)

    with open(base_dir / "logs.txt", "r") as f:
        pddl_logs = f.read()

    # Syntax errors and logs
    refiner_args["syntax_errors"] = pddl_error
    refiner_args["pddl_logs"] = pddl_logs

    # History
    hypervisor.history.append(acting_agent_name)
    refiner_args["history"] = hypervisor.history

    return {"refiner_args": refiner_args}


# build graph
def build_graph():
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
    builder.add_node("Init refiner state", init_refiner_state)
    builder.add_node("Select refiner", select_agent)
    builder.add_node("Refiner", agent_refiner)

    # edges
    builder.add_edge(START, "Oracle")
    builder.add_edge("Oracle", "Reworder")
    builder.add_edge("Reworder", "JSON coder")
    builder.add_edge("JSON coder", "Task Environment Constructor")
    builder.add_edge("Task Environment Constructor", "Workflow splitter")
    builder.add_conditional_edges(
        "Workflow splitter", continue_to_workflow, ["Actor node"]
    )
    builder.add_conditional_edges("Actor node", proceed_to_solver)
    builder.add_edge("Init refiner state", "Select refiner")
    builder.add_edge("Select refiner", "Refiner")
    builder.add_conditional_edges("Refiner", refine_or_end)
    builder.add_edge("External solver", END)

    return builder


graph = build_graph().compile()
