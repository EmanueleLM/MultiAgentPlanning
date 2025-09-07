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
from abc import ABC, abstractmethod
from langchain_openai import ChatOpenAI
from langchain_core.messages import SystemMessage, HumanMessage


class Agent(ABC):
    """
    Abstract class for an Agent.
    Each Agent mitigates a specific issue in multi-agent planning.
    The variable required_args is static and contains the arguments required by each Agent.
    """

    required_args: dict[str, str] = {}

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


class AgentHallucinations(Agent):
    required_args = {
        "threshold": "(int) The severity threshold above which a hallucination is considered critical.",
        "plan": "(str) The plan to be checked for hallucinations.",
    }

    def __init__(self, llm: ChatOpenAI, prompt_args: dict[str, str]):
        """
        This Agent detects and solves hallucinations.
        It consists of two steps:
        1. It Detects and marks all the hallucinations in the plan.
        2. Solve the hallucinations whose severity is above a given threshold.

        Input:
            llm (ChatOpenAI): The language model to use for detecting and mitigating hallucinations.
            prompt_args: (dict[str, str]): A dictionary containing the arguments for each prompt.
        """
        super().__init__(prompt_args=prompt_args)

        self.name = "AgentHallucinations"
        self.llm = llm

        # Prompts
        self.system_prompt_detect = inspect.cleandoc(
            """\
                                                    You are an agent that detects hallucinations. 
                                                    Your task is to analyze a provided plan and its assumptions and detect any hallucinations or inconsistencies.
                                                    """
        )
        self.prompt_detect = inspect.cleandoc(
            """\
                                             Analyze the following information and detect any hallucinations: 
                                             <plan>{plan}</plan>
                                             
                                             For any potential hallucination, return a description of it and its severity, from 1 (low) to 5 (high).
                                             If there are no evident hallucinations,there is no need to invent them.
                                             """
        )

        self.system_prompt = inspect.cleandoc(
            """\
                                             You are an agent that mitigates hallucinations. 
                                             Your task is to analyze a provided plan and a list of hallucinations, 
                                             each flagged with a severity score, from 1 (low) to 5 (high), 
                                             and solve them.
                                             """
        )
        self.prompt = inspect.cleandoc(
            """\
                                      Given this plan:
                                      <plan>{plan}</plan>
                                      
                                      And this list of hallucinations and their severity scores (from 1 (low) to 5 (high)):
                                      {hallucinations}
                                      
                                      Return a plan where all the hallucinations whose severity is at least {threshold} have been solved or removed.
                                      """
        )

    def _detect_hallucinations(self) -> None:
        """
        Detect hallucinations in the given plan.

        Input:
            src (str): The plan to be checked for hallucinations.

        Output:
            str: The detected hallucinations.
        """
        inp = [
            SystemMessage(content=self.system_prompt_detect),
            HumanMessage(
                content=self.prompt_detect.format(plan=self.prompt_args["plan"])
            ),
        ]
        self.prompt_args["hallucinations"] = self.llm.invoke(inp).content

    def run(self) -> str:
        """
        Run the Agent to solve hallucinations in the plan.

        Input:
            src (str): The plan to be fixed for hallucinations.

        Output:
            str: The fixed plan.
        """
        self.upload_args(self.prompt_args)  # ensure args are uploaded
        self._detect_hallucinations()  # detect hallucinations first

        # Fix the plan
        prompt = self.prompt.format(
            hallucinations=self.prompt_args["hallucinations"],
            threshold=self.prompt_args["threshold"],
            plan=self.prompt_args["plan"],
        )

        inp = [SystemMessage(content=self.system_prompt), HumanMessage(content=prompt)]
        return self.llm.invoke(inp).content


class AgentDeepThinkPDDL(Agent):
    required_args = {
        "specification": "(str) The plan to be checked for improvement.",
        "pddl_domain": "(str) The PDDL domain that describes the specification.",
        "pddl_problem": "(str) The PDDL problem that instantiates the specification.",
    }

    def __init__(self, llm: ChatOpenAI, prompt_args: dict[str, str]):
        """
        This agent deeply evaluates each PDDL plan's step and identifies inconsistencies between the constraints, the goal, and the final plan.
        In particular:
        - It checks whether the PDDL domain reflects the human specification.
        - It checks whether the PDDL problem reflects the particular instance of the specification.
        - It checks whether the PDDL domain and problem are consistent with the constraints of each agent.

        Input:
            llm (ChatOpenAI): The language model to use for detecting and mitigating hallucinations.
            prompt_args: (dict[str, str]): A dictionary containing the arguments for each prompt.
        """
        super().__init__(prompt_args=prompt_args)
        self.name = "AgentDeepThinkPDDL"
        self.llm = llm

        # Prompts
        self.system_prompt = inspect.cleandoc(
            """\
                                             You are an agent that evaluates each plan's step. 
                                             Your task is to analyze a provided plan against the human specifics, and identify all the possible inconsistencies. 
                                             You focus on the constraints of each action, and on the effects of each action.
                                             You aim is to return a plan that fixes all the inconsistencies and satisfies the goal.
                                             You can think as much as you want before answering, and you can use as many steps as you want.
                                             """
        )
        self.prompt = inspect.cleandoc(
            """\
                                      Given this specification in JSON format:
                                      <specification>{specification}</specification>
                                      
                                      And this PDDL domain that describes the specification:
                                      <domain>{pddl_domain}</domain>
                                      
                                      And this PDDL problem that instatiates the specification:
                                      <problem>{pddl_problem}</problem>
                                      
                                      Think *very carefully* whether:
                                      - the PDDL domain reflects the human specification.
                                      - the PDDL problem reflects the particular instance of the specification.
                                      - the PDDL domain and problem are consistent with the constraints of each agent.
                                      
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
            specification=self.prompt_args["specification"],
            pddl_domain=self.prompt_args["pddl_domain"],
            pddl_problem=self.prompt_args["pddl_problem"],
        )
        inp = [SystemMessage(content=self.system_prompt), HumanMessage(content=prompt)]
        return self.llm.invoke(inp).content


class AgentEnforceMultiAgency(Agent):
    required_args = {
        "specification": "(str) The plan to be checked for improvement.",
        "pddl_domain": "(str) The PDDL domain that describes the specification.",
        "pddl_problem": "(str) The PDDL problem that instantiates the specification.",
    }

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
                                      Given this specification in JSON format:
                                      <specification>{specification}</specification>
                                      
                                      And this PDDL domain that describes the specification:
                                      <domain>{pddl_domain}</domain>
                                      
                                      And this PDDL problem that instatiates the specification:
                                      <problem>{pddl_problem}</problem>
                                      
                                      Think *very carefully* whether:
                                      - The PDDL domain and plan correctly implement the specific as a multi-agent system.
                                      - The PDDL domain and problem correctly identify each agent's action and treat them as distinct variables and entities.
                                      - Actions have appropriate preconditions specifying which agent can perform them.
                                      - If an action involves multiple agents, the preconditions prevent self-interaction, unless makes sense in the context of the problem. 
                                      
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
            specification=self.prompt_args["specification"],
            pddl_domain=self.prompt_args["pddl_domain"],
            pddl_problem=self.prompt_args["pddl_problem"],
        )
        inp = [SystemMessage(content=self.system_prompt), HumanMessage(content=prompt)]
        return self.llm.invoke(inp).content


class AgentFastDownwardAdapter(Agent):
    required_args = {
        "pddl_domain": "(str) The original PDDL domain.",
        "pddl_problem": "(str) The original PDDL problem.",
        "specification": "(str) Optional human-readable specification of the task.",
    }

    def __init__(self, llm: ChatOpenAI, prompt_args: dict[str, str]):
        """
        This agent adapts the PDDL domains and problems so that they are compatible with the Fast Downward solver.
        In particular:
        - It replaces numeric fluents with predicates.
        - It precomputes arithmetic constraints as predicates in the problem.
        - It discretizes temporal/duration effects into sequences of instantaneous actions.
        - It uses symbolic ordering instead of numeric comparisons.
        - It encodes optimization via :action-costs only.
        - It keeps types, equality, and STRIPS/ADL features.

        Input:
            llm (ChatOpenAI): The language model to use for rewriting/adapting PDDL.
            prompt_args: (dict[str, str]): A dictionary containing the arguments for each prompt.
        """
        super().__init__(prompt_args=prompt_args)
        self.name = "AgentFastDownwardAdapter"
        self.llm = llm

        # Prompts
        self.system_prompt = inspect.cleandoc(
            """\
            You are an agent that adapts PDDL domains and problems for Fast Downward. 
            Your task is to convert numeric, temporal, or durative features into classical STRIPS/ADL style constructs so that Fast Downward can plan with the domain. 
            Maintain as much of the original semantics as possible.
            """
        )
        self.prompt = inspect.cleandoc(
            """\
            Given this specification in JSON format:
            <specification>{specification}</specification>

            And this PDDL domain:
            <domain>{pddl_domain}</domain>

            And this PDDL problem:
            <problem>{pddl_problem}</problem>

            Rewrite the domain and problem to be compatible with Fast Downward:
            - Replace numeric fluents with predicates.
            - Precompute arithmetic constraints as predicates in the problem.
            - Discretize temporal/duration effects into sequences of instantaneous actions.
            - Use symbolic ordering instead of numeric comparisons.
            - Encode optimization via :action-costs only.
            - Keep types, equality, and STRIPS/ADL features.
            
            Return the domain between <domain></domain> and the problem between <problem></problem>.
            Only return the PDDL code, no extra comments or characters.
            """
        )

    def run(self) -> str:
        """
        Run the Agent to adapt the PDDL domain and problem for Fast Downward.

        Output:
            str: The adapted PDDL domain and problem in Fast Downward-compatible form.
        """
        self.upload_args(self.prompt_args)

        prompt = self.prompt.format(
            specification=self.prompt_args.get("specification", ""),
            pddl_domain=self.prompt_args["pddl_domain"],
            pddl_problem=self.prompt_args["pddl_problem"],
        )

        inp = [SystemMessage(content=self.system_prompt), HumanMessage(content=prompt)]
        return self.llm.invoke(inp).content


class AgentSyntaxPDDL(Agent):
    required_args = {
        "specification": "(str) The plan to be checked for improvement.",
        "pddl_domain": "(str) The PDDL domain that describes the specification.",
        "pddl_problem": "(str) The PDDL problem that instantiates the specification.",
        "pddl_logs": "(str) The logs of the attempted execution with Fast Downward.",
        "syntax_errors": "(str) The syntax errors detected by a PDDL validator.",
    }

    def __init__(self, llm: ChatOpenAI, prompt_args: dict[str, str]):
        """
        This agent evaluates the PDDL syntax generated.

        Input:
            llm (ChatOpenAI): The language model to use for fixing the syntax.
            prompt_args: (dict[str, str]): A dictionary containing the arguments for each prompt.
        """
        super().__init__(prompt_args=prompt_args)
        self.name = "AgentSyntaxPDDL"
        self.llm = llm

        # Prompts
        self.system_prompt = inspect.cleandoc(
            """\
                                             You are an agent that evaluates each plan's step. 
                                             Your task is to analyze a provided plan against the human specifics,
                                             and identify all the possible inconsistencies with the PDDL syntax.
                                             The PDDL syntax required is that used by *Fast Downward*. 
                                             You can think as much as you want before answering, and you can use as many steps as you want.
                                             """
        )
        self.prompt = inspect.cleandoc(
            """\
                                      Given this specification in JSON format:
                                      <specification>{specification}</specification>
                                      
                                      And this PDDL domain that describes the specification:
                                      <domain>{pddl_domain}</domain>
                                      
                                      And this PDDL problem that instatiates the specification:
                                      <problem>{pddl_problem}</problem>
                                      
                                      These are the logs of the attempted execution with *Fast Downward*:
                                      <logs>{pddl_logs}</logs>
                                      
                                      This is the error message returned by a PDDL validator (can be empty or successful):
                                      <errors>{syntax_errors}</errors>
                                      
                                      Fix eventual errors in the PDDL domain and problem so that they satisfy the PDDL syntax required by *Fast Downward*.
                                      Remember that the PDDL domain and problem must be compliant with the PDDL syntax required by *Fast Downward*. 
                                      In case anything does not satisfy the specification, return a fixed version of the PDDL domain and problem. Otherwise, return the original ones.
                                      
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
            specification=self.prompt_args["specification"],
            pddl_domain=self.prompt_args["pddl_domain"],
            pddl_problem=self.prompt_args["pddl_problem"],
            pddl_logs=self.prompt_args["pddl_logs"],
            syntax_errors=self.prompt_args["syntax_errors"],
        )

        inp = [SystemMessage(content=self.system_prompt), HumanMessage(content=prompt)]
        return self.llm.invoke(inp).content


class AgentNaturalLanguage(Agent):
    required_args = {
        "specification": "(str) The plan to be checked for improvement.",
        "pddl_domain": "(str) The PDDL domain that describes the specification.",
        "pddl_problem": "(str) The PDDL problem that instantiates the specification.",
        "pddl_plan": "(str) The PDDL plan.",
    }

    def __init__(self, llm: ChatOpenAI, prompt_args: dict[str, str]):
        """
        Initialize the Agent that eventually turns the final plan into natural actions.

        Input:
            llm (ChatOpenAI): The language model to use for fixing the syntax.
        """
        super().__init__(prompt_args=prompt_args)
        self.name = "AgentNaturalLanguage"
        self.llm = llm

        # Prompts
        self.system_prompt = inspect.cleandoc(
            """\
                                             You are an agent that translates PDDL into natural language. 
                                             Your task is to turn a specific in JSON, a PDDL problem, a PDDL domain, and a PDDL plan, into a set of actions that is readable by humans. 
                                             You follow closely the plan provided within <plan></plan> tags. 
                                             You can think as much as you want before answering, and you can use as many steps as you want.
                                             """
        )
        self.prompt = inspect.cleandoc(
            """\
                                      Given this specification in JSON format:
                                      <specification>{specification}</specification>
                                      
                                      And this PDDL domain that describes the specification:
                                      <domain>{pddl_domain}</domain>
                                      
                                      And this PDDL problem that instatiates the specification:
                                      <problem>{pddl_problem}</problem>
                                      
                                      This is the PDDL plan that correctly solves the task:
                                      <plan>{pddl_plan}</plan>
                                      
                                      Your task is to output a set of actions that is readable by humans and that satisfies the final goal.
                                      Remember that your output:
                                      - Must match closely each action in the plan. Do not add more or delete any.
                                      - Must report each step clearly.
                                      - Whenever possible, each step should report the time duration and/or the timestamp.
                                      - Your plan must be compliant with the specification.
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
            specification=self.prompt_args["specification"],
            pddl_domain=self.prompt_args["pddl_domain"],
            pddl_problem=self.prompt_args["pddl_problem"],
            pddl_plan=self.prompt_args["pddl_plan"],
        )
        inp = [SystemMessage(content=self.system_prompt), HumanMessage(content=prompt)]
        return self.llm.invoke(inp).content
