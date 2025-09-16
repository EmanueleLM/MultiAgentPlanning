import asyncio
import inspect
import json

from pathlib import Path
from typing import Tuple

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
        model: LLM, specific: str, env_name: str, format: str = "json", target_solver:str = "FastDownwards"
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
                                        You are an expert of {format}.
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
                                 When generating it, consider the following:
                                 - Make sure the {format} file is valid and can be parsed without errors.
                                 - Make also sure that the primary keys in the {format} file are the same as those in the <environment-{format}></environment-{format}>.
                                 - Make sure that the field "name" is "{env_name}".
                                 - Remember to always add an "orchestrator" agent that will be in charge of planning the actions of the other agents. His name is "orchestrator".
                                 
                                 Further, the {format} that you return:
                                 - Should include instructions that ask to generate PDDL domain and problem files. The PDDL files should target {target_solver} PDDL solver.
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
            env_name=env_name,
            target_solver=target_solver
        )

        # 2. Ask the llm to generate a representation of the new environment in the given format
        response = model.generate_sync(system_prompt=system_prompt, prompt=prompt)
        # print(response)

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
    
    async def plan(self, model: LLM, environment: Environment) -> dict[str, str]:
        """
        Generate a sequential plan using the LLM.

        The plan is structured as a list of sequences.
        - Each sequence contains one or more actions.
        - Actions within the same sequence are run in parallel.
        - Sequences are executed sequentially in order.

        Args:
            model (LLM): The language model interface.
            environment (Environment): Provides workflow, plan, and config data.

        Returns:
            dict[str, str]: Mapping of variable names to outputs generated by the LLM.
        """
        self.environment = environment
        assert self.environment.plan is not None, (
            "Environment must have an instantiated plan method."
        )

        for sequence in self.environment.plan:
            tasks = []
            for action in sequence:
                agent_name, action_name = action.split(".")

                agent_workflow = self.environment.workflow[agent_name]
                prompt = agent_workflow[action_name].get("prompt")
                system_prompt = agent_workflow[action_name].get("system_prompt")
                variables_input = agent_workflow[action_name].get("input")
                variable_output = agent_workflow[action_name].get("output")

                prompt_fields_to_fill = get_fields_in_formatted_string(prompt)

                for field in prompt_fields_to_fill:
                    if "->" in field:
                        v = get_json_nested_fields(
                            self.environment.config_data, field.split("->")
                        )
                        prompt = prompt.replace(f"{{{field}}}", str(v))
                    else:
                        prompt = prompt.replace(f"{{{field}}}", self.format_fields[field])

                tasks.append(self.run_action(model, system_prompt, prompt, variable_output))

            # Wait for all parallelizable actions in this sequence
            results = await asyncio.gather(*tasks)

            # Update format_fields after all actions finish
            for variable_output, result in results:
                self.format_fields[variable_output] = result

        return self.format_fields

    @staticmethod
    async def run_action(
        model, system_prompt: str, prompt: str, variable_output: str
    ) -> Tuple[str, str]:
        """
        Run a single action with the LLM model asynchronously.

        Args:
            model: The LLM instance.
            system_prompt (str): The system prompt/context for the model.
            prompt (str): The user/content prompt.
            variable_output (str): The key that will be used to store the result.

        Returns:
            Tuple[str, str]: A (variable_output, result) pair.
        """
        if hasattr(model, "generate_async"):
            result = await model.generate_async(system_prompt=system_prompt, prompt=prompt)
        else:
            # Fallback: run sync version in a thread
            result = await asyncio.to_thread(
                model.generate_sync, system_prompt=system_prompt, prompt=prompt
            )
        return variable_output, result