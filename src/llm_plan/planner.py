import asyncio
import inspect
import json

from pathlib import Path
from typing import Any, Tuple

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
        """Plan actions for an environment by orchestrating LLM-powered workflows."""
        self.environment: Environment
        self.format_fields: dict[str, str] = {}

    @staticmethod
    def generate_representation(
        model: LLM,
        specific: str,
        env_name: str,
        subfolder: str = "examples",
        file_format: str = "json",
        target_solver: str = "FastDownwards",
    ) -> Path:
        """Generate a new environment description and save it to disk.

        Args:
            model (LLM): The language model that will craft the representation.
            specific (str): Human description of the planning task.
            env_name (str): Name of the task (PascalCase) to embed in the output.
            subfolder (str, optional): Subfolder inside the environments folder to save the file. Defaults to "examples".
            file_format (str, optional): Desired output format. Currently only "json" is supported.
            target_solver (str, optional): Solver that the environment should target when generating PDDL.

        Returns:
            Path: Location of the saved environment file.
        """
        file_format = file_format.lower()
        if file_format == "json":
            tag_begin, tag_end = "<json>", "</json>"
        else:
            raise NotImplementedError(f"Format {file_format} not supported.")

        # 1. Prepare prompts and samples
        system_prompt = inspect.cleandoc(
            f"""\
            You are an expert in writing {file_format.upper()} environment specifications.
            Produce a valid {file_format} file that reflects the human description of the task.
            """
        )

        with open(ENVIRONMENTS_JSON_SAMPLE_PATH, "r") as f:
            sample_environment = json.load(f)

        with open(ENVIRONMENTS_PYTHON_PATH_SAMPLE, "r") as f:
            environment_class = f.read()

        sample_environment_json = json.dumps(sample_environment, indent=4)

        prompt = inspect.cleandoc(
            f"""\
            Example {file_format.upper()} environment:
            <environment-{file_format}>
            {sample_environment_json}
            </environment-{file_format}>

            Environment class definition (structure reference):
            <code>
            {environment_class}
            </code>

            Generate a new {file_format} environment for the following human specification:
            <use-case>{specific}</use-case>

            Think carefully about the entities, their attributes, and the relationships between them. Follow these requirements:
            - Ensure the {file_format} file parses without errors.
            - Keep the primary keys consistent with those in the sample environment.
            - Set the "name" field to "{env_name}".
            - Include an "orchestrator" agent that coordinates the other agents (use the exact name "orchestrator").
            - Provide context for each agent without requesting them to emit PDDL directly.
            - Ensure the orchestrator action produces the final PDDL domain and problem targeting the {target_solver} solver.
            - Avoid inserting escape sequences such as \n inside string literals.
            - Present clean indentation and do not wrap the output in quotes.

            Return the final {file_format} file between {tag_begin}{tag_end} tags.
            """
        )

        # 2. Ask the LLM to generate the representation
        response = model.generate_sync(system_prompt=system_prompt, prompt=prompt)
        # print(response)

        # Identify the plan in the response
        format_start = response.index(tag_begin) + len(tag_begin)
        format_end = response.index(tag_end)
        formatted_environment = response[format_start:format_end].strip()

        # 4. Save the representation in the correct folder
        filename = f"{env_name}.{file_format}"
        try:
            if file_format == "json":
                formatted_environment = json.loads(formatted_environment)
            else:
                raise NotImplementedError(f"Format {file_format} not supported.")
        except json.JSONDecodeError as e:
            print(f"!: The generated environment is not a valid {file_format}.")
            print(f"[ERROR]: {e}")
            print(
                f"The file will be saved in {filename} but you have to fix the {file_format} errors manually."
            )

        if subfolder:
            (ENVIRONMENTS_JSON_PATH / subfolder).mkdir(parents=True, exist_ok=True)
            
        with open(ENVIRONMENTS_JSON_PATH / subfolder / filename, "w") as f:
            json.dump(formatted_environment, f, indent=4)

        # 5. Return its path
        return ENVIRONMENTS_JSON_PATH / subfolder / filename

    def _infer_orchestrator_name(self) -> str:
        """Determine which agent acts as the orchestrator in the workflow."""
        if getattr(self.environment, "orchestrator", None):
            return self.environment.orchestrator

        if hasattr(self.environment, "workflow"):
            for candidate in self.environment.workflow.keys():
                if candidate == "constraints":
                    continue
                if "orchestrator" in candidate.lower():
                    return candidate

        agent_names = []
        if getattr(self.environment, "agents", None):
            agent_names = self.environment.agents.get("names", []) or []
            for candidate in agent_names:
                if "orchestrator" in candidate.lower():
                    return candidate

        if agent_names:
            return agent_names[-1]

        return "orchestrator"

    def _stringify_value(self, value: Any) -> str:
        if isinstance(value, (dict, list)):
            return json.dumps(value, indent=2)
        return "" if value is None else str(value)

    def _resolve_field_value(self, field: str) -> str:
        normalized = field.strip()
        normalized = normalized.strip('"')

        if "->" in normalized:
            value = get_json_nested_fields(
                self.environment.config_data, normalized.split("->")
            )
        else:
            value = self.format_fields.get(normalized)
            if value is None and normalized != field:
                value = self.format_fields.get(field)
            if value is None:
                return ""
        return self._stringify_value(value)

    def _fill_template(self, template: str | None) -> str:
        if not template:
            return ""

        filled = template
        for field in set(get_fields_in_formatted_string(template)):
            value = self._resolve_field_value(field)
            filled = filled.replace(f"{{{field}}}", value)

        return filled

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
        self.format_fields = {}
        assert self.environment.plan is not None, (
            "Environment must have an instantiated plan method."
        )

        orchestrator_name = self._infer_orchestrator_name()

        for sequence in self.environment.plan:
            tasks = []
            for action in sequence:
                agent_name, action_name = action.split(".")

                agent_workflow = self.environment.workflow.get(agent_name, {})
                action_config = agent_workflow.get(action_name, {})

                prompt_template = action_config.get("prompt")
                system_template = action_config.get("system_prompt")
                variable_output = action_config.get("output")

                if not variable_output:
                    continue

                filled_prompt = self._fill_template(prompt_template)
                filled_system_prompt = self._fill_template(system_template)

                if agent_name != orchestrator_name:
                    tasks.append(
                        self.run_action(
                            model,
                            (filled_system_prompt or "").strip(),
                            (filled_prompt or "").strip(),
                            variable_output,
                        )
                    )
                    continue

                orchestrator_prompt = (filled_prompt or "").strip()
                note = (
                    "Note: The agent inputs above describe capabilities, goals, and constraints. "
                    "They are not valid PDDL artefacts. Derive a consistent PDDL domain "
                    "and problem that satisfy the specification and remain compatible with the target solver. "
                    "Treat natural-language preferences (avoid / would rather / earliest) as hard temporal constraints."
                    "Do not emit placeholder tokens such as '...' or 'None'; provide complete predicate and action definitions. "
                    "Keep :requirements limited to :strips, :typing, and :negative-preconditions (optionally :action-costs if you add matching increase effects) and remove every unsupported feature. "
                    "Do not use ':cost' declarations on action headers: we are not interested in the final cost of the plan."
                )
                if orchestrator_prompt:
                    orchestrator_prompt += f"\n\n{note}"
                else:
                    orchestrator_prompt = note

                orchestrator_system_prompt = (filled_system_prompt or "").strip()
                system_note = (
                    "Agent inputs are descriptive summaries rather than executable PDDL. "
                    "Do not invent availability beyond the provided data, and encode preferences as strict constraints. "
                    "Double-check that both the domain and problem contain fully expanded content (no placeholders) and that the :requirements list only contains solver-supported flags."
                )
                if orchestrator_system_prompt:
                    orchestrator_system_prompt += f"\n{system_note}"
                else:
                    orchestrator_system_prompt = system_note

                tasks.append(
                    self.run_action(
                        model,
                        orchestrator_system_prompt,
                        orchestrator_prompt,
                        variable_output,
                    )
                )

            if tasks:
                results = await asyncio.gather(*tasks)

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
            print(f"[Async] Generating action for agent {variable_output}...")
            result = await model.generate_async(system_prompt=system_prompt, prompt=prompt)
        else:
            # Fallback: run sync version in a thread
            print(f"[Sync] Generating action for agent {variable_output}...")
            result = await asyncio.to_thread(
                model.generate_sync, system_prompt=system_prompt, prompt=prompt
            )
        return variable_output, result
