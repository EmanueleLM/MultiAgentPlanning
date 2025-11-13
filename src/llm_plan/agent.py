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


class AgentSolutionFirst(Agent):
    """
    Agent that first derives a concrete solution directly from the human/JSON specifications,
    then authors PDDL artefacts that make that proposed solution provably feasible.
    This agent should be called first, before any other agent, and never called again!
    """

    required_args = {
        "human_specification": "(str) The human-readable specification of the task.",
        "specification": "(str) The structured JSON specification of the task.",
        "target_solver": "(str) The target PDDL solver.",
        "pddl_domain": "(str) The current PDDL domain (may be empty or preliminary).",
        "pddl_problem": "(str) The current PDDL problem (may be empty or preliminary).",
        "pddl_plan": "(str) The current PDDL plan (may be empty).",
        "proposed_solution": "(str) The previously endorsed solution to reconsider (may be empty).",
    }  # Static!

    def __init__(self, llm: LLM, prompt_args: dict[str, str]):
        """
        Agent that hypothesises a solution before touching PDDL and then constructs
        validation artefacts (domain/problem) proving that solution satisfies all constraints.
        The returned text contains the hypothesised solution between <proposed_solution> tags
        followed by <domain> and <problem> sections with the verification model.
        """
        super().__init__(prompt_args=prompt_args)
        self.name = "AgentSolutionFirst"
        self.llm = llm

        self.system_prompt = inspect.cleandoc(
            """\
            You are a faithful multi-agent planning engineer.
            Step 1: Carefully read the human specification and JSON data to deduce a concrete,
            constraint-satisfying solution (e.g., the scheduled meeting time and participants).
            Step 2: Build PDDL domain/problem artefacts that encode every constraint so that the
            deduced solution is the natural satisfying plan and any violation becomes impossible.
            Use only Fast Downward compatible constructs (:strips :typing :negative-preconditions,
            with :action-costs only when matched by (increase ...) effects).
            Never leave placeholders, ellipses, or unsupported requirements.
            """
        )
        self.prompt = inspect.cleandoc(
            """\
            Human specification of the task:
            <human_specification>{human_specification}</human_specification>

            Structured JSON specification:
            <specification>{specification}</specification>

            Current PDDL domain (for reference only, you must re-derive constraints):
            <domain>{pddl_domain}</domain>

            Current PDDL problem (for reference only, you must re-derive constraints):
            <problem>{pddl_problem}</problem>

            Existing plan artefacts (may be empty; do not rely on them):
            <plan>{pddl_plan}</plan>

            Previously hypothesised solution (may be empty). Use it only as a hypothesis to confirm or adjust your PDDL:
            <proposed_solution>{proposed_solution}</proposed_solution>

            Follow this procedure:
            1. Derive a concrete solution directly from the human + JSON specification without
               relying on the provided PDDL.
            2. State that solution inside <proposed_solution></proposed_solution> tags.
            3. Produce a fresh PDDL domain between <domain></domain> tags and a PDDL problem
               between <problem></problem> tags that **verifies** whether the solution is feasible while
               enforcing every timing/availability constraint. Again, the <proposed_solution></proposed_solution> is just a hypothesis
               to confirm or adjust, do not rely on it! The proposed solution should never be explicitly stated in the goal of the PDDL problem!
            4. Ensure the artefacts are self-consistent, solver-ready, and contain no placeholders.
            """
        )

    def run(self) -> str:
        """Generate a direct solution and the validating PDDL artefacts."""
        self.upload_args(self.prompt_args)
        prompt = self.prompt.format(
            human_specification=self.prompt_args["human_specification"],
            specification=self.prompt_args["specification"],
            proposed_solution=self.prompt_args.get("proposed_solution", ""),
            pddl_domain=self.prompt_args.get("pddl_domain", ""),
            pddl_problem=self.prompt_args.get("pddl_problem", ""),
            pddl_plan=self.prompt_args.get("pddl_plan", ""),
        )
        return self.llm.generate_sync(
            system_prompt=self.system_prompt,
            prompt=prompt,
        )


class AgentHallucinations(Agent):
    required_args = {
        "human_specification": "(str) The human-readable specification of the task.",
        "specification": "(str) The structured description of the task (JSON).",
        "pddl_domain": "(str) The PDDL domain authored by the model.",
        "pddl_problem": "(str) The PDDL problem authored by the model.",
        "pddl_plan": "(str) The PDDL plan produced so far (may be empty).",
        "proposed_solution": "(str) The currently endorsed solution to confirm or adjust.",
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
            Limit the :requirements list to those supported by Fast Downward (:typing, :negative-preconditions);
            never introduce :fluents, axioms, conditional effects, or durative constructs. Remove placeholder
            artefacts such as '...', 'None', or 'TBD', and ensure that any cost modelling uses (increase ...)
            effects instead of ':cost' headers. If :action-costs remains in the requirements list, verify that
            matching increase effects exist; otherwise drop the requirement.
            """
        )

        self.prompt = inspect.cleandoc(
            """\
            Human specification of the task:
            <human_specification>{human_specification}</human_specification>

            JSON specification (ground truth facts and workflow):
            <specification>{specification}</specification>

            Previously hypothesised solution (confirm or revise as needed):
            <proposed_solution>{proposed_solution}</proposed_solution>

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
            Remove every placeholder or sentinel token (e.g., '...', 'None') and expand the domain/problem fully.
            Replace any ':cost' declarations on action headers with (increase ...) effects and strip unsupported
            requirements other than :typing, :negative-preconditions, and justified :action-costs.
            When uncertain, prefer conservative edits instead of introducing new abstractions.
            The <proposed_solution></proposed_solution> is just a hypothesis to confirm or adjust with PDDL, do not rely on it and should never be explicitly stated in the goal of the PDDL problem! 

            Return the domain between <domain></domain>, the problem between <problem></problem>. Return them inside the respective tags; do not add comments or extra characters to it.
            """
        )

    def run(self) -> str:
        """Run the agent to eliminate hallucinations from the PDDL domain and problem."""
        self.upload_args(self.prompt_args)

        prompt = self.prompt.format(
            human_specification=self.prompt_args["human_specification"],
            specification=self.prompt_args["specification"],
            proposed_solution=self.prompt_args.get("proposed_solution", ""),
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
        "proposed_solution": "(str) The currently endorsed solution to confirm or adjust.",
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
            actions, etc.). Remove placeholder tokens such as '...' or 'None', limit :requirements to
            (:strips :typing :negative-preconditions) plus :action-costs only when matching (increase ...)
            effects are present, and ensure costs are modelled via effects rather than ':cost' headers.
            """
        )
        self.prompt = inspect.cleandoc("""\
                                      Given this human specification of a task:
                                      <human_specification>{human_specification}</human_specification>
                                      
                                      This is a plan specification, in JSON format, of the task:
                                      <specification>{specification}</specification>
                                      
                                      Previously hypothesised solution (confirm or revise as needed):
                                      <proposed_solution>{proposed_solution}</proposed_solution>
                                      
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
                                      - The :requirements list stays within (:strips :typing :negative-preconditions) with :action-costs only when justified by (increase ...) effects, and there are no placeholder tokens such as '...' or 'None'.
                                      - Action costs, when needed, are implemented through (increase ...) effects rather than ':cost' declarations on headers.

                                      The <proposed_solution></proposed_solution> is just a hypothesis to confirm or adjust with PDDL, do not rely on it and should never be explicitly stated in the goal of the PDDL problem! 

                                      Return the domain between <domain></domain>, the problem between <problem></problem>. Return them inside the respective tags; do not add comments or extra characters to it.
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
            proposed_solution=self.prompt_args.get("proposed_solution", ""),
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
        "proposed_solution": "(str) The currently endorsed solution to confirm or adjust.",
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
            and :action-costs only when justified by (increase ...) effects). Remove placeholder tokens such as '...'
            or 'None', and rewrite any ':cost' headers as (increase ...) effects.
            """
        )
        self.prompt = inspect.cleandoc("""\
                                      Given this human specification of a task:
                                      <human_specification>{human_specification}</human_specification>
                                      
                                      This is a plan specification, in JSON format, of the task:
                                      <specification>{specification}</specification>
                                      
                                      Previously hypothesised solution (confirm or revise as needed):
                                      <proposed_solution>{proposed_solution}</proposed_solution>
                                      
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
                                      - There are no placeholder tokens left (e.g., '...' or 'None'), all :requirements are limited to (:strips :typing :negative-preconditions) with :action-costs only when matching (increase ...) effects are present, and action headers do not use ':cost'.

                                      The <proposed_solution></proposed_solution> is just a hypothesis to confirm or adjust with PDDL, do not rely on it and should never be explicitly stated in the goal of the PDDL problem! 

                                      Return the domain between <domain></domain>, the problem between <problem></problem>. Return them inside the respective tags; do not add comments or extra characters to it.
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
            proposed_solution=self.prompt_args.get("proposed_solution", ""),
            pddl_domain=self.prompt_args["pddl_domain"],
            pddl_problem=self.prompt_args["pddl_problem"],
            pddl_plan=self.prompt_args["pddl_plan"],
        )
        return self.llm.generate_sync(
            system_prompt=self.system_prompt,
            prompt=prompt,
        )


class AgentTemporalConsistency(Agent):
    """
    Agent that audits temporal and causal consistency, ensuring specifications with ordered phases or durations
    are encoded explicitly without relying on bookkeeping shortcuts such as penalty tokens or quota pay-offs.
    """

    required_args = {
        "human_specification": "(str) The human-readable specification of the task.",
        "specification": "(str) The structured task description (JSON).",
        "pddl_domain": "(str) The current PDDL domain.",
        "pddl_problem": "(str) The current PDDL problem.",
        "pddl_plan": "(str) The latest plan produced for the model (may be empty).",
        "pddl_logs": "(str) The solver logs for the latest attempt (may be empty).",
        "syntax_errors": "(str) Validator or parser feedback (may be empty).",
        "target_solver": "(str) The target solver that must accept the artefacts.",
        "proposed_solution": "(str) The currently endorsed solution to confirm or adjust.",
    }  # Static!

    def __init__(self, llm: LLM, prompt_args: dict[str, str]):
        super().__init__(prompt_args=prompt_args)
        self.name = "AgentTemporalConsistency"
        self.llm = llm

        self.system_prompt = inspect.cleandoc(
            """\
            You are a planning engineer focused on temporal and causal consistency.
            Ensure that enumerated phases, resource limits, and ordering constraints from the specification
            are encoded as hard requirements. Eliminate bookkeeping shortcuts (quota tokens, “pay shortfall”
            actions, optional penalty payments, or oscillating transitions) that allow violations after the fact.
            Model discrete time or stage progression explicitly (e.g., via ordered objects and successor predicates),
            require contiguous occupancy when durations are specified, and enforce terminal conditions exactly as
            described. Keep :requirements within (:strips :typing :negative-preconditions) unless a matching
            (increase ...) effect justifies :action-costs. Never leave placeholders or assume extra connectivity.
            """
        )

        self.prompt = inspect.cleandoc(
            """\
            Human specification of the task:
            <human_specification>{human_specification}</human_specification>

            Structured JSON specification:
            <specification>{specification}</specification>

            Previously hypothesised solution (confirm or revise as needed):
            <proposed_solution>{proposed_solution}</proposed_solution>

            Current PDDL domain:
            <domain>{pddl_domain}</domain>

            Current PDDL problem:
            <problem>{pddl_problem}</problem>

            Latest plan produced for the {target_solver} solver (may be empty):
            <plan>{pddl_plan}</plan>

            Solver logs (may be empty):
            <logs>{pddl_logs}</logs>

            Validator or syntax feedback (may be empty):
            <errors>{syntax_errors}</errors>

            Rebuild the domain and problem, if needed, so that:
            - Ordered stages or time windows appear as explicit objects/predicates the solver must respect.
            - Durations or quotas are enforced structurally, without slack tokens or post-hoc penalty actions.
            - Actions cannot oscillate between states when the specification requires contiguous occupancy.
            - Initial state and goals capture every mandatory completion condition instead of auxiliary bookkeeping.
            - No placeholders remain and the :requirements list contains only features supported by the target solver.

            Return the revised domain between <domain></domain> and the problem between <problem></problem>. Do not add commentary outside the tags.
            """
        )

    def run(self) -> str:
        """Ensure temporal and causal consistency in the PDDL artefacts."""
        self.upload_args(self.prompt_args)

        prompt = self.prompt.format(
            human_specification=self.prompt_args["human_specification"],
            specification=self.prompt_args["specification"],
            proposed_solution=self.prompt_args.get("proposed_solution", ""),
            pddl_domain=self.prompt_args["pddl_domain"],
            pddl_problem=self.prompt_args["pddl_problem"],
            pddl_plan=self.prompt_args.get("pddl_plan", ""),
            pddl_logs=self.prompt_args.get("pddl_logs", ""),
            syntax_errors=self.prompt_args.get("syntax_errors", ""),
            target_solver=self.prompt_args.get("target_solver", ""),
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
        "proposed_solution": "(str) The currently endorsed solution to confirm or adjust.",
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
            before approving the domain/problem pair. Remove placeholder tokens (e.g., '...', 'None'), limit
            :requirements to (:strips :typing :negative-preconditions) with :action-costs only when justified by
            (increase ...) effects, and rewrite any ':cost' headers as proper increase effects.
            """
        )
        self.prompt = inspect.cleandoc("""\
                                      Given this human specification of a task:
                                      <human_specification>{human_specification}</human_specification>
                                      
                                      This is a plan specification, in JSON format, of the task:
                                      <specification>{specification}</specification>
                                      
                                      Previously hypothesised solution (confirm or revise as needed):
                                      <proposed_solution>{proposed_solution}</proposed_solution>
                                      
                                      Now, consider this PDDL domain that describes the specification:
                                      <domain>{pddl_domain}</domain>
                                      
                                      And this is the PDDL problem that instantiates the specification:
                                      <problem>{pddl_problem}</problem>
                                      
                                      Now, for the {target_solver} PDDL solver, think *very carefully* about whether:
                                      - The PDDL domain and plan correctly implement the JSON specification as well as the human specification within a multi-agent system.
                                      - The PDDL domain and problem correctly identify each agent's action and treat them as distinct variables and entities.
                                      - The PDDL domain and problem define variables that are expressive names that allow mapping them back to the specification.
                                      - The encoded connections and actions are limited to direct links explicitly listed, and the time durations add up to the stated horizon.
                                      - There are no placeholder tokens like '...' or 'None'; :requirements only contain (:strips :typing :negative-preconditions) with :action-costs retained solely when (increase ...) effects are present, and action schemas do not use ':cost' headers.

                                      The <proposed_solution></proposed_solution> is just a hypothesis to confirm or adjust with PDDL, do not rely on it and should never be explicitly stated in the goal of the PDDL problem! 

                                      Return the domain between <domain></domain>, the problem between <problem></problem>. Return them inside the respective tags; do not add comments or extra characters to it.
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
            proposed_solution=self.prompt_args.get("proposed_solution", ""),
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
        "proposed_solution": "(str) The currently endorsed solution to confirm or adjust.",
    }  # Static!

    def __init__(self, llm: LLM, prompt_args: dict[str, str]):
        """
        This agent adapts the PDDL domains and problems so that they are compatible with the Fast Downwards Planner solver.
        In particular:
        - It replaces numeric fluent predicates with logical predicates.
        - It pre-computes arithmetic constraints as predicates in the problem.
        - It discretizes temporal/duration effects into sequences of instantaneous actions.
        - It uses symbolic ordering instead of numeric comparisons.
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
            Restrict the :requirements list to features supported by Fast Downward (:typing, :negative-preconditions);
            strip out :fluents, axioms, conditional effects, or durative constructs entirely. Remove placeholder
            tokens such as '...' or 'None', and convert any ':cost' headers into explicit (increase ...) effects,
            keeping :action-costs only when such effects remain.
            """
        )
        self.prompt = inspect.cleandoc("""\
            Given this specification, in JSON format:
            <specification>{specification}</specification>

            Previously hypothesised solution (confirm or revise as needed):
            <proposed_solution>{proposed_solution}</proposed_solution>

            And this PDDL domain:
            <domain>{pddl_domain}</domain>

            And this PDDL problem:
            <problem>{pddl_problem}</problem>

            Rewrite the domain and problem to be compatible with Fast Downwards Planner:
            - Replace numeric fluent predicates with logical predicates.
            - Pre-compute arithmetic constraints as predicates in the problem.
            - Discretize temporal/duration effects into sequences of instantaneous actions.
            - Use symbolic ordering instead of numeric comparisons.
            - Keep types, equality, and STRIPS/ADL features.
            - Remove unsupported requirements such as :fluents, axioms, or conditional effects; ensure only direct connections mentioned in the source specification remain.
            - Eliminate placeholder tokens, ensure :requirements are limited to (:strips :typing :negative-preconditions) plus justified :action-costs, and move any ':cost' declarations into (increase ...) effects.
            
            The <proposed_solution></proposed_solution> is just a hypothesis to confirm or adjust with PDDL, do not rely on it and should never be explicitly stated in the goal of the PDDL problem! 

            Return the domain between <domain></domain>, the problem between <problem></problem>. Return them inside the respective tags; do not add comments or extra characters to it.
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
            proposed_solution=self.prompt_args.get("proposed_solution", ""),
            pddl_domain=self.prompt_args["pddl_domain"],
            pddl_problem=self.prompt_args["pddl_problem"],
        )

        return self.llm.generate_sync(
            system_prompt=self.system_prompt,
            prompt=prompt,
        )


class AgentReduceVariables(Agent):
    """
    Agent that shrinks the initial state of a PDDL problem by reducing the number of predicates
    listed inside the :init section while keeping the task faithful to the specification.
    """

    required_args = {
        "human_specification": "(str) The human-readable specification of the task.",
        "specification": "(str) The structured description of the task (JSON).",
        "pddl_domain": "(str) The PDDL domain to revise.",
        "pddl_problem": "(str) The PDDL problem whose :init must be reduced.",
        "proposed_solution": "(str) The currently endorsed solution to confirm or adjust.",
    }  # Static!

    def __init__(self, llm: LLM, prompt_args: dict[str, str]):
        """
        This agent rewrites the domain/problem pair to keep the task semantics intact while explicitly
        reducing the number of predicates enumerated in the :init section of the problem.
        It removes redundant objects, factors symmetries, and encodes invariants structurally so that fewer
        ground facts are required to express the same constraints, improving Fast Downward scalability.
        """
        super().__init__(prompt_args=prompt_args)
        self.name = "AgentReduceVariables"
        self.llm = llm

        self.system_prompt = inspect.cleandoc(
            """\
            You are a classical planning engineer focused on trimming the initial state cardinality.
            Rewrite the PDDL domain/problem so that the :init section contains as few predicate instances as
            possible without altering the real constraints described by the specification.
            Strategies include removing unused objects, merging symmetric resources, introducing helper types
            or predicates that encode invariants once, and ensuring duplicate or implied facts are dropped.
            Maintain Fast Downward compatibility (:typing, :negative-preconditions, optional :action-costs only
            when justified by matching (increase ...) effects) and never relax the specification's constraints.
            """
        )
        self.prompt = inspect.cleandoc(
            """\
            Human specification of the task:
            <human_specification>{human_specification}</human_specification>

            JSON description of the task:
            <specification>{specification}</specification>

            Previously hypothesised solution (may be empty; confirm or adjust as needed):
            <proposed_solution>{proposed_solution}</proposed_solution>

            Current PDDL domain:
            <domain>{pddl_domain}</domain>

            Current PDDL problem:
            <problem>{pddl_problem}</problem>

            Produce a revised domain/problem pair that preserves the task semantics but **reduces the number of
            predicates listed inside the :init block**. Ensure:
            - Remove or merge redundant objects and facts while keeping every goal-supporting predicate reachable.
            - Encode shared invariants or ordering through domain rules rather than enumerating all combinations
              inside :init.
            - Keep :requirements limited to (:strips :typing :negative-preconditions) plus justified :action-costs,
              and remove placeholder tokens such as '...' or 'None'.
            Return the updated domain between <domain></domain> and the updated problem between
            <problem></problem>. Output only the tagged PDDL artefacts.
            """
        )

    def run(self) -> str:
        """Reduce the number of predicates declared in the :init section while keeping semantics intact."""
        self.upload_args(self.prompt_args)
        prompt = self.prompt.format(
            human_specification=self.prompt_args["human_specification"],
            specification=self.prompt_args["specification"],
            proposed_solution=self.prompt_args.get("proposed_solution", ""),
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
        "proposed_solution": "(str) The currently endorsed solution to confirm or adjust.",
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
            features supported by Fast Downward (:typing, :negative-preconditions, and :action-costs only when
            (increase ...) effects remain). Remove placeholder tokens such as '...' or 'None', and ensure action
            schemas never rely on ':cost' headers—instead express costs with (increase ...) effects.
            """
        )
        self.prompt = inspect.cleandoc("""\
                                      Given this specification of a plan, in JSON format:
                                      <specification>{specification}</specification>
                                      
                                      And this PDDL domain that describes the specification:
                                      <domain>{pddl_domain}</domain>
                                      
                                      And this PDDL problem that instantiates the specification:
                                      <problem>{pddl_problem}</problem>
                                      
                                      Previously hypothesised solution (confirm or revise as needed):
                                      <proposed_solution>{proposed_solution}</proposed_solution>
                                      
                                      These are the logs of the attempted execution with the *{target_solver}* planner:
                                      <logs>{pddl_logs}</logs>
                                      
                                      This is the error message returned by a PDDL validator (can be empty or successful):
                                      <errors>{syntax_errors}</errors>
                                      
                                      Fix any errors in the PDDL domain and problem so that they satisfy the PDDL syntax required by the *{target_solver}* planner.
                                      Ensure that no constraint (availability, duration, preference) is lost during the fix and that unsupported requirements (e.g., :fluents, axioms, conditional effects) are removed.
                                      Replace any placeholder tokens (like '...' or 'None'), keep :requirements within (:strips :typing :negative-preconditions) plus justified :action-costs, and rewrite ':cost' annotations into (increase ...) effects when needed.
                                      If anything does not satisfy the specification, return a corrected version of the PDDL domain and problem; otherwise, return the originals.

                                      The <proposed_solution></proposed_solution> is just a hypothesis to confirm or adjust with PDDL, do not rely on it and should never be explicitly stated in the goal of the PDDL problem! 

                                      Return the domain between <domain></domain>, the problem between <problem></problem>. Return them inside the respective tags; do not add comments or extra characters to it.
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
            proposed_solution=self.prompt_args.get("proposed_solution", ""),
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
        "proposed_solution": "(str) The currently endorsed solution to confirm or adjust.",
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
                                      
                                      Previously hypothesised solution (confirm or revise as needed):
                                      <proposed_solution>{proposed_solution}</proposed_solution>
                                      
                                      These are the logs of the attempted execution with the *{target_solver}* planner:
                                      <logs>{pddl_logs}</logs>
                                      
                                      This is the error message returned by a PDDL validator (can be empty or successful):
                                      <errors>{syntax_errors}</errors>
                                      
                                      Introduce or refine a `timestamp` variable that indicates when each agent performs an action so that compatible actions can execute concurrently when possible.
                                      Ensure the PDDL syntax matches the requirements of the *{target_solver}* planner and that all availability and preference constraints remain satisfied without adding unsupported requirements.

                                      The <proposed_solution></proposed_solution> is just a hypothesis to confirm or adjust with PDDL, do not rely on it and should never be explicitly stated in the goal of the PDDL problem! 

                                      Return the domain between <domain></domain>, the problem between <problem></problem>. Return them inside the respective tags; do not add comments or extra characters to it.
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
            proposed_solution=self.prompt_args.get("proposed_solution", ""),
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
