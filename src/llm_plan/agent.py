"""
This class implements an agent, a piece of software that mixes neural (LLMs, etc.)
and formal techniques (VAL, uVal, etc.) to mitigate the issues of multi-agent planning.
The issues that we reckon are relevant in this context are:
- Scalability on structured problems ✔
- Correct PDDL syntax  ✔
- Hallucinations  ✔
- Asynchronicity ✔
- Validity  ✔
- Optimality ✔ (this is handled by the solver)
- Partial observability

This class implements methods to check whether:
- The plans (final and intermediate) are valid, executable and optimal.
- The final plan leverages asynchronicity.
- The observations induce hallucinations in the final plan.
- The plans reflects the human specification.
- ...
"""

import inspect
from abc import ABC, abstractmethod

from src.llm_plan.llm import LLM


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


class AgentDeepThinkPDDL(Agent):
    required_args = {
        "human_specification": "(str) The human-readable specification of the task.",
        "specification": "(str) The plan to be checked for improvement.",
        "pddl_domain": "(str) The PDDL domain that describes the specification.",
        "pddl_problem": "(str) The PDDL problem that instantiates the specification.",
        "target_solver": "(str) The target PDDL solver.",
        "pddl_plan": "(str) The PDDL plan. May be empty if no plan was found.",
    }  # Static!

    def __init__(self, llm: LLM, prompt_args: dict[str, str]):
        """
        This agent deeply evaluates the PDDL domain and problem and identifies inconsistencies between the constraints, the goal, and the final plan.
        In particular it checks whether:
        - The PDDL domain reflects the human specification.
        - The PDDL problem reflects the particular instance of the specification.
        - The PDDL domain and problem are consistent with the constraints of each agent.

        Input:
            llm (LLM): The language model to use for detecting and mitigating hallucinations.
            prompt_args: (dict[str, str]): A dictionary containing the arguments for each prompt.
        """
        super().__init__(prompt_args=prompt_args)
        self.name = "AgentDeepThinkPDDL"
        self.llm = llm

        # Prompts
        self.system_prompt = inspect.cleandoc("""\
                                             You are an expert Planning Domain Definition Language (PDDL) programmer. 
                                             You analyze a provided plan against the human specifics, identify and fix all the possible inconsistencies. 
                                             Your aim is to return a plan that fixes all the inconsistencies and satisfies the goal.
                                             """)
        self.prompt = inspect.cleandoc("""\
                                      Given this human specification of a task:
                                      <human_specification>{human_specification}</human_specification>
                                      
                                      This is a plan specification, in JSON format, of the task:
                                      <specification>{specification}</specification>
                                      
                                      Now, consider this PDDL domain that describes the specification:
                                      <domain>{pddl_domain}</domain>
                                      
                                      And this is the PDDL problem that instantiates the specification:
                                      <problem>{pddl_problem}</problem>
                                      
                                      This is the best plan the solver could find (it may be empty if no plan was found):
                                      <plan>{pddl_plan}</plan>
                                      
                                      Now, think *very carefully* whether:
                                      - the PDDL domain reflects the human specification.
                                      - the PDDL problem reflects the particular instance of the specification.
                                      - the PDDL plan satisfies the goal and the constraints of the human specification! Be careful, the plan may be wrong!
                                      
                                      Return the PDDL domain between <domain> and </domain> tags, and the PDDL problem between <problem> and </problem> tags. 
                                      As regards the PDDL domain and problem, just return the code; do not add special characters or comments.
                                      """)

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
            pddl_plan=self.prompt_args["pddl_plan"],
        )
        return self.llm.generate_sync(
            system_prompt=self.system_prompt,
            prompt=prompt,
        )


class AgentDeepThinkConstraints(Agent):
    required_args = {
        "human_specification": "(str) The human-readable specification of the task.",
        "specification": "(str) The plan to be checked for improvement.",
        "pddl_domain": "(str) The PDDL domain that describes the specification.",
        "pddl_problem": "(str) The PDDL problem that instantiates the specification.",
        "pddl_plan": "(str) The PDDL plan. May be empty if no plan was found.",
        "target_solver": "(str) The target PDDL solver.",
    }  # Static!

    def __init__(self, llm: LLM, prompt_args: dict[str, str]):
        """
        This agent deeply evaluates whether the PDDL domain and problem are consistent with the specification.
        In particular:
        - It checks whether the PDDL problem reflects the particular instance of the specification. In particular, that all the constraints are correctly specified.
        - It checks whether the PDDL domain defines all the variables and the correct goal in the specification.

        Input:
            llm (LLM): The language model to use for detecting and mitigating hallucinations.
            prompt_args: (dict[str, str]): A dictionary containing the arguments for each prompt.
        """
        super().__init__(prompt_args=prompt_args)
        self.name = "AgentDeepThinkConstraints"
        self.llm = llm

        # Prompts
        self.system_prompt = inspect.cleandoc("""\
                                             You are an expert Planning Domain Definition Language (PDDL) programmer.
                                             Your task is to analyze a PDDL problem against a natural language and JSON specification. 
                                             You focus on the constraints of each agent and whether they are expressed as proper PDDL formulae.
                                             In particular, you focus on whether each agent's private information is expressed as constraints in the PDDL problem.
                                             """)
        self.prompt = inspect.cleandoc("""\
                                      Given this human specification of a task:
                                      <human_specification>{human_specification}</human_specification>
                                      
                                      This is a plan specification, in JSON format, of the task:
                                      <specification>{specification}</specification>
                                      
                                      Now, consider this PDDL domain that describes the specification:
                                      <domain>{pddl_domain}</domain>
                                      
                                      And this is the PDDL problem that instantiates the specification:
                                      <problem>{pddl_problem}</problem>
                                      
                                      This is the best plan the solver could find (it may be empty if no plan was found):
                                      <plan>{pddl_plan}</plan>
                                      
                                      Now, think *very carefully* whether:
                                      - the PDDL domain reflects the goal of the human and json specifications. Always consider the human specification and the ground truth.
                                      - the PDDL problem correctly enumerates and expresses all the constraints in the specification. Put particular attention that all the constraints are expressed and none is missing or under-specified.
                                      - the PDDL plan may be non-empty but wrong because the constraints are not correctly expressed in the PDDL problem.
                                      
                                      Return the PDDL domain between <domain> and </domain> tags, and the PDDL problem between <problem> and </problem> tags. 
                                      As regards the PDDL domain and problem, just return the code; do not add special characters or comments.
                                      """)

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
            pddl_plan=self.prompt_args["pddl_plan"],
        )
        return self.llm.generate_sync(
            system_prompt=self.system_prompt,
            prompt=prompt,
        )


class AgentEnforceMultiAgency(Agent):
    required_args = {
        "human_specification": "(str) The human-readable specification of the task.",
        "specification": "(str) The plan to be checked for improvement.",
        "pddl_domain": "(str) The PDDL domain that describes the specification.",
        "pddl_problem": "(str) The PDDL problem that instantiates the specification.",
        "target_solver": "(str) The target PDDL solver.",
    }  # Static!

    def __init__(self, llm: LLM, prompt_args: dict[str, str]):
        """
        This agent identifies inconsistencies between the specific and the requirements in the context of a multi-agent system.
        In particular:
        - It checks whether the PDDL domain and plan correctly implement the specific as a multi-agent system.
        - It checks whether the PDDL domain and problem correctly identify each agent's action and treat them as distinct variables and entities.
        - Fixes all the issues mentioned above.

        Input:
            llm (LLM): The language model to use for detecting and mitigating hallucinations.
            prompt_args: (dict[str, str]): A dictionary containing the arguments for each prompt.
        """
        super().__init__(prompt_args=prompt_args)
        self.name = "AgentEnforceMultiAgency"
        self.llm = llm

        # Prompts
        self.system_prompt = inspect.cleandoc("""\
                                             You are an expert Planning Domain Definition Language (PDDL) programmer.
                                             You focus on whether a PDDL domain and problem correctly specify each agent's action and express them as distinct variables.
                                             """)
        self.prompt = inspect.cleandoc("""\
                                      Given this human specification of a task:
                                      <human_specification>{human_specification}</human_specification>
                                      
                                      This is a plan specification, in JSON format, of the task:
                                      <specification>{specification}</specification>
                                      
                                      Now, consider this PDDL domain that describes the specification:
                                      <domain>{pddl_domain}</domain>
                                      
                                      And this is the PDDL problem that instantiates the specification:
                                      <problem>{pddl_problem}</problem>
                                      
                                      Now, for the {target_solver} PDDL solver, think *very carefully* whether:
                                      - The PDDL domain and plan correctly implement the JSON specific as well as the human specification *as multi-agent system*.
                                      - The PDDL domain and problem correctly identify each agent's action and treat them as distinct variables and entities.
                                      - The PDDL domain and problem define variables that are expressive names that allow mapping them back to the specification.
                                      
                                      You task is to fix all the issues mentioned above.
                                      Return the PDDL domain between <domain> and </domain> tags, and the PDDL problem between <problem> and </problem> tags. 
                                      As regards the PDDL domain and problem, just return the code; do not add special characters or comments.
                                      """)

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
            target_solver=self.prompt_args["target_solver"]
        )
        return self.llm.generate_sync(
            system_prompt=self.system_prompt,
            prompt=prompt,
        )


class AgentFastDownwardsAdapter(Agent):
    required_args = {
        "pddl_domain": "(str) The original PDDL domain.",
        "pddl_problem": "(str) The original PDDL problem.",
        "specification": "(str) Optional human-readable specification of the task.",
    }  # Static!

    def __init__(self, llm: LLM, prompt_args: dict[str, str]):
        """
        This agent adapts the PDDL domains and problems so that they are compatible with the Fast Downwards Planner solver.
        In particular:
        - It replaces numeric fluent predicates with logical predicates.
        - It pre-computes arithmetic constraints as predicates in the problem.
        - It discretizes temporal/duration effects into sequences of instantaneous actions.
        - It uses symbolic ordering instead of numeric comparisons.
        - It encodes optimization via :action-costs only.
        - It keeps types, equality, and STRIPS/ADL features.
        
        *This agent should only be used if the Fast Downwards solver is used, not any other!*

        Input:
            llm (LLM): The language model to use for rewriting/adapting PDDL.
            prompt_args: (dict[str, str]): A dictionary containing the arguments for each prompt.
        """
        super().__init__(prompt_args=prompt_args)
        self.name = "AgentFastDownwardsAdapter"
        self.llm = llm

        # Prompts
        self.system_prompt = inspect.cleandoc("""\
            You are an agent that adapts PDDL domains and problems for Fast Downwards Planner. 
            Your task is to convert numeric, temporal, or durative features into classical STRIPS/ADL style constructs so that Fast Downwards Planner can plan with the domain. 
            Maintain as much of the original semantics as possible.
            """)
        self.prompt = inspect.cleandoc("""\
            Given this specification, in JSON format:
            <specification>{specification}</specification>

            And this PDDL domain:
            <domain>{pddl_domain}</domain>

            And this PDDL problem:
            <problem>{pddl_problem}</problem>

            Rewrite the domain and problem to be compatible with Fast Downwards Planner:
            - Replace numeric fluent predicates with logical predicates.
            - Pre-compute arithmetic constraints as predicates in the problem.
            - Discretize temporal/duration effects into sequences of instantaneous actions.
            - Use symbolic ordering instead of numeric comparisons.
            - Encode optimization via :action-costs only.
            - Keep types, equality, and STRIPS/ADL features.
            
            Return the domain between <domain></domain> and the problem between <problem></problem>.
            As regards the PDDL domain and problem, just return the code; do not add special characters or comments.
            """)

    def run(self) -> str:
        """
        Run the Agent to adapt the PDDL domain and problem for Fast Downwards Planner.

        Output:
            str: The adapted PDDL domain and problem in Fast Downwards Planner-compatible form.
        """
        self.upload_args(self.prompt_args)

        prompt = self.prompt.format(
            specification=self.prompt_args.get("specification", ""),
            pddl_domain=self.prompt_args["pddl_domain"],
            pddl_problem=self.prompt_args["pddl_problem"],
        )

        return self.llm.generate_sync(
            system_prompt=self.system_prompt,
            prompt=prompt,
        )


class AgentSyntaxPDDL(Agent):
    required_args = {
        "specification": "(str) The plan to be checked for improvement.",
        "pddl_domain": "(str) The PDDL domain that describes the specification.",
        "pddl_problem": "(str) The PDDL problem that instantiates the specification.",
        "target_solver": "(str) The target PDDL solver.",
        "pddl_logs": "(str) The logs of the attempted execution.",
        "syntax_errors": "(str) The syntax errors detected by a PDDL validator.",
    }  # Static!

    def __init__(self, llm: LLM, prompt_args: dict[str, str]):
        """
        This agent evaluates the PDDL syntax generated.
        It performs type-checks and fixes syntax errors in the PDDL domain and problem.
        The target PDDL solver is passed as an argument to the agent.

        Input:
            llm (LLM): The language model to use for fixing the syntax.
            prompt_args: (dict[str, str]): A dictionary containing the arguments for each prompt.
        """
        super().__init__(prompt_args=prompt_args)
        self.name = "AgentSyntaxPDDL"
        self.llm = llm

        # Prompts
        self.system_prompt = inspect.cleandoc("""\
                                             You are an agent that evaluates each plan's step. 
                                             Your task is to analyze a provided plan against the human specifics,
                                             and identify all the possible inconsistencies with the PDDL syntax.
                                             The PDDL syntax required is that used by *{target_solver} Planner*.
                                             """)
        self.prompt = inspect.cleandoc("""\
                                      Given this specification of a plan, in JSON format:
                                      <specification>{specification}</specification>
                                      
                                      And this PDDL domain that describes the specification:
                                      <domain>{pddl_domain}</domain>
                                      
                                      And this PDDL problem that instantiates the specification:
                                      <problem>{pddl_problem}</problem>
                                      
                                      These are the logs of the attempted execution with *{target_solver} Planner*:
                                      <logs>{pddl_logs}</logs>
                                      
                                      This is the error message returned by a PDDL validator (can be empty or successful):
                                      <errors>{syntax_errors}</errors>
                                      
                                      Fix eventual errors in the PDDL domain and problem so that they satisfy the PDDL syntax required by *{target_solver} Planner*.
                                      Remember that the PDDL domain and problem must be compliant with the PDDL syntax required by *{target_solver} Planner*. 
                                      In case anything does not satisfy the specification, return a fixed version of the PDDL domain and problem. Otherwise, return the original ones.
                                      
                                      Return the PDDL domain between <domain> and </domain> tags, and the PDDL problem between <problem> and </problem> tags. 
                                      As regards the PDDL domain and problem, just return the code; do not add special characters or comments.
                                      """)

    def run(self) -> str:
        """
        Run the Agent to solve hallucinations in the plan.

        Input:
            src (str): The plan to be fixed for hallucinations.

        Output:
            str: The fixed plan.
        """
        self.upload_args(self.prompt_args)  # ensure args are uploaded

        # Format the system prompt
        system_prompt = self.system_prompt.format(target_solver=self.prompt_args["target_solver"])
        
        # Fix the plan
        prompt = self.prompt.format(
            specification=self.prompt_args["specification"],
            pddl_domain=self.prompt_args["pddl_domain"],
            pddl_problem=self.prompt_args["pddl_problem"],
            target_solver=self.prompt_args["target_solver"],
            pddl_logs=self.prompt_args["pddl_logs"],
            syntax_errors=self.prompt_args["syntax_errors"],
        )
        return self.llm.generate_sync(
            system_prompt=system_prompt,
            prompt=prompt,
        )
    
class AgentAsynchronicity(Agent):
    required_args = {
        "specification": "(str) The plan to be checked for improvement.",
        "pddl_domain": "(str) The PDDL domain that describes the specification.",
        "pddl_problem": "(str) The PDDL problem that instantiates the specification.",
        "target_solver": "(str) The target PDDL solver.",
        "pddl_logs": "(str) The logs of the attempted execution.",
        "syntax_errors": "(str) The syntax errors detected by a PDDL validator.",
    }  # Static!

    def __init__(self, llm: LLM, prompt_args: dict[str, str]):
        """
        This agent optimizes the plan so that asynchronous actions are executed at the same time-step, if possible.
        In a multi-agent framework, agents can execute actions at the same time-step if they do not interfere with each other.
        In this sense, this agent introduces a timestamp variable that, for each action, identifies the time-step at which the action is executed.
        Actions with the same timestamp are meant to be executed at the same time.

        Input:
            llm (LLM): The language model to use for fixing the syntax.
            prompt_args: (dict[str, str]): A dictionary containing the arguments for each prompt.
        """
        super().__init__(prompt_args=prompt_args)
        self.name = "AgentSyntaxPDDL"
        self.llm = llm

        # Prompts
        self.system_prompt = inspect.cleandoc("""\
                                             You are an agent that evaluates each plan's step. 
                                             Your task is to analyze a provided plan against the human specifics,
                                             and introduce a variable, namely timestamp, that indicates at what timestamp an action is performed by an agent.
                                             This is useful to optimize the plan so that asynchronous actions are executed at the same time-step, if possible.
                                             The PDDL syntax required is that used by *{target_solver} Planner*. 
                                             You can think as much as you want before answering, and you can use as many steps as you want.
                                             """)
        self.prompt = inspect.cleandoc("""\
                                      Given this specification of a plan, in JSON format:
                                      <specification>{specification}</specification>
                                      
                                      And this PDDL domain that describes the specification:
                                      <domain>{pddl_domain}</domain>
                                      
                                      And this PDDL problem that instantiates the specification:
                                      <problem>{pddl_problem}</problem>
                                      
                                      These are the logs of the attempted execution with *{target_solver} Planner*:
                                      <logs>{pddl_logs}</logs>
                                      
                                      This is the error message returned by a PDDL validator (can be empty or successful):
                                      <errors>{syntax_errors}</errors>
                                      
                                      Your task is to analyze a provided plan against the human specifics, and introduce a variable, namely timestamp, that indicates at what timestamp an action is performed by an agent.
                                      This is useful to optimize the plan so that asynchronous actions are executed at the same time-step, if possible.
                                      The PDDL syntax required is that used by *{target_solver} Planner*. 
                                      
                                      Return the PDDL domain between <domain> and </domain> tags, and the PDDL problem between <problem> and </problem> tags. 
                                      As regards the PDDL domain and problem, just return the code; do not add special characters or comments.
                                      """)

    def run(self) -> str:
        """
        Run the Agent to solve hallucinations in the plan.

        Input:
            src (str): The plan to be fixed for hallucinations.

        Output:
            str: The fixed plan.
        """
        self.upload_args(self.prompt_args)  # ensure args are uploaded

        # Format the system prompt
        system_prompt = self.system_prompt.format(target_solver=self.prompt_args["target_solver"])
        
        # Fix the plan
        prompt = self.prompt.format(
            specification=self.prompt_args["specification"],
            pddl_domain=self.prompt_args["pddl_domain"],
            pddl_problem=self.prompt_args["pddl_problem"],
            target_solver=self.prompt_args["target_solver"],
            pddl_logs=self.prompt_args["pddl_logs"],
            syntax_errors=self.prompt_args["syntax_errors"],
        )
        return self.llm.generate_sync(
            system_prompt=system_prompt,
            prompt=prompt,
        )


class NoOpAgent(Agent):
    required_args = {
        "pddl_domain": "(str) The PDDL domain that describes the specification.",
        "pddl_problem": "(str) The PDDL problem that instantiates the specification.",
        "pddl_plan": "(str) The PDDL plan. May be empty if no plan was found.",
    }  # Static!

    def __init__(self, llm: LLM, prompt_args: dict[str, str]):
        """
        Initialize the Agent that terminates the planning procedure.
        This agent is called only when the plan is deemed valid.
        No more refinements will be performed and the final PDDL domain, problem and plan will be returned.

        Input:
            llm (LLM): The language model to use for fixing the syntax.
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


class AgentNaturalLanguage(Agent):
    required_args = {
        "specification": "(str) The plan to be checked for improvement.",
        "pddl_domain": "(str) The PDDL domain that describes the specification.",
        "pddl_problem": "(str) The PDDL problem that instantiates the specification.",
        "pddl_plan": "(str) The PDDL plan.",
    }  # Static!

    def __init__(self, llm: LLM, prompt_args: dict[str, str]):
        """
        Initialize the Agent that eventually turns the final plan into natural actions.

        Input:
            llm (LLM): The language model to use for fixing the syntax.
        """
        super().__init__(prompt_args=prompt_args)
        self.name = "AgentNaturalLanguage"
        self.llm = llm

        # Prompts
        self.system_prompt = inspect.cleandoc("""\
                                             You are an agent that translates PDDL into natural language. 
                                             Your task is to turn a specific in JSON, a PDDL problem, a PDDL domain, and a PDDL plan, into a set of actions that is readable by humans. 
                                             You follow closely the plan provided within <plan></plan> tags. 
                                             You can think as much as you want before answering, and you can use as many steps as you want.
                                             """)
        self.prompt = inspect.cleandoc("""\
                                      Given this specification, in JSON format:
                                      <specification>{specification}</specification>
                                      
                                      And this PDDL domain that describes the specification:
                                      <domain>{pddl_domain}</domain>
                                      
                                      And this PDDL problem that instantiates the specification:
                                      <problem>{pddl_problem}</problem>
                                      
                                      This is the PDDL plan that correctly solves the task:
                                      <plan>{pddl_plan}</plan>
                                      
                                      Your task is to output a set of actions that is readable by humans and that satisfies the final goal.
                                      Remember that your output:
                                      - Must match closely each action in the plan. Do not add more or delete any.
                                      - Must report each step clearly.
                                      - Whenever possible, each step should report the time duration and/or the timestamp.
                                      - Your plan must be compliant with the specification.
                                      """)

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
        return self.llm.generate_sync(
            system_prompt=self.system_prompt,
            prompt=prompt,
        )
