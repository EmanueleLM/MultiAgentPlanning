"""
This class implements an agent, a piece of software that mixes neural (LLMs, etc.)
and formal techniques (VAL, uVal, etc.) to mitigate the issues of multi-agent planning.
The issues that we reckon are relevant in this context are:
- Correct PDDL syntax  ✔
- Hallucinations  ✔
- Asynchronicity
- Validity  ✔
- Optimality
- Partial observability

This class implements methods to check if:
- The plans (final and intermediate) are valid, executable and optimal.
- The final plan leverages asynchrnicity.
- The observations induce hallucinations in the final plan.
- The plans reflects the human specification.
- ...
"""

import inspect
import httpx
import asyncio
from bs4 import BeautifulSoup
from typing import Type
from abc import ABC, abstractmethod
from langchain_openai import ChatOpenAI
from langchain_core.tools import BaseTool
from langchain_core.messages import SystemMessage, HumanMessage
from langchain.tools.render import render_text_description
from langgraph.prebuilt import create_react_agent
from pydantic import BaseModel, Field


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
    "/pddl22/requirements",
    "/pddl22/domain",
    "/pddl22/problem",
]


# tool for AgentPDDLSyntax to search the wiki
class PlanningWikiInput(BaseModel):
    """Input for the PlanningWikiTool."""

    page_suffix: str = Field(
        description=f"The specific page to retrieve from planning.wiki/ref. Must be one of {VALID_PAGES}"
    )


class PlanningWikiTool(BaseTool):
    name: str = "planning_wiki_lookup"
    description: str = (
        "Useful for verifying PDDL syntax for versions/features (e.g., PDDL2.1 durative-actions, numeric fluents). "
        "Looks up documentation from planning.wiki/ref."
    )
    args_schema: Type[BaseModel] = PlanningWikiInput

    # async path
    async def _arun(self, page_suffix: str) -> str:
        if page_suffix not in VALID_PAGES:
            return f"Error: Invalid page '{page_suffix}'. Valid pages: {VALID_PAGES}"

        url = f"https://planning.wiki/ref{page_suffix}"
        timeout = httpx.Timeout(connect=5.0, read=5.0)
        headers = {"User-Agent": "MA-Planning/1.0 (+https://example.org)"}

        async with httpx.AsyncClient(
            timeout=timeout, headers=headers, follow_redirects=True
        ) as client:
            try:
                resp = await client.get(url)
                resp.raise_for_status()
            except httpx.HTTPError as e:
                return f"Error: Could not retrieve the page. Reason: {e}"

        soup = BeautifulSoup(resp.text, "html.parser")
        main = soup.find("div", role="main") or soup.find("main")
        return (
            " ".join(main.get_text().split())
            if main
            else "Error: Could not find the main content of the page."
        )

    def _run(self, page_suffix: str) -> str:
        raise NotImplementedError(
            "planning_wiki_lookup supports async only; call with ainvoke"
        )


class Agent(ABC):
    """
    Abstract class for an Agent.
    Each Agent mitigates a specific issue in multi-agent planning.
    The variable required_args is static and contains the arguments required by each Agent.
    """

    required_args: dict[str, str] = {}  # Static!

    def __init__(
        self,
        prompt_args: dict[str, str],
    ):
        """Initialize the Agent with a name and the arguments."""
        self.name = "AbstractAgent"
        self.prompt_args = prompt_args

    def upload_args(self, prompt_args: dict[str, str]) -> None:
        """
        Upload the arguments to the Agent.

        Input:
            prompt_args (dict): A dictionary containing the arguments.
        """
        for arg in Agent.required_args.keys():
            if arg not in prompt_args:
                raise ValueError(f"Missing required argument: {arg}")
            self.prompt_args[arg] = prompt_args[arg]

    @abstractmethod
    def run(self) -> str:
        """
        Run the Agent on the given plan.
        Each subclass will use this method to mitigate a specific issue.
        """
        return "This function should be implemented by subclasses."

    def get_required_args(self) -> dict[str, str]:
        """
        Get the required arguments for the Agent.

        Output:
            dict: A dictionary containing the required arguments.
        """
        return Agent.required_args


class AgentDeepThinkConstraints(Agent):
    required_args = {
        "human_specification": "(str) The human-readable specification of the task.",
        "specification": "(str) The plan to be checked for improvement.",
        "pddl_domain": "(str) The PDDL domain that describes the specification.",
        "pddl_problem": "(str) The PDDL problem that instantiates the specification.",
        "target_solver": "(str) The target PDDL solver.",
    }  # Static!

    def __init__(self, llm: ChatOpenAI, prompt_args: dict[str, str]):
        """
        This agent deeply evaluates whether the PDDL domain and problem are consistent with the specification.
        In particular:
        - It checks whether the PDDL problem reflects the particular instance of the specification. In particular, that all the constraints are correctly specified.
        - It checks whether the PDDL domain defines all the variables and the correct goal in the specification.

        Input:
            llm (ChatOpenAI): The language model to use for detecting and mitigating hallucinations.
            prompt_args: (dict[str, str]): A dictionary containing the arguments for each prompt.
        """
        super().__init__(prompt_args=prompt_args)
        self.name = "AgentDeepThinkConstraints"
        self.llm = llm

        # Prompts
        self.system_prompt = inspect.cleandoc(
            """\
                                             Your task is to analyze a provided problem against the human and JSON specifics. 
                                             You focus on the constraints of each agent and whether they are expressed as proper PDDL formulae.
                                             In particular, you focus on whether each agent's private information is expressed as constraints in the PDDL problem.
                                             You can think as much as you want before answering, and you can use as many steps as you want.
                                             """
        )
        self.prompt = inspect.cleandoc(
            """\
                                      Given this human specification of a task:
                                      <human_specification>{human_specification}</human_specification>
                                      
                                      This is a plan specification, in JSON format, of the task:
                                      <specification>{specification}</specification>
                                      
                                      Now, consider this PDDL domain that describes the specification:
                                      <domain>{pddl_domain}</domain>
                                      
                                      And this is the PDDL problem that instatiates the specification:
                                      <problem>{pddl_problem}</problem>
                                      
                                      Now, think *very carefully* whether:
                                      - the PDDL domain reflects the goal of the human and json specifications. Always consider the human specification and the ground truth.
                                      - the PDDL problem correctly enumerates and expresses all the constraints in the specification. Put particular attention that all the constraints are expressed and none is missing or under-specified.
                                      
                                      Return the PDDL domain between <domain> and </domain> tags, and the PDDL problem between <problem> and </problem> tags. 
                                      Just return the PDDL code, do not add special characters or comments.
                                      """
        )

    def run(self) -> str:
        """
        Run the Agent to solve hallucinations in the plan.

        Input:
            src (str): The plan to be fixed for hallucinations.

        Output:
            str: The fixed plan.
        """
        self.upload_args(self.prompt_args)  # ensure args are uploaded

        # Fix the plan
        prompt = self.prompt.format(
            human_specification=self.prompt_args["human_specification"],
            specification=self.prompt_args["specification"],
            pddl_domain=self.prompt_args["pddl_domain"],
            pddl_problem=self.prompt_args["pddl_problem"],
        )
        inp = [SystemMessage(content=self.system_prompt), HumanMessage(content=prompt)]
        return self.llm.invoke(inp).text()


class AgentEnforceMultiAgency(Agent):
    required_args = {
        "human_specification": "(str) The human-readable specification of the task.",
        "specification": "(str) The plan to be checked for improvement.",
        "pddl_domain": "(str) The PDDL domain that describes the specification.",
        "pddl_problem": "(str) The PDDL problem that instantiates the specification.",
        "target_solver": "(str) The target PDDL solver.",
    }  # Static!

    def __init__(self, llm: ChatOpenAI, prompt_args: dict[str, str]):
        """
        This agent identifies inconsistencies between the specific and the requirements in the context of a multi-agent system.
        In particular:
        - It checks whether the PDDL domain and plan correctly implement the specific as a multi-agent system.
        - It checks whether the PDDL domain and problem correctly identify each agent's action and treat them as distinct variables and entities.
        - Fixes all the issues mentioned above.

        Input:
            llm (ChatOpenAI): The language model to use for detecting and mitigating hallucinations.
            prompt_args: (dict[str, str]): A dictionary containing the arguments for each prompt.
        """
        super().__init__(prompt_args=prompt_args)
        self.name = "AgentEnforceMultiAgency"
        self.llm = llm

        # Prompts
        self.system_prompt = inspect.cleandoc(
            """\
                                             You are an agent that evaluates each plan's step. 
                                             Your task is to analyze a provided plan against the human specifics, and identify all the possible inconsistencies. 
                                             You focus on whether the PDDL domain and problem correctly identify each agent's action and treat them as distinct variables and entities.
                                             You aim is to return a plan that fixes all the inconsistencies and satisfies the goal.
                                             You can think as much as you want before answering, and you can use as many steps as you want.
                                             """
        )
        self.prompt = inspect.cleandoc(
            """\
                                      Given this human specification of a task:
                                      <human_specification>{human_specification}</human_specification>
                                      
                                      This is a plan specification, in JSON format, of the task:
                                      <specification>{specification}</specification>
                                      
                                      Now, consider this PDDL domain that describes the specification:
                                      <domain>{pddl_domain}</domain>
                                      
                                      And this is the PDDL problem that instatiates the specification:
                                      <problem>{pddl_problem}</problem>
                                      
                                      Now, for the {target_solver} PDDL solver, think *very carefully* whether:
                                      - The PDDL domain and plan correctly implement the JSON specific as well as the human specification *as multi-agent system*.
                                      - The PDDL domain and problem correctly identify each agent's action and treat them as distinct variables and entities.
                                      - Actions have appropriate preconditions specifying which agent can perform them.
                                      - If an action involves multiple agents, the preconditions must prevent the same agent from performing more than one role, unless it makes sense in the context of the problem.
                                      - The PDDL domain and problem define variables that are expressive names that allow mapping them back to the specification.

                                      You task is to fix all the issues mentioned above.
                                      Return the PDDL domain between <domain> and </domain> tags, and the PDDL problem between <problem> and </problem> tags. 
                                      Just return the PDDL code, do not add special characters or comments.
                                      """
        )

    def run(self) -> str:
        """
        Run the Agent to solve the issues in the plan.

        Input:
            src (str): The plan to be fixed.

        Output:
            str: The fixed plan.
        """
        self.upload_args(self.prompt_args)  # ensure args are uploaded

        # Fix the plan
        prompt = self.prompt.format(
            human_specification=self.prompt_args["human_specification"],
            specification=self.prompt_args["specification"],
            pddl_domain=self.prompt_args["pddl_domain"],
            pddl_problem=self.prompt_args["pddl_problem"],
            target_solver=self.prompt_args["target_solver"],
        )
        inp = [SystemMessage(content=self.system_prompt), HumanMessage(content=prompt)]
        return self.llm.invoke(inp).text()


class AgentSyntaxPDDL(Agent):
    required_args = {
        "specification": "(str) The plan to be checked for improvement.",
        "pddl_domain": "(str) The PDDL domain that describes the specification.",
        "pddl_problem": "(str) The PDDL problem that instantiates the specification.",
        "target_solver": "(str) The target PDDL solver.",
        "pddl_logs": "(str) The logs of the attempted execution.",
        "syntax_errors": "(str) The syntax errors detected by a PDDL validator.",
    }  # Static!

    def __init__(self, llm: ChatOpenAI, prompt_args: dict[str, str]):
        """
        This agent evaluates the PDDL syntax generated and makes corrections. It should be called whenever the pddl_logs show
        the planner has failed in finding a plan or if there are syntax errors detected by the PDDL validator.
        Conversely, if there are no syntax errors and pddl_logs show a plan has been found, this agent should not be called.
        It ensures the correct syntax is used, adapting the domain and problem to use only supported features of the target solver.

        Input:
            llm (ChatOpenAI): The language model to use for aligning the features with those supported by the target solver.
            prompt_args: (dict[str, str]): A dictionary containing the arguments for each prompt.
        """
        super().__init__(prompt_args=prompt_args)
        self.name = "AgentSyntaxPDDL"
        self.llm = llm
        self.prompt_args = prompt_args
        self.target_solver = prompt_args["target_solver"]
        self.tools = [PlanningWikiTool()]

        # A new prompt designed for a ReAct agent. Note the instruction to use tools.
        instructions_fd = inspect.cleandoc(
            """\
                    Fast Downward is primarily a non-temporal, non-numeric planner, but it supports some specific features.

                    Key Supported Features:
                        - STRIPS + ADL: Supports advanced features like conditional effects, quantified preconditions (`forall`, `exists`), and disjunctions.
                        - Axioms / Derived Predicates: Supports PDDL 2.2 derived predicates.
                        - Action Costs: Supports `:action-costs` from PDDL 3.1, but costs must be non-negative integers.
                        - For syntax on these features, use the tool to check pages like `/pddl`, `/pddl/requirements`, `/pddl/domain`, `/pddl/problem`, and `/pddl22`.

                    Key Unsupported Features:
                        - No Temporal Planning: Does not support durative actions or any PDDL 2.1 temporal features.
                        - No General Numeric Planning: Does not support numeric preconditions or effects, except for the specific `(increase (total-cost) ...)` syntax for action costs.
                        - No Object Fluents or Preferences: Does not support PDDL 3.0+ features.
            """
        )
        instructions_popf2 = inspect.cleandoc(
            """\
                    POPF2 is a temporal planner that works with the semantics of **PDDL 2.1**. Your corrections should adhere to this standard.

                    Key Supported Features:
                        - Durative Actions: This is the core of PDDL 2.1. 
                        - Numeric Fluents: POPF2 supports instantaneous numeric effects and linear continuous numeric effects that change a variable over the duration of an action.
                    For syntax questions on these features, use the tool to check pages like `/pddl21`, `/pddl21/req`, `/pddl21/domain`, `/pddl21/problem`.

                    Key Unsupported Features:
                        - It does not support features from PDDL 3.0+ like preferences or soft goals. Focus strictly on PDDL 2.1.
                        - It does not support parts of ADL. Look at the pddl_logs to identify unsupported features or errors.
            """
        )
        instructions_lpg = inspect.cleandoc(
            """\
                    LPG is a local-search planner targeting PDDL 2.1/2.2 (classical, numeric, temporal). It adds support for PDDL 2.2 features: Derived Predicates (DPs) + Timed Initial Literals (TILs).

                    Key Supported Features:
                    - STRIPS + ADL:
                        Disjunctions in preconditions
                        Conditional effects
                        Quantified preconditions/effects (forall/exists)
                    - Numeric planning (PDDL 2.1):
                        Numeric fluents, numeric preconditions/effects
                        Plan metrics (minimize/maximize cost, makespan)
                    - Temporal planning (PDDL 2.1):
                        Durative actions per standard syntax/semantics
                    - PDDL 2.2 extensions:
                        Derived Predicates (:derived ...)
                        Timed Initial Literals in the problem (:init contains (at <time> <literal>))
                    You can use the tool to check pages like `/pddl21/req`, `/pddl22/req` to help you.

                    Key Unsupported:
                    - No PDDL+ (processes, events, continuous change)
                    - No PDDL 3.x preferences / trajectory :constraints / object fluents
                    - Exotic/engine-specific extensions beyond PDDL 2.2

                    Common Parser Issues:
                    - Object names in (:objects ...) must be identifiers, not bare numbers.
                    - Keep a consistent :requirements line that matches what you actually use.
                    - Avoid (either A B) in predicate argument positions;
                        replace with a supertype for portability.
                    - Place TILs only in the problem's :init as (at <time> <literal>).
                    - Ensure types are declared before use; add :equality if using (= ...).

                    Safe "works-with-LPG" :requirements template (tweak as needed):
                    :strips :typing :negative-preconditions :equality
                    :conditional-effects :quantified-preconditions :disjunctive-preconditions
                    :numeric-fluents :durative-actions
                    (+ :derived-predicates if using)
            """
        )
        system_template = inspect.cleandoc(
            """\
                    You are an expert PDDL syntax corrector. Your task is to analyze the provided PDDL domain and problem files,
                    considering any syntax errors or logs, and fix them to be compliant with the target solver.
                    You have access to the following tools to help you:{tools}. The tools have names [{tool_names}].

                    **Key Instructions:**
                    1. The PDDL syntax required is that used by **{target_solver} Planner**.
                    2. If you encounter syntax you are unsure about (e.g., durative-actions, timed initial literals, specific requirements),
                        you **MUST** use the `planning_wiki_lookup` tool to get the authoritative syntax. This is crucial for accuracy.
                    3. First, reason about the error. Then, decide if you need to use a tool. If so, use it.
                    4. After gathering information, produce the final corrected PDDL files.
                    5. If there are no errors, return the exact phrase "<<PASS>>".

                    **Solver-Specific PDDL Guidance:**
                    Use the following information to guide your syntax corrections and to select the correct pages with the `planning_wiki_lookup` tool.
                    {instructions}

                    **Output Format:**
                    Return the PDDL domain between <domain> and </domain> tags, and the PDDL problem between <problem> and </problem> tags.
                    Do not add any other text, comments, or explanations outside of these tags.
                    """
        )
        if self.target_solver == "fast-downwards":
            instructions = instructions_fd
        elif self.target_solver == "popf2":
            instructions = instructions_popf2
        elif self.target_solver == "lpg":
            instructions = instructions_lpg
        else:
            instructions = "No specific instructions."
        self.system_prompt = system_template.format(
            tools=render_text_description(self.tools),
            tool_names=", ".join(t.name for t in self.tools),
            target_solver=self.target_solver,
            instructions=instructions,
        )

        self.prompt = inspect.cleandoc(
            """\
                    Here is the context for the task:

                    <specification>{specification}</specification>

                    <domain>{pddl_domain}</domain>

                    <problem>{pddl_problem}</problem>

                    <logs>{pddl_logs}</logs>

                    <errors>{syntax_errors}</errors>

                    Please analyze and fix any PDDL syntax errors based on the context and your available tools.
                    Remember to simply return "<<PASS>>" if there are no errors.
                    """
        )

        self.agent = create_react_agent(
            model=self.llm,
            tools=self.tools,
            prompt=self.system_prompt,
        )

    def run(self) -> str:
        """
        Run the Agent to fix PDDL syntax errors using a ReAct loop.
        """

        prompt = self.prompt.format(
            specification=self.prompt_args["specification"],
            pddl_domain=self.prompt_args["pddl_domain"],
            pddl_problem=self.prompt_args["pddl_problem"],
            pddl_logs=self.prompt_args["pddl_logs"],
            syntax_errors=self.prompt_args["syntax_errors"],
        )

        result = asyncio.run(
            self.agent.ainvoke({"messages": [{"role": "user", "content": prompt}]})
        )
        result_text = result["messages"][-1].text()

        if "<PASS>" in result_text:
            return f"<domain>{self.prompt_args['pddl_domain']}</domain>\n<problem>{self.prompt_args['pddl_problem']}</problem>"
        else:
            return result_text


class NoOpAgent(Agent):
    required_args = {
        "pddl_domain": "(str) The PDDL domain that describes the specification.",
        "pddl_problem": "(str) The PDDL problem that instantiates the specification.",
    }  # Static!

    def __init__(self, llm: ChatOpenAI, prompt_args: dict[str, str]):
        """
        Initialize the Agent that terminates the planning procedure.
        This agent is called only when the plan is deemed valid.
        No more refinements will be performed and the final PDDL domain, problem and plan will be returned.

        Input:
            llm (ChatOpenAI): The language model to use for fixing the syntax.
        """
        super().__init__(prompt_args=prompt_args)
        self.name = "NoOpAgent"
        self.llm = None

    def run(self) -> str:
        """
        Run the Agent to solve hallucinations in the plan.

        Input:
            src (str): The plan to be fixed for hallucinations.

        Output:
            str: The fixed plan.
        """
        return "[Info] NoOpAgent called. No more refinements will be performed."
