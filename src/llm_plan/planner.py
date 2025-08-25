from src.llm_plan.environment import Environment
from src.llm_plan.llm import LLM
from src.llm_plan.utils import get_fields_in_formatted_string, get_json_nested_fields


class Planner:
    def __init__(self, environment: Environment, model: LLM):
        """This class uses a workflow in an environment to plan with LLMs.

        Args:
            environment (Environment): an Environment
            model (LLM): the LLM used for planning.
            TODO: Support multiple models for different agents.
        """

        self.environment = environment
        self.model = model
        self.format_fields: dict[str, str] = {}

        assert self.environment.plan is not None, (
            "Environment must have an instantiated plan method."
        )

    def plan(self):
        """
        Take a workflow and generate a sequential plan using the LLMs.
        Parallelizable actions are executed in the order they appear in the sequence.
        """
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
                self.format_fields[variable_output] = self.model.generate_sync(
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
