import inspect
import json

from pathlib import Path

from src.llm_plan.config import (
    ENVIRONMENTS_JSON_PATH,
    ENVIRONMENTS_JSON_SAMPLE_PATH,
    ENVIRONMENTS_PYTHON_PATH_SAMPLE,
)
from src.llm_plan.environment import Environment
from src.llm_plan.llm import LLM
from src.llm_plan.utils import get_fields_in_formatted_string, get_json_nested_fields


class Planner:
    def __init__(self):
        """This class uses a workflow in an environment to plan with LLMs."""
        self.environment: Environment
        self.format_fields: dict[str, str] = {}

    @staticmethod
    def generate_representation(
        model: LLM, specific: str, env_name: str, format: str = "json"
    ) -> Path:
        """Generate a new environment representation in the given format and save it
        in ENVIRONMENTS_JSON_PATH (for json).

        Args:
            specific (str): The human description of the planning task.
            env_name (str): The name of the task, in PascalCase.
            format (str, optional): The target format of the environment. Defaults to "json".

        Returns:
            str: The path where the plan is saved in the desired format.
        """
        if format == "json":
            tag_begin, tag_end = "<json>", "</json>"
        else:
            raise NotImplementedError(f"Format {format} not supported.")

        # 1. Prepare the prompts and the samples
        system_prompt = inspect.cleandoc("""\
                                        You are an expert of {format} and also very knowledgable about PDDL plans. 
                                        Your task is to return a valid {format} file that is compliant with the human specifics.
                                        """)
        prompt = inspect.cleandoc("""\
                                 Here's an example of a {format} file that describes an environment:
                                 <environment-{format}>{sample_environment}</environment-{format}>
                                 
                                 This is the code of the Environment class that describes the structure of the environment:
                                 <code>{environment_class}</code>
                                 
                                 Your task is to generate a new {format} file that describes an environment for the following human specifics:
                                 <use-case>{specific}</use-case>
                                 
                                 Think carefully about the entities, their attributes, and the relationships between them.
                                 Make sure the {format} file is valid and can be parsed without errors.
                                 
                                 Remember that the {format} that you return:
                                 - Should include instructions that ask to generate PDDL domain and problem files.
                                 - Should not contain special characters like \\n, etc.
                                 - Should be properly formatted and indented. Don't wrap it between quotes.
                                 
                                 Think step by step and return the {format} file within {tag_begin}{tag_end} tags.
                                 """)

        with open(ENVIRONMENTS_JSON_SAMPLE_PATH, "r") as f:
            sample_environment = json.load(f)

        with open(ENVIRONMENTS_PYTHON_PATH_SAMPLE, "r") as f:
            environment_class = f.read()

        prompt = prompt.format(
            format=format,
            sample_environment=sample_environment,
            environment_class=environment_class,
            specific=specific,
            tag_begin=tag_begin,
            tag_end=tag_end,
        )

        # 2. Ask the llm to generate a representation of the new environment in the given format
        response = model.generate_sync(system_prompt=system_prompt, prompt=prompt)
        print(response)

        # Identify the plan in the response
        format_start = response.index(tag_begin) + len(tag_begin)
        format_end = response.index(tag_end)
        formatted_environment = response[format_start:format_end].strip()

        # 4. Save the representation in the correct folder
        filename = env_name + "." + format
        try:
            if format == "json":
                formatted_environment = json.loads(formatted_environment)
            else:
                raise NotImplementedError(f"Format {format} not supported.")
        except json.JSONDecodeError as e:
            print(f"!: The generated environment is not a valid {format}.")
            print(f"[ERROR]: {e}")
            print(
                f"The file will be saved in {filename} but you have to fix the {format} errors manually."
            )

        with open(ENVIRONMENTS_JSON_PATH / filename, "w") as f:
            json.dump(formatted_environment, f, indent=4)

        # 5. Return its path
        return ENVIRONMENTS_JSON_PATH / env_name

    def plan(self, model: LLM, environment: Environment) -> dict[str, str]:
        """
        Take a workflow and generate a sequential plan using the LLMs.
        Parallelizable actions are executed in the order they appear in the sequence.
        """
        self.environment = environment

        assert self.environment.plan is not None, (
            "Environment must have an instantiated plan method."
        )

        for sequence in self.environment.plan:
            for action in sequence:
                # Agent and action are separated by a dot
                agent_name, action_name = action.split(".")

                # Get the agent workflow and extract the prompt details
                agent_workflow = self.environment.workflow[agent_name]
                prompt = agent_workflow[action_name].get("prompt")
                system_prompt = agent_workflow[action_name].get("system_prompt")
                variables_input = agent_workflow[action_name].get(
                    "input"
                )  # What we expect to provide to this prompt
                variable_output = agent_workflow[action_name].get(
                    "output"
                )  # What we expect to get from this prompt

                # Extract fields from the prompt
                prompt_fields_to_fill = get_fields_in_formatted_string(prompt)

                # Fill the missing information in the prompt
                for field in prompt_fields_to_fill:
                    # Static fields (i.e., what is not dynamic)
                    if "->" in field:
                        v = get_json_nested_fields(
                            self.environment.config_data, field.split("->")
                        )
                        prompt = prompt.replace(f"{{{field}}}", str(v))

                    # Dynamic fields
                    else:
                        prompt = prompt.replace(
                            f"{{{field}}}", self.format_fields[field]
                        )

                # Prompt the LLM
                self.format_fields[variable_output] = model.generate_sync(
                    system_prompt=system_prompt, prompt=prompt
                )
                print(f"----- {agent_name}->{action_name} -----\n")
                print("----- System Prompt -----")
                print(f"{system_prompt}\n")
                print("----- Prompt -----")
                print(f"{prompt}\n")
                print("----- Response -----")
                print(f"{self.format_fields[variable_output]}")
                print(self.format_fields[variable_output])
                print("=" * 30)
                print()

        return self.format_fields
