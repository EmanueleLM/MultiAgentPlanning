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
        }

        self.history: list[
            str
        ] = []  # This contains the history of the agents picked up

        self.system_prompt = inspect.cleandoc(
            """\
            You are a hypervisor that coordinates multiple specialised agents.
            Each agent has a defined role. Read their descriptions, examine the current planning artefacts, and
            decide which agent is best suited to act next.
            Always discard abstract classes or classes with abstract methods and report the selected class name
            between <class></class> tags.
            Fast Downward only supports classical STRIPS features; reject or repair PDDL that introduces unsupported
            requirements such as :fluents, axioms, or conditional effects.
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

            Consider this priority when choosing the next agent:
            1. Constraints — ensure the domain and problem satisfy every agent's constraints.
            2. Multi-agency — verify the modelling distinguishes each agent's actions appropriately.
            3. Asynchronicity — confirm the domain/problem allow independent concurrent actions when needed.
            4. Syntax — enforce compliance with the target solver's PDDL requirements.
            Additionally, ensure the stay durations and total-day counts match the natural-language specification and
            that only direct flights or links explicitly listed are modelled.

            Select the class best positioned to address the most pressing issue given the current artefacts. If
            you believe the domain, problem, and plan already satisfy the specification, respond with
            <class>NoOpAgent</class>.
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

        # Prepare the selection prompt
        prompt = self.prompt.format(
            human_specification=self.prompt_args["human_specification"],
            specification=self.prompt_args["specification"],
            pddl_domain=self.prompt_args["pddl_domain"],
            pddl_problem=self.prompt_args["pddl_problem"],
            target_solver=self.prompt_args["target_solver"],
            pddl_plan=self.prompt_args["pddl_plan"],
            pddl_logs=self.prompt_args["pddl_logs"],
            syntax_errors=self.prompt_args["syntax_errors"],
            agents="\n".join(
                f"{name}: {cls.__doc__}" for name, cls in self.agents.items()
            ),
            history=self.history,
        )
        return model.generate_sync(
            system_prompt=self.system_prompt,
            prompt=prompt,
        )
