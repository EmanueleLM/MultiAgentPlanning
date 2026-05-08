import asyncio
import inspect
import json

from pathlib import Path
from typing import Any, Tuple

from src.llm_plan.config import (
    ENVIRONMENTS_JSON_PATH,
)
from src.llm_plan.environment import Environment
from src.llm_plan.llm import LLM
from src.llm_plan.task_profile import infer_task_profile
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
        if file_format != "json":
            raise NotImplementedError(f"Format {file_format} not supported.")

        task_profile = infer_task_profile(
            human_specification=specific,
            dataset_hint=str(subfolder),
            target_solver=target_solver,
        )
        formatted_environment = Planner._build_jack_of_all_trades_environment(
            env_name=env_name,
            human_specification=specific,
            task_profile=task_profile,
            target_solver=target_solver,
        )

        filename = f"{env_name}.{file_format}"
        if subfolder:
            (ENVIRONMENTS_JSON_PATH / subfolder).mkdir(parents=True, exist_ok=True)
            
        with open(ENVIRONMENTS_JSON_PATH / subfolder / filename, "w") as f:
            json.dump(formatted_environment, f, indent=4)

        # 5. Return its path
        return ENVIRONMENTS_JSON_PATH / subfolder / filename

    @staticmethod
    def _build_jack_of_all_trades_environment(
        env_name: str,
        human_specification: str,
        task_profile: dict[str, Any],
        target_solver: str,
    ) -> dict[str, Any]:
        domain_reference = task_profile.get("domain_reference", "")
        reference_note = (
            "A reference domain is provided. Use it as a semantic anchor, but still return a full domain and problem tailored to this instance."
            if domain_reference
            else "No reference domain is provided; infer the domain directly from the task."
        )

        public_information = [
            human_specification,
            f"Target solver: {target_solver}.",
            "Return a complete PDDL domain and problem for this specific problem instance.",
        ]

        return {
            "name": env_name,
            "author": "Codex",
            "orchestrator": "orchestrator",
            "agents": {
                "number": 2,
                "names": ["jack_of_all_trades", "orchestrator"],
                "jack_of_all_trades": {
                    "private_information": [
                        "I am the task-adaptive semantic modeling agent.",
                        "I infer the benchmark subdomain, canonical symbols, invariants, and the right classical-planning abstraction for this problem instance.",
                        "I do not emit final PDDL; I emit a structured modeling brief for the compiler.",
                    ],
                    "goal": "Produce a high-precision modeling brief that captures the exact task semantics for this instance.",
                },
                "orchestrator": {
                    "private_information": [
                        "I compile the structured modeling brief into a full PDDL domain and problem.",
                        "I keep the artifacts compatible with the target solver.",
                    ],
                    "goal": "Return the final PDDL domain and problem for this instance.",
                },
            },
            "environment": {
                "init": {
                    "target_solver": target_solver,
                    "task_profile": task_profile,
                    "task_profile_prompt": task_profile["task_profile_prompt"],
                    "domain_reference": domain_reference,
                    "reference_note": reference_note,
                },
                "public_information": public_information,
            },
            "workflow": {
                "jack_of_all_trades": {
                    "model": {
                        "input": [],
                        "output": "jack_modeling_brief",
                        "system_prompt": (
                            "You are JackOfAllTrades, the semantic self-programming agent for classical planning. "
                            "Your job is to infer the latent planning abstraction for this specific problem instance and design the semantic model that a downstream compiler will turn into PDDL. "
                            "You own the modeling choices: ontology, predicates, invariants, and action schemas. "
                            "Do not output final PDDL. Preserve hard constraints exactly, and do not invent unsupported routes, resources, or repairs."
                        ),
                        "prompt": (
                            "Problem specification:\n"
                            "{environment->public_information}\n\n"
                            "Task profile:\n"
                            "{environment->init->task_profile_prompt}\n\n"
                            "Reference note:\n"
                            "{environment->init->reference_note}\n\n"
                            "Reference domain, if provided:\n"
                            "{environment->init->domain_reference}\n\n"
                            "Infer the correct planning model for this instance and produce a structured modeling brief using exactly these sections:\n"
                            "<abstraction>...</abstraction>\n"
                            "<objects>...</objects>\n"
                            "<types>...</types>\n"
                            "<predicates>...</predicates>\n"
                            "<invariants>...</invariants>\n"
                            "<actions>...</actions>\n"
                            "<init_goal_mapping>...</init_goal_mapping>\n"
                            "<failure_risks>...</failure_risks>\n\n"
                            "Rules:\n"
                            "- Infer the latent planning abstraction from the problem itself, not from generic templates.\n"
                            "- Decide the minimal correct ontology: objects, types, predicates, invariants, and action schemas.\n"
                            "- State invariants explicitly whenever they are needed to make the model correct.\n"
                            "- Preserve hard constraints exactly unless the task explicitly requests repair.\n"
                            "- If the task appears inconsistent or underspecified, explain that in <failure_risks> instead of silently changing the semantics.\n"
                            "- Use canonical lowercase underscore names for symbols.\n"
                            "- Do not emit final PDDL."
                        ),
                    }
                },
                "orchestrator": {
                    "pddl": {
                        "input": ["jack_modeling_brief"],
                        "output": "pddl_orchestrator",
                        "system_prompt": (
                            "You are the solver-facing PDDL compiler. "
                            "Convert the JackOfAllTrades semantic model into a complete PDDL domain and problem for the target solver. "
                            "JackOfAllTrades owns the semantic design; you should compile it faithfully rather than reinterpreting the task from scratch. "
                            "Return only the final domain between <domain></domain> and the final problem between <problem></problem>."
                        ),
                        "prompt": (
                            "Problem specification:\n"
                            "{environment->public_information}\n\n"
                            "Task profile:\n"
                            "{environment->init->task_profile_prompt}\n\n"
                            "Reference domain, if provided:\n"
                            "{environment->init->domain_reference}\n\n"
                            "JackOfAllTrades modeling brief:\n"
                            "{jack_modeling_brief}\n\n"
                            "Compile the final PDDL domain and problem.\n"
                            "Requirements:\n"
                            "- Target solver compatibility is mandatory.\n"
                            "- Keep the domain and problem specific to this problem instance.\n"
                            "- Preserve all hard constraints from the problem specification and from JackOfAllTrades' semantic model.\n"
                            "- Use canonical lowercase underscore identifiers consistently.\n"
                            "- Do not use unsupported numeric, durative, or conditional constructs.\n"
                            "- Respect the <invariants> and <init_goal_mapping> sections explicitly.\n"
                            "- If a reference domain is provided, use it only as an anchor; do not let it override the instance-specific semantics devised by JackOfAllTrades.\n"
                            "Return only <domain>...</domain> and <problem>...</problem>."
                        ),
                    }
                },
                "constraints": [
                    "jack_of_all_trades.model->orchestrator.pddl",
                ],
            },
        }

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
                note = inspect.cleandoc(
                    """\
                    Note: The agent inputs above describe capabilities, goals, and constraints. They are not executable PDDL.
                    Derive a consistent PDDL domain and problem that satisfy the specification and remain compatible with the target solver.
                    Treat natural-language preferences (avoid / would rather / earliest / exactly / at most) as hard constraints over the timeline.
                    Prohibit bookkeeping shortcuts such as post-hoc “pay shortfall”, quota tokens, or generic penalty actions—encode the constraints directly so that violating plans become impossible.
                    When the specification enumerates discrete phases or time slots, model them explicitly (e.g., day objects with successor links) and enforce contiguity rather than allowing ping-pong transitions.
                    Do not emit placeholder tokens such as '...' or 'None'; provide complete predicate and action definitions.
                    Keep :requirements limited to :strips, :typing, and :negative-preconditions (optionally :action-costs if you add matching increase effects) and remove every unsupported feature.
                    Do not use ':cost' declarations on action headers: use (increase ...) effects instead, and only when the task genuinely requires action costs.
                    Ensure the problem goal fixes every mandated terminal condition (e.g., final locations, completed tasks) instead of relying on auxiliary bookkeeping predicates alone.
                    """
                )
                if orchestrator_prompt:
                    orchestrator_prompt += f"\n\n{note}"
                else:
                    orchestrator_prompt = note

                orchestrator_system_prompt = (filled_system_prompt or "").strip()
                system_note = inspect.cleandoc(
                    """\
                    Agent inputs are descriptive summaries rather than executable PDDL artefacts.
                    Do not invent resources, availability, or connectivity beyond the provided data, and encode every preference as a strict constraint.
                    Eliminate penalty-accounting constructs (tokens, shortfalls, quota closures) that would allow violations after the fact.
                    Make sure both the domain and problem contain fully expanded content (no placeholders) and that the :requirements list only contains solver-supported flags.
                    Whenever the specification implies an ordered sequence, enforce it with explicit predicates or goal facts so the solver cannot reorder steps arbitrarily.
                    """
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
