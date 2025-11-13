import inspect
import importlib.util
from pathlib import Path

from src.llm_plan.llm import LLM
from src.llm_plan.config import AGENT_PYTHON_PATH


class Hypervisor:
    def __init__(self, prompt_args: dict[str, str]):
        self.prompt_args = prompt_args
        self.agents = self.get_classes_from_agents()

        self.required_args = {
            "human_specification": "(str) The human specification of the task.",
            "specification": "(str) The specification of the task.",
            "target_solver": "(str) The target PDDL solver.",
            "pddl_domain": "(str) The PDDL domain that describes the specification.",
            "pddl_plan": "(str) The PDDL plan that was generated.",
            "pddl_problem": "(str) The PDDL problem that instantiates the specification.",
            "pddl_logs": "(str) The logs of the attempted execution with the solver.",
            "syntax_errors": "(str) The error message returned by a PDDL validator.",
            "history": "(list[str]) The history of the agents picked up.",
            "proposed_solution": "(str) The currently endorsed solution (may be empty).",
        }

        self.history: list[str] = list(
            prompt_args.get("history", [])
        )  # Copy of the history so far

        self.system_prompt = inspect.cleandoc(
            """\
            You are a hypervisor that coordinates multiple specialised agents.
            Each agent has a defined role. Read their descriptions, examine the current planning artefacts, and
            decide which agent is best suited to act next.
            Always discard abstract classes or classes with abstract methods and report the selected class name
            between <class></class> tags.
            Fast Downward only supports classical STRIPS features; reject or repair PDDL that introduces unsupported
            requirements such as :fluents, axioms, or conditional effects.
            Pay special attention to artefacts that defer constraints through bookkeeping tokens, post-hoc penalties,
            or lax goal conditions—prefer agents that encode the constraints directly.
            """
        )
        self.prompt = inspect.cleandoc(
            """\
            You are choosing the next agent to improve the current PDDL artefacts.

            Human specification of the task:
            <human_specification>{human_specification}</human_specification>

            JSON plan specification of the task:
            <specification>{specification}</specification>

            Current PDDL domain:
            <domain>{pddl_domain}</domain>

            Current PDDL problem:
            <problem>{pddl_problem}</problem>

            Previously hypothesised solution. Confirm or revise as needed. Think about this carefully!
            <proposed_solution>{proposed_solution}</proposed_solution>

            Plan produced for the {target_solver} solver (may be empty):
            <plan>{pddl_plan}</plan>

            Logs from the solver execution:
            <logs>{pddl_logs}</logs>

            Validator feedback (may be empty):
            <errors>{syntax_errors}</errors>

            Available agents and their capabilities (exclude abstract classes):
            <agents>{agents}</agents>

            Agents previously selected (helps maintain diversity):
            <history>{history}</history>

            Consider selecting the agent for refinement, depending on the issues that you see in the artefacts:
            1. Constraints — ensure the domain and problem satisfy every agent's constraints.
            2. Multi-agency — verify the modelling distinguishes each agent's actions appropriately.
            3. Asynchronicity — confirm the domain/problem allow independent concurrent actions when needed.
            4. Syntax — enforce compliance with the target solver's PDDL requirements.
            5. Temporal/Causal coherence — disallow token-based bookkeeping, enforce explicit ordering, and prevent
               oscillating transitions when the specification expects contiguous or monotonic progress.

            Select the class best positioned to address the most pressing issue given the current artefacts.
            Only answer <class>NoOpAgent</class> when every objective above is demonstrably satisfied.
            """
        )

    @staticmethod
    def get_classes_from_agents():
        """
        Imports all classes from the agent.py file inside src/llm_plan.

        Returns:
            dict: A dictionary of class names to class objects.
        """
        module_path = Path(AGENT_PYTHON_PATH).resolve()
        # print(f"Attempting to load module from: {module_path}")

        try:
            # Load the module dynamically from file
            spec = importlib.util.spec_from_file_location(module_path.stem, module_path)
            if spec is None:
                print(f"Failed to create a module spec for {module_path}")
                return {}

            module = importlib.util.module_from_spec(spec)
            spec.loader.exec_module(module)
            # print(f"Module {module.__name__} loaded successfully!")
        except Exception as e:
            # print(f"Error importing module {module_path}: {e}")
            return {}

        # Gather all classes defined directly in this module
        classes_dict = {}
        for name, obj in inspect.getmembers(module, inspect.isclass):
            # Only include classes defined in this module, not imported ones
            if getattr(obj, "__module__", None) == module.__name__:
                classes_dict[name] = obj

        if not classes_dict:
            print(f"No classes found in module {module.__name__}. Available members:")
            for name, obj in inspect.getmembers(module):
                print(f" - {name}: {type(obj)}")

        return classes_dict

    def upload_args(self, prompt_args: dict[str, str]) -> None:
        """
        Upload the arguments required by the hypervisor.

        Input:
            prompt_args (dict): A dictionary containing the arguments.
        """
        for arg in self.required_args.keys():
            if arg not in prompt_args:
                raise ValueError(f"Missing required argument: {arg}")
            self.prompt_args[arg] = prompt_args[arg]

    def run(self, model: LLM) -> str:
        """
        Run the hypervisor to select the next agent.

        Input:
            model (LLM): The language model used to evaluate the prompt and return the agent class name.

        Output:
            str: The selected agent class wrapped in <class></class> tags.
        """
        self.upload_args(self.prompt_args)  # ensure args are uploaded
        # Refresh local history in case the caller updated the list reference
        self.history = list(self.prompt_args.get("history", []))

        first_agent = "AgentSolutionFirst"
        has_solution = bool(str(self.prompt_args.get("proposed_solution", "")).strip())
        if (
            first_agent in self.agents
            and not self.history
            and not has_solution
        ):
            return f"<class>{first_agent}</class>"

        # Prepare the selection prompt
        agents_for_prompt = self.agents
        if self.history and first_agent in self.history:
            filtered = {name: cls for name, cls in self.agents.items() if name != first_agent}
            if filtered:
                agents_for_prompt = filtered

        prompt_kwargs = {
            "human_specification": self.prompt_args["human_specification"],
            "specification": self.prompt_args["specification"],
            "pddl_domain": self.prompt_args["pddl_domain"],
            "pddl_problem": self.prompt_args["pddl_problem"],
            "target_solver": self.prompt_args["target_solver"],
            "pddl_plan": self.prompt_args["pddl_plan"],
            "pddl_logs": self.prompt_args["pddl_logs"],
            "syntax_errors": self.prompt_args["syntax_errors"],
            "agents": "\n".join(
                f"{name}: {cls.__doc__}" for name, cls in agents_for_prompt.items()
            ),
            "history": ", ".join(self.history),
            "proposed_solution": self.prompt_args.get("proposed_solution", ""),
        }

        if "proposed_solution" in self.prompt_args:
            prompt_kwargs["proposed_solution"] = self.prompt_args["proposed_solution"]

        prompt = self.prompt.format(**prompt_kwargs)
        return model.generate_sync(
            system_prompt=self.system_prompt,
            prompt=prompt,
        )


class SolutionVerifierHypervisor(Hypervisor):
    """
    Hypervisor variant that validates a proposed solution by orchestrating agents
    to build verification PDDL artefacts or repair the solution when needed.
    """

    def __init__(self, prompt_args: dict[str, str]):
        super().__init__(prompt_args)
        self.required_args = {
            **self.required_args,
            "proposed_solution": (
                "(str) The proposed solution that should satisfy the task constraints."
            ),
        }

        self.system_prompt = inspect.cleandoc(
            """\
            You are a validation hypervisor coordinating specialised agents.
            Your purpose is to drive the agents until the generated PDDL domain/problem conclusively
            verify (or refute) the proposed solution.
            Work only with concrete, fully specified PDDL; never accept placeholders such as "..." or templates.
            Reject outputs that rely on unsupported Fast Downward requirements (e.g., axioms, universals, conditional
            effects, :fluents) or malformed action schemas (:parameters, :precondition, :effect orderings).
            Discard abstract classes or those with abstract methods and report the selected class name between
            <class></class> tags.
            """
        )

        self.prompt = inspect.cleandoc(
            """\
            You are validating a proposed solution for the planning task.

            Human specification of the task:
            <human_specification>{human_specification}</human_specification>

            JSON plan specification of the task:
            <specification>{specification}</specification>

            Proposed solution to validate:
            <proposed_solution>{proposed_solution}</proposed_solution>

            Current PDDL domain (should encode the validation criteria):
            <domain>{pddl_domain}</domain>

            Current PDDL problem (should instantiate the validation criteria):
            <problem>{pddl_problem}</problem>

            Plan produced for the {target_solver} solver (may be empty or the proposed plan):
            <plan>{pddl_plan}</plan>

            Logs from the solver execution:
            <logs>{pddl_logs}</logs>

            Validator feedback (may be empty):
            <errors>{syntax_errors}</errors>

            Available agents and their capabilities (exclude abstract classes):
            <agents>{agents}</agents>

            Agents previously selected (helps maintain diversity):
            <history>{history}</history>

            Primary objectives (all must hold before selecting NoOpAgent):
            1. The PDDL domain/problem are syntactically valid (no placeholders, templates, or unsupported features).
            2. The solver logs confirm the model either validates the proposed solution or provides a corrected plan.
            3. All natural-language constraints are encoded so that violating them becomes impossible in any satisfying plan.

            Use the syntax errors and solver logs as ground truth feedback: repair anything they flag.
            Each agent you select must either confirm the proposed solution or revise it, and restate the endorsed
            outcome inside <proposed_solution></proposed_solution> tags together with any updated PDDL.
            Select the class best positioned to progress this validation. Only answer <class>NoOpAgent</class> when every
            objective above is demonstrably satisfied.
            """
        )
