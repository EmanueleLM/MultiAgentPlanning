"""Run the agentic planning workflow from a raw human specification."""

import argparse
import asyncio
import json
import logging
import re
from pathlib import Path
from time import sleep

from src.llm_plan.agent import AgentNaturalLanguage
from src.llm_plan.config import ENVIRONMENTS_JSON_PATH, RESULTS_FOLDER
from src.llm_plan.environment import Environment
from src.llm_plan.hypervisor import Hypervisor
from src.llm_plan.llm import ChatGPT, Gemini
from src.llm_plan.parser import PDDLParser
from src.llm_plan.planner import Planner
from src.llm_plan.utils import (
    collect_debug_logs,
    get_latest_file,
    run_pddl_fast_downwards_and_uVal,
    run_pddl_popf2_and_Val,
)

ENVIRONMENT_SUBFOLDER = "miscellanea"
RESULTS_ROOT = RESULTS_FOLDER / "miscellanea"

SOLVER = {
    "POPF2": {
        "solver": run_pddl_popf2_and_Val,
        "support_optimization": False,
        "timeout": 0,
    },
    "FastDownwards": {
        "solver": run_pddl_fast_downwards_and_uVal,
        "support_optimization": True,
        "timeout": 60,
    },
}

MODELS = {
    "gpt-4o": {"model": ChatGPT("gpt-4o"), "persistent": False, "sleep": 0},
    "gpt-5-mini": {"model": ChatGPT("gpt-5-mini"), "persistent": False, "sleep": 0},
    "gpt-5-nano": {"model": ChatGPT("gpt-5-nano"), "persistent": False, "sleep": 0},
    "gemini-2.5-flash": {
        "model": Gemini("gemini-2.5-flash"),
        "persistent": False,
        "sleep": 10,
    },
    "gemini-2.5-pro": {
        "model": Gemini("gemini-2.5-pro"),
        "persistent": False,
        "sleep": 20,
    },
}


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description="Generate an environment from a human specification and run the agentic refinement loop.",
    )
    parser.add_argument(
        "--human-specification",
        "-s",
        type=str,
        required=True,
        help="The human description of the task to model.",
    )
    parser.add_argument(
        "--environment-name",
        "-n",
        type=str,
        required=True,
        help="PascalCase identifier used when saving the environment and results.",
    )
    parser.add_argument(
        "--budget",
        type=int,
        default=5,
        help="Maximum number of refinement iterations.",
    )
    parser.add_argument(
        "--model-json",
        type=str,
        default="gpt-5-mini",
        choices=MODELS.keys(),
        help="Model used to synthesise the JSON environment (default: gpt-5-mini).",
    )
    parser.add_argument(
        "--model-plan",
        type=str,
        default="gpt-5-mini",
        choices=MODELS.keys(),
        help="Model used for planning and refinements (default: gpt-5-mini).",
    )
    parser.add_argument(
        "--target-solver",
        type=str,
        default="FastDownwards",
        choices=SOLVER.keys(),
        help="PDDL solver target when generating plans.",
    )
    parser.add_argument(
        "--optimize-plan",
        type=bool,
        default=True,
        choices=[True, False],
        help="Allow the solver to spend extra time optimising the plan.",
    )
    parser.add_argument(
        "--debug",
        type=bool,
        default=True,
        choices=[True, False],
        help="If True, write detailed iteration logs under __full_logs.txt.",
    )
    return parser.parse_args()


def setup_logging(base_folder: Path) -> logging.Logger:
    base_folder.mkdir(parents=True, exist_ok=True)
    log_path = base_folder / "miscellanea.log"

    logger = logging.getLogger(f"miscellanea.{base_folder}")
    logger.setLevel(logging.INFO)
    logger.propagate = False

    if logger.handlers:
        return logger

    formatter = logging.Formatter(
        "%(asctime)s [%(levelname)s] %(message)s", "%Y-%m-%d %H:%M:%S"
    )

    stream_handler = logging.StreamHandler()
    stream_handler.setFormatter(formatter)

    file_handler = logging.FileHandler(log_path, mode="w", encoding="utf-8")
    file_handler.setFormatter(formatter)

    logger.addHandler(stream_handler)
    logger.addHandler(file_handler)

    logger.info("Logging initialised. Detailed output saved to %s", log_path)
    return logger


def main() -> None:
    args = parse_args()

    human_spec = args.human_specification
    environment_name = args.environment_name
    budget = args.budget
    solver_config = SOLVER[args.target_solver]
    optimize_plan = args.optimize_plan
    debug_enabled = args.debug

    base_folder = RESULTS_ROOT / environment_name / args.target_solver
    logger = setup_logging(base_folder)

    if args.model_json == args.model_plan:
        model_json = MODELS[args.model_json]["model"]
        model_plan = model_json
    else:
        model_json = MODELS[args.model_json]["model"]
        model_plan = MODELS[args.model_plan]["model"]

    sleep_time_json = (
        0 if args.model_json != args.model_plan else MODELS[args.model_json]["sleep"]
    )
    sleep_time_first_plan = 3 * int(MODELS[args.model_json]["sleep"])
    sleep_time_plan = MODELS[args.model_plan]["sleep"]

    planner = Planner()
    pddl_parser = PDDLParser()
    full_debug_logs: list[str] = []

    def append_debug_log(field: str, content: str) -> None:
        entry = collect_debug_logs(field, content)
        full_debug_logs.append(entry)
        if debug_enabled:
            try:
                with open(
                    base_folder / "__full_logs.txt", "a", encoding="utf-8"
                ) as log_file:
                    log_file.write(entry)
            except Exception as exc:  # pragma: no cover - log only
                logger.warning(
                    "Failed to append debug log '%s' to %s: %s",
                    field,
                    base_folder / "__full_logs.txt",
                    exc,
                )

    environment_path = (
        ENVIRONMENTS_JSON_PATH / ENVIRONMENT_SUBFOLDER / f"{environment_name}.json"
    )

    if not environment_path.exists():
        logger.info("Generating environment representation for %s", environment_name)
        planner.generate_representation(
            model_json,
            human_spec,
            environment_name,
            subfolder=ENVIRONMENT_SUBFOLDER,
            file_format="json",
            target_solver=args.target_solver,
        )
        sleep(sleep_time_json)
    else:
        logger.info(
            "Environment %s already exists. Reusing %s.",
            environment_name,
            environment_path,
        )

    env = Environment(environment_path)
    logger.info("Human specification: %s", human_spec)
    logger.info("Initial plan structure: %s", env.plan)

    base_folder.mkdir(parents=True, exist_ok=True)
    full_logs_path = base_folder / "__full_logs.txt"

    if debug_enabled:
        with open(full_logs_path, "w", encoding="utf-8") as log_seed:
            log_seed.write("")

    append_debug_log("HUMAN-SPECIFICATION", human_spec)
    append_debug_log("ENVIRONMENT-JSON", json.dumps(env.config_data, indent=4))

    domain_path = base_folder / "domain_0.pddl"
    problem_path = base_folder / "problem_0.pddl"

    if domain_path.exists() and problem_path.exists():
        logger.info(
            "Existing domain/problem detected for %s. Reusing.", environment_name
        )
        with open(domain_path, "r", encoding="utf-8") as f:
            domain = f.read()
        with open(problem_path, "r", encoding="utf-8") as f:
            problem = f.read()
    else:
        logger.info("Generating initial PDDL artefacts via planner agent.")
        try:
            responses = asyncio.run(planner.plan(model_plan, env))
        except Exception as exc:
            logger.error("Planning failed for %s: %s", environment_name, exc)
            append_debug_log("PLANNING-ERROR", str(exc))
            return

        try:
            final_plan = responses["pddl_orchestrator"]
            domain, problem = pddl_parser.parse(final_plan, from_file=False)
        except Exception as exc:
            logger.error("Failed to parse final plan for %s: %s", environment_name, exc)
            append_debug_log("FINAL-PLAN-ERROR", str(exc))
            domain = "No domain was generated. The error was: " + str(exc)
            problem = "No problem was generated. The error was: " + str(exc)
            final_plan = "No plan was generated. The error was: " + str(exc)

        domain = str(domain)
        problem = str(problem)
        final_plan = str(final_plan)

        append_debug_log("FINAL-PLAN", final_plan)

        with open(domain_path, "w", encoding="utf-8") as f:
            f.write(domain)
        with open(problem_path, "w", encoding="utf-8") as f:
            f.write(problem)
        logger.info("Initial domain/problem saved under %s", base_folder)
        sleep(sleep_time_first_plan)

    append_debug_log("DOMAIN", domain)
    append_debug_log("PROBLEM", problem)

    logger.info("Running %s (optimisation=%s)", args.target_solver, optimize_plan)
    result = solver_config["solver"](
        base_folder,
        domain_path,
        problem_path,
        base_folder / "sas_plan_0",
        (
            solver_config["timeout"]
            if optimize_plan and solver_config["support_optimization"]
            else 0
        ),
    )

    prompt_args_hypervisor = {
        "human_specification": human_spec,
        "plan": "No plan yet.",
        "specification": json.dumps(env.config_data, indent=2),
        "pddl_domain": domain,
        "pddl_problem": problem,
        "target_solver": args.target_solver,
        "pddl_plan": result["pddl_plan"],
        "syntax_errors": result["syntax_errors"],
        "pddl_logs": result["pddl_logs"],
        "history": [],
        "proposed_solution": "",
    }

    append_debug_log("ITERATION 0", json.dumps(prompt_args_hypervisor, indent=4))

    for iteration in range(1, budget + 1):
        hypervisor = Hypervisor(prompt_args_hypervisor)
        response = hypervisor.run(model_plan)

        match = re.search(r"<class>(.*?)</class>", response, re.DOTALL)
        if match:
            agent_name = match.group(1).strip()
        else:
            logger.warning(
                "No agent class found in response. Falling back to AgentDeepThinkPDDL. Response snippet: %s",
                response[:200],
            )
            agent_name = "AgentDeepThinkPDDL"

        logger.info("Iteration %s: selected agent %s", iteration, agent_name)
        agent_class = hypervisor.agents.get(agent_name)
        if agent_class is None:
            logger.error("Agent %s not available. Stopping.", agent_name)
            break

        for arg_name in agent_class.required_args.keys():
            agent_class.required_args[arg_name] = prompt_args_hypervisor[arg_name]

        agent_instance = agent_class(model_plan, agent_class.required_args)
        agent_response = agent_instance.run()
        match_solution = re.search(
            r"<proposed_solution>(.*?)</proposed_solution>",
            agent_response,
            re.DOTALL,
        )
        if match_solution:
            prompt_args_hypervisor["proposed_solution"] = (
                match_solution.group(1).strip()
            )

        if agent_name == "NoOpAgent":
            logger.info(
                "NoOpAgent selected; stopping refinements at iteration %s.", iteration
            )
            break

        try:
            domain, problem = pddl_parser.parse(agent_response, from_file=False)
        except Exception as exc:
            logger.error(
                "Failed to parse plan at iteration %s for %s: %s",
                iteration,
                environment_name,
                exc,
            )
            append_debug_log(f"ITERATION-{iteration}-ERROR", str(exc))
            continue

        prompt_args_hypervisor["pddl_domain"] = domain
        prompt_args_hypervisor["pddl_problem"] = problem

        with open(
            base_folder / f"problem_{iteration}.pddl", "w", encoding="utf-8"
        ) as f:
            f.write(str(problem))
        with open(base_folder / f"domain_{iteration}.pddl", "w", encoding="utf-8") as f:
            f.write(str(domain))

        logger.info(
            "Iteration %s: running %s (optimisation=%s)",
            iteration,
            args.target_solver,
            optimize_plan,
        )
        result = solver_config["solver"](
            base_folder,
            base_folder / f"domain_{iteration}.pddl",
            base_folder / f"problem_{iteration}.pddl",
            base_folder / f"sas_plan_{iteration}",
            (
                solver_config["timeout"]
                if optimize_plan and solver_config["support_optimization"]
                else 0
            ),
        )

        for key, value in result.items():
            prompt_args_hypervisor[key] = value

        prompt_args_hypervisor["history"].append(agent_name)
        append_debug_log(
            f"ITERATION {iteration}", json.dumps(prompt_args_hypervisor, indent=4)
        )
        sleep(sleep_time_plan)

    plan_file, plan_index = get_latest_file(base_folder, "sas_plan_")
    if plan_file is None:
        logger.warning("No plan files produced for %s", environment_name)
    else:
        with open(
            base_folder / f"domain_{plan_index}.pddl", "r", encoding="utf-8"
        ) as f:
            domain = f.read()
        with open(
            base_folder / f"problem_{plan_index}.pddl", "r", encoding="utf-8"
        ) as f:
            problem = f.read()
        with open(base_folder / plan_file, "r", encoding="utf-8") as f:
            plan = f.read()

        prompt_args_nl = {
            "specification": env.config_data,
            "pddl_domain": domain,
            "pddl_problem": problem,
            "pddl_plan": plan,
            "proposed_solution": prompt_args_hypervisor.get("proposed_solution", ""),
        }
        nl_agent = AgentNaturalLanguage(model_plan, prompt_args_nl)
        natural_plan = nl_agent.run()

        with open(base_folder / "final_natural_plan.txt", "w", encoding="utf-8") as f:
            f.write(natural_plan)
        logger.info(
            "Natural language plan saved to %s",
            base_folder / "final_natural_plan.txt",
        )
        append_debug_log(f"NATURAL-PLAN {plan_file}", natural_plan)

    if debug_enabled:
        with open(full_logs_path, "w", encoding="utf-8") as f:
            f.write("\n".join(full_debug_logs))
        logger.info("Detailed logs written to %s", full_logs_path)
    else:
        logger.info("Debug logging disabled; detailed logs were not persisted.")


if __name__ == "__main__":
    main()
