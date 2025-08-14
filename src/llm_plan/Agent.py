from ABC import ABC, abstractmethod

from src.llm_plan.Parser import PythonCodeParser
from src.llm_plan.utils import (
    to_snake_case,
    check_syntax,
    write_formatted,
    extract_class_code,
)
from src.llm_plan.LLM import LLM


class Agent(ABC):
    """
    This agent is a base class for all agents in the LLM plan.
    It provides common functionality such as generating code and writing files.
    """

    def __init__(self, model: LLM, task_name: str):
        """_summary_

        Args:
            model (LLM): an LLM from LLM.py
            task_name (str): the name of the task. Keep it PascalCase (e.g., "SingleAgentRoulette")
        """
        self.model = model
        self.task_name = task_name.strip().capitalize()  # This is the class name: ensure at least the task name starts with a capital letter
        self.environemt_name = (
            f"Environment{self.task_name}"  # Environment.py class name
        )
        self.problem_name = f"Problem{self.task_name}"  # Problem.py class name
        self.environment_filename = (
            self.environemt_name + ".py"
        )  # Environment.py file name
        self.problem_filename = self.problem_name + ".py"
        self.experiment_name = to_snake_case(
            task_name
        )  # This is the experiment file name


class AgentCoder(Agent):
    """
    This agent intent is to extend the code in Problem.py,
    Environment.py, or write the file for the experiments.
    """

    def __init__(self, model: LLM, task_name: str, task_description: str):
        """_summary_

        Args:
            model (LLM): an LLM from LLM.py
            task_name (str): the name of the task. Keep it PascalCase (e.g., "SingleAgentRoulette")
            task_description (str): The description, in natural language, of the task. The more detailed, the better. Insert constraints and observability here.
        """
        super().__init__(model, task_name)
        self.task_description = task_description  # This does not necessarily goes into AgentRefiner (keep it here for now)
        self.prefix = (
            "Here's a specific of a task I want you to code:\n{task_description}\n\n\
Here's {problem_filename}, a Python file that defines a class for several single-agent and multi-agent problems:\n{problem_py}.\n\n\
Here's {environment_filename}, a Python file that defines a class for several single-agent and multi-agent environments and \
wraps a problem defined in Problem.py: \n{environemt_py}.\n\n"
        )
        self.prompts = {
            "problem": (
                "{history}\n{prefix}\
Extend the code in Problem.py with a class named {problem_name} to solve the task I gave you at the beginning.\n\
Just return the Python class, not the entire code for Problem.py."
            ),
            "environment": (
                "{history}\n{prefix}\
Extend the code in Environment.py with with a class named {environemt_name} to solve the task I gave you at the beginning.\n\
Just return the Python class, not the entire code for Environment.py."
            ),
            "experiment": (
                "{history}\n{prefix}\
Here's a Python file that defines how to run the experiments once {problem_name} and {environemt_name} are defined\
:\n{experiment_py}.\n\n\
Write the code to run similar experiments as per that file. Just return the Python class, not the entire code."
            ),
        }

        self.system_prompt = (
            "You are an expert Python coder. Your task is to extend existing Python \
code files with new classes or functions based on the provided task description. You will receive a \
history of previous interactions, the current file content, and the task description. Please ensure \
that your code is syntactically correct and follows best practices."
        )

    def code_task(self, history: str | None, task: str) -> str:
        # First, check if the task is valid
        if task not in self.prompts:
            raise ValueError(
                f"Unknown task type: {task}. Expected one of {list(self.prompts.keys())}."
            )

        # 1. Prepare the prompt with the task description and history
        problem_py = open("./Problem.py", "r", encoding="utf-8").read()
        environemt_py = open("./Environment.py", "r", encoding="utf-8").read()
        experiment_py = open(
            "./../main_static_single_agent_blocks_world.py", "r", encoding="utf-8"
        ).read()
        prompt_prefix = self.prefix.format(
            problem_filename=self.problem_filename,
            problem_py=problem_py,
            environemt_filename=self.environment_filename,
            environemt_py=environemt_py,
        )

        # 2. Use the LLM to generate code
        problem_py = self.retrieve_updated_code("problem")
        environemt_py = self.retrieve_updated_code("environment")
        prompt = self.prompts[task].format(
            history=str(history),
            prefix=prompt_prefix,
            task_description=self.task_description,
        )
        if task == "problem":
            prompt.format(
                problem_name=self.problem_name,
            )
        elif task == "environment":
            prompt.format(
                environemt_name=self.environemt_name,
            )
        elif task == "experiment":
            prompt.format(experiment_py=experiment_py)

        result = self.model.generate_sync(self.system_prompt, prompt)

        # 3. Parse the generated code to extract Python code blocks
        parser = PythonCodeParser()
        python_code = parser.parse(result)

        # 4. Check if the generated code has valid syntax
        if python_code is not None:
            syntax_ok = check_syntax(python_code)
        else:
            raise ValueError("Generated code is empty or invalid.")

        # 5. Write to the appropriate file based on the task type
        if syntax_ok:
            if task == "problem":
                write_formatted(python_code, self.problem_filename)
            elif task == "environment":
                write_formatted(python_code, self.environemt_name)
            elif task == "experiment":
                with open(self.experiment_name, "w") as file:
                    file.write(python_code)
        else:
            raise ValueError("Generated code has syntax errors.")

        return prompt + result


class AgentRefiner(Agent):
    """This agent intent is to refine the code generated by AgentCoder."""

    def __init__(self, model: LLM, task_name: str):
        super().__init__(model, task_name)

    def code_task(self, task_description: str) -> None:
        pass
