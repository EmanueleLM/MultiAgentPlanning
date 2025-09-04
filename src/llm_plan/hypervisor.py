import inspect
import importlib.util
from pathlib import Path

from langchain_openai import ChatOpenAI
from langchain_core.messages import HumanMessage, SystemMessage
from llm_plan.config import AGENT_PYTHON_PATH


class Hypervisor:
    def __init__(self, prompt_args: dict[str, str]):
        self.prompt_args = prompt_args
        self.agents = self.get_classes_from_agents()

        self.required_args = {
            "specification": "(str) The specification of the task.",
            "pddl_domain": "(str) The PDDL domain that describes the specification.",
            "pddl_problem": "(str) The PDDL problem that instantiates the specification.",
            "pddl_logs": "(str) The logs of the attempted execution with Fast Downward.",
            "syntax_errors": "(str) The error message returned by a PDDL validator.",
            "history": "(list[str]) The history of the agents picked up.",
        }

        self.history: list[str] = (
            []
        )  # This contains the history of the agents picked up

        self.system_prompt = inspect.cleandoc(
            """\
            You are a hypervisor that manages multiple agents. Each agent has a specific role and capabilities.
            You will read the agents' descriptions and decide which agent is best suited to handle a given task.
            You return the class you selected between <class></class> tags. 
            You always discard abstract classes and classes with abstract methods.
            """
        )
        self.prompt = inspect.cleandoc(
            """\
            You are a hypervisor that manages multiple agents and decides which one is best suited to improve a given plan.
            
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
            
            These are the agents available to improve the plan, along with their capabilities.
            Ignore abstract classes and classes with abstract methods.
            <agents>{agents}</agents>
            
            Also, here is the history of the agents you have already picked.
            <history>{history}</history>
            
            The history is useful as you want to have some diversity in the agents you pick.
            For sure you want to ensure picking up at some point:
            - an agent that fixes the syntax inconsistencies.
            - an agent that adapts the domain and problem to the solver.
            - an agent that ensures the current domain and problem satisfy the specification as a *multi-agent* system, where each action referes to the agent that takes it.
            
            Return the name of the class best suited to improve the plan between <class> and </class> tags.
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
        except Exception:
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
        Upload the arguments to the Agent.

        Input:
            prompt_args (dict): A dictionary containing the arguments.
        """
        for arg in self.required_args.keys():
            if arg not in prompt_args:
                raise ValueError(f"Missing required argument: {arg}")
            self.prompt_args[arg] = prompt_args[arg]

    def run(self, model: ChatOpenAI) -> str:
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
            agents="\n".join(
                f"{name}: {cls.__doc__}" for name, cls in self.agents.items()
            ),
            history=self.history,
        )

        inp = [SystemMessage(content=self.system_prompt), HumanMessage(content=prompt)]
        response = model.invoke(inp).content

        return response
