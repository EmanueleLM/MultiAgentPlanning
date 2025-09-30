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


class AgentHallucinations(Agent):
    required_args = {
        "human_specification": "(str) The human-readable specification of the task.",
        "specification": "(str) The structured description of the task (JSON).",
        "pddl_domain": "(str) The PDDL domain authored by the model.",
        "pddl_problem": "(str) The PDDL problem authored by the model.",
        "pddl_plan": "(str) The PDDL plan produced so far (may be empty).",
    }  # Static!

    def __init__(self, llm: LLM, prompt_args: dict[str, str]):
        """
        Agent that detects and fixes hallucinations in the authored PDDL domain and problem.
        It compares the artifacts against the human and JSON specifications (and optional hallucination
        reports) to remove unsupported predicates, objects, or goals while preserving legitimate content.

        Input:
            llm (LLM): The language model used to rewrite the PDDL artifacts.
            prompt_args (dict[str, str]): Arguments to be injected in the prompts.
        """
        super().__init__(prompt_args=prompt_args)
        self.name = "AgentHallucinations"
        self.llm = llm

        # Prompts
        self.system_prompt = inspect.cleandoc(
            """\
            You are a meticulous multi-agent planning engineer. You specialize in eliminating hallucinations
            from PDDL domains and problems by checking every predicate, object, and goal against the ground
            specification. Preserve valid constructs, repair or remove unsupported ones, and keep the
            syntax compliant with classical PDDL. Always encode stated busy intervals and preferences
            (e.g., "avoid", "would rather not", "earliest") as hard constraints in the resulting PDDL.
            Limit the :requirements list to those supported by Fast Downward (:typing, :negative-preconditions,
            and :action-costs when needed); never introduce :fluents, axioms, conditional effects, or durative
            constructs.
            """
        )

        self.prompt = inspect.cleandoc(
            """\
            Human specification of the task:
            <human_specification>{human_specification}</human_specification>

            JSON specification (ground truth facts and workflow):
            <specification>{specification}</specification>

            Current PDDL domain authored by the model:
            <domain>{pddl_domain}</domain>

            Current PDDL problem authored by the model:
            <problem>{pddl_problem}</problem>

            PDDL plan generated with the current artifacts (may be empty):
            <plan>{pddl_plan}</plan>

            Hallucination report or validator feedback (optional, can be empty):
            <hallucinations>{hallucination_report}</hallucinations>

            Think carefully about inconsistencies or invented elements in the PDDL domain or problem.
            Remove predicates, actions, objects, or goals that are not grounded in the specifications.
            Align action preconditions and effects, object declarations, the initial state, and the goal facts
            with the provided specifications. Preserve the multi-agent structure and solver compatibility.
            Explicitly encode availability and preference constraints so that disallowed time windows cannot be
            selected. Ensure that requested durations match the natural-language specification;
            call out irreconcilable over-subscriptions instead of silently reducing stays.
            Only model direct connections that are explicitly described—do not invent multi-hop additional actions.
            When uncertain, prefer conservative edits instead of introducing new abstractions.

            Return the corrected PDDL domain between <domain></domain> and the corrected PDDL problem between
            <problem></problem>. Output only raw PDDL code inside the tags.
            """
        )

    def run(self) -> str:
        """Run the agent to eliminate hallucinations from the PDDL domain and problem."""
        self.upload_args(self.prompt_args)

        prompt = self.prompt.format(
            human_specification=self.prompt_args["human_specification"],
            specification=self.prompt_args["specification"],
            pddl_domain=self.prompt_args["pddl_domain"],
            pddl_problem=self.prompt_args["pddl_problem"],
            pddl_plan=self.prompt_args.get("pddl_plan", ""),
            hallucination_report=self.prompt_args.get("hallucination_report", ""),
        )

        return self.llm.generate_sync(
            system_prompt=self.system_prompt,
            prompt=prompt,
        )


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
        self.system_prompt = inspect.cleandoc(
            """\
            You are an expert Planning Domain Definition Language (PDDL) programmer.
            You analyze the provided domain, problem, and plan against the human specification, identify every
            inconsistency, and return corrected PDDL artifacts that satisfy the goal. Treat all stated busy
            intervals and temporal preferences as hard constraints and ensure only feasible time windows remain
            selectable. Verify that time durations exactly match the specification, that the total time horizon
            is preserved, and that only direct connections explicitly listed are available.
            Do not introduce unsupported Fast Downward features (:fluents, axioms, conditional effects, durative
            actions, etc.).
            """
        )
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
                                      
                                      Think very carefully about whether:
                                      - The PDDL domain reflects the human specification.
                                      - The PDDL problem reflects the particular instance of the specification.
                                      - Time durations match exactly the natural-language requirements.
                                      - Only direct connections explicitly mentioned in the specification are encoded.
                                      - The PDDL plan satisfies the goal and the constraints of the human specification, including every availability or temporal preference mentioned. Be careful: the plan may be wrong.

                                      Return the PDDL domain between <domain> and </domain> tags, and the PDDL problem between <problem> and </problem> tags.
                                      Return only raw PDDL code inside the tags; do not add comments or extra characters.
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
        self.system_prompt = inspect.cleandoc(
            """\
            You are an expert Planning Domain Definition Language (PDDL) programmer.
            Analyze the PDDL domain and problem against the natural-language and JSON specifications.
            Focus on whether each agent's constraints are correctly captured as PDDL formulae, especially
            agents' availability, (e.g., meeting durations or robot schedules), and any natural-language preferences that must be enforced.
            Ensure time durations sum to the required actions length, highlight irreconcilable demands, and verify
            that the domain declares only Fast Downward compatible requirements (:typing, :negative-preconditions,
            :action-costs).
            """
        )
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
                                      
                                      Think very carefully about whether:
                                      - The PDDL domain reflects the goals described in the human and JSON specifications. Always consider the human specification as the ground truth.
                                      - The PDDL problem correctly enumerates and expresses every constraint in the specification, including preferences that restrict certain times. Pay close attention to missing or underspecified constraints.
                                      - The encoded action durations (e.g., total number of days/hours) match the specification, and only direct actions or transitions explicitly stated are available.
                                      - The PDDL plan could be non-empty yet incorrect because the constraints are not correctly expressed in the PDDL problem.

                                      Return the PDDL domain between <domain> and </domain> tags, and the PDDL problem between <problem> and </problem> tags.
                                      Return only raw PDDL code inside the tags; do not add comments or extra characters.
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
        This agent identifies inconsistencies between the specification and the requirements in the context of a multi-agent system.
        In particular:
        - It checks whether the PDDL domain and plan correctly implement the specification as a multi-agent system.
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
        self.system_prompt = inspect.cleandoc(
            """\
            You are an expert Planning Domain Definition Language (PDDL) programmer.
            Ensure that the PDDL domain and problem correctly represent each agent's actions as distinct entities.
            Encode every stated constraint or preference as a structural restriction so that no agent executes
            an action that violates availability or timing requirements. Reject candidate models that invent
            indirect actions, connections or unsupported requirements (:fluents, axioms, conditional effects).
            Confirm that time durations of each action and the overall action horizon match the natural-language brief
            before approving the domain/problem pair.
            """
        )
        self.prompt = inspect.cleandoc("""\
                                      Given this human specification of a task:
                                      <human_specification>{human_specification}</human_specification>
                                      
                                      This is a plan specification, in JSON format, of the task:
                                      <specification>{specification}</specification>
                                      
                                      Now, consider this PDDL domain that describes the specification:
                                      <domain>{pddl_domain}</domain>
                                      
                                      And this is the PDDL problem that instantiates the specification:
                                      <problem>{pddl_problem}</problem>
                                      
                                      Now, for the {target_solver} PDDL solver, think *very carefully* about whether:
                                      - The PDDL domain and plan correctly implement the JSON specification as well as the human specification within a multi-agent system.
                                      - The PDDL domain and problem correctly identify each agent's action and treat them as distinct variables and entities.
                                      - The PDDL domain and problem define variables that are expressive names that allow mapping them back to the specification.
                                      - The encoded connections and actions are limited to direct links explicitly listed, and the time durations add up to the stated horizon.

                                      Your task is to fix all the issues mentioned above.
                                      Return the PDDL domain between <domain> and </domain> tags, and the PDDL problem between <problem> and </problem> tags.
                                      Return only raw PDDL code inside the tags; do not add comments or extra characters.
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
        self.system_prompt = inspect.cleandoc(
            """\
            You are an agent that adapts PDDL domains and problems for the Fast Downward planner.
            Convert numeric, temporal, or durative features into classical STRIPS/ADL-style constructs so the
            solver can operate on the domain while preserving as much of the original semantics as possible.
            Never relax agents' availability, duration requirements, or stated preferences when adapting.
            Restrict the :requirements list to features supported by Fast Downward (:typing, :negative-preconditions,
            :action-costs); strip out :fluents, axioms, conditional effects, or durative constructs entirely.
            """
        )
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
            - Remove unsupported requirements such as :fluents, axioms, or conditional effects; ensure only direct connections mentioned in the source specification remain.
            
            Return the domain between <domain></domain> and the problem between <problem></problem>.
            Return only raw PDDL code inside the tags; do not add comments or extra characters.
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
        self.system_prompt = inspect.cleandoc(
            """\
            You are an agent that evaluates each step of a plan.
            Analyze the provided plan against the human specification and identify every inconsistency with the
            PDDL syntax expected by the *{target_solver}* planner. Confirm that availability and preference
            constraints remain encoded correctly after your edits and that the :requirements list only contains
            features supported by Fast Downward (:typing, :negative-preconditions, :action-costs).
            """
        )
        self.prompt = inspect.cleandoc("""\
                                      Given this specification of a plan, in JSON format:
                                      <specification>{specification}</specification>
                                      
                                      And this PDDL domain that describes the specification:
                                      <domain>{pddl_domain}</domain>
                                      
                                      And this PDDL problem that instantiates the specification:
                                      <problem>{pddl_problem}</problem>
                                      
                                      These are the logs of the attempted execution with the *{target_solver}* planner:
                                      <logs>{pddl_logs}</logs>
                                      
                                      This is the error message returned by a PDDL validator (can be empty or successful):
                                      <errors>{syntax_errors}</errors>
                                      
                                      Fix any errors in the PDDL domain and problem so that they satisfy the PDDL syntax required by the *{target_solver}* planner.
                                      Ensure that no constraint (availability, duration, preference) is lost during the fix and that unsupported requirements (e.g., :fluents, axioms, conditional effects) are removed.
                                      If anything does not satisfy the specification, return a corrected version of the PDDL domain and problem; otherwise, return the originals.

                                      Return the PDDL domain between <domain> and </domain> tags, and the PDDL problem between <problem> and </problem> tags.
                                      Return only raw PDDL code inside the tags; do not add comments or extra characters.
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

        # Format the system prompt
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
        self.name = "AgentAsynchronicity"
        self.llm = llm

        # Prompts
        self.system_prompt = inspect.cleandoc(
            """\
            You are an agent that optimizes plans for asynchronicity.
            Analyze the provided plan against the human specification and introduce a timestamp variable that
            marks when each agent performs an action. Use it to schedule independent actions concurrently while
            keeping compatibility with the *{target_solver}* planner. Do not violate any availability or
            preference constraint while reshaping the schedule, and ensure you do not introduce unsupported
            Fast Downward features (e.g., :fluents, axioms, conditional effects).
            You may think through the problem in as many steps as needed.
            """
        )
        self.prompt = inspect.cleandoc("""\
                                      Given this specification of a plan, in JSON format:
                                      <specification>{specification}</specification>
                                      
                                      And this PDDL domain that describes the specification:
                                      <domain>{pddl_domain}</domain>
                                      
                                      And this PDDL problem that instantiates the specification:
                                      <problem>{pddl_problem}</problem>
                                      
                                      These are the logs of the attempted execution with the *{target_solver}* planner:
                                      <logs>{pddl_logs}</logs>
                                      
                                      This is the error message returned by a PDDL validator (can be empty or successful):
                                      <errors>{syntax_errors}</errors>
                                      
                                      Introduce or refine a `timestamp` variable that indicates when each agent performs an action so that compatible actions can execute concurrently when possible.
                                      Ensure the PDDL syntax matches the requirements of the *{target_solver}* planner and that all availability and preference constraints remain satisfied without adding unsupported requirements.

                                      Return the PDDL domain between <domain> and </domain> tags, and the PDDL problem between <problem> and </problem> tags.
                                      Return only raw PDDL code inside the tags; do not add comments or extra characters.
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

        # Format the system prompt
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
        self.system_prompt = inspect.cleandoc(
            """\
            You are an agent that translates PDDL artifacts into natural language instructions.
            Turn the JSON specification, PDDL problem, PDDL domain, and PDDL plan into a clear sequence of
            human-readable actions. Follow the plan provided within the <plan></plan> tags closely.
            You may think through the conversion in as many steps as needed.
            """
        )
        self.prompt = inspect.cleandoc("""\
                                      Given this specification, in JSON format:
                                      <specification>{specification}</specification>
                                      
                                      And this PDDL domain that describes the specification:
                                      <domain>{pddl_domain}</domain>
                                      
                                      And this PDDL problem that instantiates the specification:
                                      <problem>{pddl_problem}</problem>
                                      
                                      This is the PDDL plan that correctly solves the task:
                                      <plan>{pddl_plan}</plan>
                                      
                                      Your task is to output a set of actions that is readable by humans and satisfies the final goal.
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
