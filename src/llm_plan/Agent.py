from pathlib import Path

from src.llm_plan.Parser import PythonCodeParser
from src.llm_plan.utils import (
    find_project_root,
    find_project_code,
    to_snake_case,
    check_syntax,
    write_formatted,
    extract_class_code,
)
from src.llm_plan.LLM import LLM


class Agent:
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

        # Get the directory of the the project folder and the src file
        _BASE_DIR = find_project_root(Path(__file__))
        _SRC_DIR = find_project_code(Path(__file__))

        # Build absolute paths relative to the class file
        self.problem_path = _SRC_DIR / "Problem.py"
        self.env_path = _SRC_DIR / "Environment.py"
        self.exp_path = _BASE_DIR / "main_static_single_agent_blocks_world.py"

        self.model = model
        # TODO: ensure the task_name is in PascalCase
        self.task_name = task_name.strip()
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

        def code_task(self) -> str:
            """This method should be implemented by subclasses to perform the coding task."""
            return "Subclasses must implement the code_task method."


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
Here's {problem_filename}, a Python file that defines a class for several single-agent and multi-agent problems:\n\n{problem_py}\n\n\
Here's {environment_filename}, a Python file that defines a class for several single-agent and multi-agent environments and \
wraps a problem defined in Problem.py: \n\n{environemt_py}\n\n"
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
Write the code to run similar experiments as per that file."
            ),
        }

        self.system_prompt = (
            "You are an expert Python coder. Your task is to extend existing Python \
code files with new classes or functions based on the provided task description. You will receive a \
history of previous interactions, the current file content, and the task description. Please ensure \
that your code is syntactically correct and follows best practices."
        )

    def code_task(self, history: str | None, task: str) -> str:
        """_summary_

        Args:
            history (str | None): The history of a conversation. If non-empty, self.prompts[task] won't have a prefix.
            task (str): "problem", "environment", or "experiment". This is the task type to generate code for.

        Returns:
            str: the generated code as a string, which is the prompt + the generated code.
        """
        # First, check if the task is valid
        if task not in self.prompts:
            raise ValueError(
                f"Unknown task type: {task}. Expected one of {list(self.prompts.keys())}."
            )

        # 1. Prepare the prompt with the task description and history
        with (
            open(self.problem_path, "r", encoding="utf-8") as f_prob,
            open(self.env_path, "r", encoding="utf-8") as f_env,
            open(self.exp_path, "r", encoding="utf-8") as f_exp,
        ):
            problem_py = f_prob.read()
            environemt_py = f_env.read()
            experiment_py = f_exp.read()

        # Prefix first
        if len(str(history)) == 0:
            prompt_prefix = self.prefix.format(
                task_description=self.task_description,
                problem_filename=self.problem_path.name,
                problem_py=problem_py,
                environment_filename=self.env_path.name,
                environemt_py=environemt_py,
            )
        else:
            prompt_prefix = ""

        # Then the corresponding task prompt
        if task == "problem":
            prompt = self.prompts[task].format(
                history=str(history),
                prefix=prompt_prefix,
                problem_name=self.problem_name,
            )
        elif task == "environment":
            prompt = self.prompts[task].format(
                history=str(history),
                prefix=prompt_prefix,
                environemt_name=self.environemt_name,
            )
        elif task == "experiment":
            print(task)
            prompt = self.prompts[task].format(
                history=str(history),
                prefix=prompt_prefix,
                problem_name=self.problem_name,
                environemt_name=self.environemt_name,
                experiment_py=experiment_py,
            )

        # 2. Use the LLM to generate code
        print(self.system_prompt)
        print("\n\n")
        print(prompt)
        alakazam

        result = self.model.generate_sync(self.system_prompt, prompt)

        if result is None:
            raise ValueError(
                f"Generated code is None. Check the model or the prompt: {prompt}"
            )

        # 3. Parse the generated code to extract Python code blocks
        parser = PythonCodeParser()
        python_code = parser.parse(result)

        print(result)
        print("=" * 30)
        print(python_code)

        # 4. Check if the generated code has valid syntax
        if python_code is not None:
            syntax_ok = check_syntax(python_code)
        else:
            raise ValueError(
                f"Generated code is empty or invalid.: {result}, {python_code}"
            )

        # # 5. Write to the appropriate file based on the task type
        # if syntax_ok:
        #     if task == "problem":
        #         write_formatted(python_code, self.problem_filename)
        #     elif task == "environment":
        #         write_formatted(python_code, self.environemt_filename)
        #     elif task == "experiment":
        #         with open(self.experiment_name + ".py", "w") as file:
        #             file.write(python_code)
        # else:
        #     raise ValueError("Generated code has syntax errors.")

        return prompt + result


class AgentRefiner(Agent):
    """This agent intent is to refine the code generated by AgentCoder."""

    def __init__(self, model: LLM, task_name: str):
        super().__init__(model, task_name)

    def code_task(self, task_description: str) -> None:
        pass
