"""Benchmark an existing dataset in a given format.

We take the "prompt_0shot" and give it as natural language plan to our system.
If the plan succeeds in generating the pddl plan and the final naturalistic plan, we ask an LLM to
check if it is correct by comparing it to the "golden_plan".
"""

import argparse
import asyncio
import json
import logging
import os
import re
import sys
from pathlib import Path
from time import sleep


from src.llm_plan.agent import AgentNaturalLanguage
from src.llm_plan.config import ENVIRONMENTS_JSON_PATH, DATA_PATH, RESULTS_FOLDER
from src.llm_plan.environment import Environment
from src.llm_plan.hypervisor import Hypervisor
from src.llm_plan.llm import ChatGPT, Gemini
from src.llm_plan.parser import PDDLParser
from src.llm_plan.planner import Planner
from src.llm_plan.utils import (
    run_pddl_popf2_and_Val,
    run_pddl_fast_downwards_and_uVal,
    collect_debug_logs,
)

DATASET = {
    "calendar_scheduling": {
        "data": DATA_PATH / "natural_plan/calendar_scheduling.json",
        "results": RESULTS_FOLDER / "google",
    },
    "meeting_planning": {
        "data": DATA_PATH / "natural_plan/meeting_planning.json",
        "results": RESULTS_FOLDER / "google",
    },
    "trip_planning": {
        "data": DATA_PATH / "natural_plan/trip_planning.json",
        "results": RESULTS_FOLDER / "google",
    },
    "blocksworld": {
        "data": DATA_PATH / "blocksworld/blocks_world_dataset.json",
        "results": RESULTS_FOLDER / "blocksworld",
    },
    "calendar_easy_to_hard": {
        "data": DATA_PATH / "miscellanea/calendar_easy_to_hard.json",
        "results": RESULTS_FOLDER / "calendar_easy_to_hard",
    },
    "calendar_easy_to_hard_shifted": {
        "data": DATA_PATH / "miscellanea/calendar_easy_to_hard_shifted.json",
        "results": RESULTS_FOLDER / "calendar_easy_to_hard_shifted",
    },
}

SOLVER = {
    "POPF2": {
        "solver": run_pddl_popf2_and_Val,
        "support_optimization": False,
        "timeout": 0,
    },
    "FastDownwards": {
        "solver": run_pddl_fast_downwards_and_uVal,
        "support_optimization": True,
        "timeout": 120,
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
    # "gpt-oss-120b": {"model": GPT_OSS("gpt-oss-120b"),
    #             "persistent": True,
    #             "sleep": 0},  # this model won't be loaded until generate_sync is called
}


def parse_args():
    parser = argparse.ArgumentParser(
        description="Run experiments with PDDL and planning agents."
    )

    parser.add_argument(
        "--dataset",
        type=str,
        default="calendar_scheduling",
        choices=DATASET.keys(),
        help="The dataset to choose from. Default: calendar_scheduling.",
    )
    parser.add_argument(
        "--num_experiments",
        type=int,
        default=10,
        help="Number of experiments (default: 10)",
    )
    parser.add_argument(
        "--budget", type=int, default=20, help="Budget value (default: 20)"
    )
    parser.add_argument(
        "--model_json",
        type=str,
        default="gpt-5-mini",
        choices=MODELS.keys(),
        help="Model for generating PDDL from JSON (default: gpt-5-mini)",
    )
    parser.add_argument(
        "--model_plan",
        type=str,
        default="gpt-4o",
        choices=MODELS.keys(),
        help="Model for planning and refinements (default: gpt-4o).",
    )
    parser.add_argument(
        "--base_agent",
        type=str,
        default="AgentDeepThinkPDDL",
        help="Base agent (default: AgentDeepThinkPDDL)",
    )
    parser.add_argument(
        "--target_solver",
        type=str,
        default="FastDownwards",
        choices=SOLVER.keys(),
        help="The PDDL solver used to generate a plan.",
    )
    parser.add_argument(
        "--optimize_plan",
        type=bool,
        default=False,
        choices=[True, False],
        help="The PDDL solver tries to further minimize the plan cost.",
    )
    parser.add_argument(
        "--debug",
        type=bool,
        default=True,
        help="Outputs the full logs in a file named __full_logs.txt (default: True)",
    )

    return parser.parse_args()


def setup_logging(results_root: Path, dataset: str, solver_name: str) -> logging.Logger:
    log_dir = results_root / dataset / solver_name
    log_dir.mkdir(parents=True, exist_ok=True)
    log_path = log_dir / "benchmark.log"

    logger = logging.getLogger("benchmark")
    logger.setLevel(logging.INFO)
    logger.propagate = False

    if logger.handlers:
        return logger

    formatter = logging.Formatter(
        "%(asctime)s [%(levelname)s] %(message)s", "%Y-%m-%d %H:%M:%S"
    )

    stream_handler = logging.StreamHandler(sys.stdout)
    stream_handler.setFormatter(formatter)

    file_handler = logging.FileHandler(log_path, mode="w", encoding="utf-8")
    file_handler.setFormatter(formatter)

    logger.addHandler(stream_handler)
    logger.addHandler(file_handler)

    logger.info("Logging initialized. Writing detailed output to %s", log_path)
    return logger


def append_debug_log(field: str, content: str) -> None:
    entry = collect_debug_logs(field, content)
    full_debug_logs.append(entry)
    if debug:
        try:
            with open(FULL_LOGS_PATH, "a", encoding="utf-8") as log_file:
                log_file.write(entry)
        except Exception as exc:
            logger.warning(
                "Failed to append debug log '%s' to %s: %s",
                field,
                FULL_LOGS_PATH,
                exc,
            )


if __name__ == "__main__":
    args = parse_args()

    # Argparse arguments
    dataset_name = args.dataset
    num_experiments = args.num_experiments
    budget = args.budget
    base_agent = args.base_agent
    solver = SOLVER[args.target_solver]["solver"]
    support_optimization = SOLVER[args.target_solver]["support_optimization"]
    optimize_plan = args.optimize_plan
    debug = args.debug

    logger = setup_logging(
        DATASET[dataset_name]["results"], dataset_name, args.target_solver
    )

    # Init LLMs
    if args.model_json == args.model_plan:
        model_json = MODELS[args.model_json]["model"]
        model_plan = model_json
    else:
        model_json = MODELS[args.model_json]["model"]
        model_plan = MODELS[args.model_plan]["model"]

    # Sleep time not to make the experiments with the APIs crash
    sleep_time_json = (
        0 if args.model_json != args.model_plan else MODELS[args.model_json]["sleep"]
    )
    sleep_time_first_plan = 3 * int(MODELS[args.model_json]["sleep"])
    sleep_time_plan = MODELS[args.model_plan]["sleep"]

    # Other initializations
    format = "json"
    pddl_parser = PDDLParser()
    full_debug_logs: list[str] = []

    # Read the dataset
    with open(DATASET[args.dataset]["data"], "r") as f:
        scheduling_data = json.load(f)

    # Take the problem name (e.g., calendar_scheduling_0 -> calendar_scheduling)
    key = list(scheduling_data.keys())[0]
    if "_" in key:
        problem_name, _ = key.rsplit("_", 1)
    else:
        problem_name = key

    # Start the experiments
    for i in range(num_experiments):
        # Problem name and full path
        numbered_problem_name = f"{problem_name}_{i}"
        data = scheduling_data[numbered_problem_name]
        environment_name = "".join([v.capitalize() for v in numbered_problem_name.split("_")])

        # Generate the first representation
        planner = Planner()
        plan_path = Path(f"{environment_name}.{format}")
        full_path = ENVIRONMENTS_JSON_PATH / problem_name / plan_path

        if not full_path.exists():
            logger.info("Generating representation for %s", environment_name)
            planner.generate_representation(
                model_json,
                data["prompt_0shot"],
                environment_name,
                problem_name,
                file_format=format,
            )
            sleep(sleep_time_json)
        else:
            logger.info(
                "%s already exists. Skipping generation (prompt specific ignored).",
                full_path,
            )

        env = Environment(full_path)
        logger.info(
            "=== Experiment %s/%s: problem=%s env=%s ===",
            i + 1,
            num_experiments,
            numbered_problem_name,
            environment_name,
        )
        logger.info("Problem prompt: %s", data["prompt_0shot"])
        logger.info("Initial plan structure: %s", env.plan)

        BASE_FOLDER = (
            DATASET[args.dataset]["results"]
            / f"{dataset_name}/{args.target_solver}/{env.name}"
        )
        BASE_FOLDER.mkdir(parents=True, exist_ok=True)
        FULL_LOGS_PATH = BASE_FOLDER / "__full_logs.txt"
        
        # If the natural plan already exists, skip
        if (BASE_FOLDER / "final_natural_plan.txt").exists():
            logger.info(
                "Natural plan already exists for %s. Skipping experiment.",
                environment_name,
            )
            print(f"Skipping {environment_name} as final_natural_plan.txt exists.")
            continue

        if debug:
            with open(FULL_LOGS_PATH, "w", encoding="utf-8") as log_seed:
                log_seed.write("")

        append_debug_log("PROBLEM", data["prompt_0shot"])
        append_debug_log("ENVIRONMENT", data["prompt_0shot"])

        # Generate the fist domain and problem (unless they already exist)
        if (BASE_FOLDER / "problem_0.pddl").exists() and (
            BASE_FOLDER / "domain_0.pddl"
        ).exists():
            logger.info("Existing domain/problem detected for %s. Reusing.", env.name)
            with open(BASE_FOLDER / "domain_0.pddl", "r") as f:
                domain = f.read()
            with open(BASE_FOLDER / "problem_0.pddl", "r") as f:
                problem = f.read()

        else:
            logger.info("Generating initial plan via planner agent.")
            try:
                responses = asyncio.run(planner.plan(model_plan, env))
            except Exception as exc:
                logger.error("Planning failed for %s: %s", env.name, exc)
                append_debug_log("PLANNING-ERROR", str(exc))
                continue
            
            # Generate the plan
            try:
                final_plan = responses["pddl_orchestrator"]
                domain, problem = pddl_parser.parse(final_plan, from_file=False)
            except Exception as exc:
                logger.error("Failed to parse final plan for %s: %s", env.name, exc)
                append_debug_log("FINAL-PLAN-ERROR", str(exc))
                domain = "No domain was generated. The error was: " + str(exc)
                problem = "No problem was generated. The error was: " + str(exc)
                final_plan = "No plan was generated. The error was: " + str(exc)

            # Explicitly cast to string (this prevents future errors)
            domain = str(domain)
            problem = str(problem)
            final_plan = str(final_plan)

            # Collect the full logs (default -> __full_logs.txt)
            append_debug_log("FINAL-PLAN", final_plan)

            # Save domain and problem
            with open(BASE_FOLDER / "domain_0.pddl", "w") as f:
                f.write(domain)
            with open(BASE_FOLDER / "problem_0.pddl", "w") as f:
                f.write(problem)

            logger.info("Initial domain/problem saved under %s", BASE_FOLDER)

            sleep(sleep_time_first_plan)

        # Collect the full logs (default -> __full_logs.txt)
        append_debug_log("DOMAIN", domain)
        append_debug_log("PROBLEM", problem)

        # Generate the first POPF2 and VAL plan and logs
        optimization_log = (
            "no optimization"
            if not optimize_plan
            else f"optimization={SOLVER[args.target_solver]['timeout']} [s]"
        )
        logger.info("Running %s with %s", args.target_solver, optimization_log)
        result = solver(
            BASE_FOLDER,
            BASE_FOLDER / "domain_0.pddl",
            BASE_FOLDER / "problem_0.pddl",
            BASE_FOLDER / "sas_plan_0",
            (
                SOLVER[args.target_solver]["timeout"]
                if optimize_plan and support_optimization
                else 0
            ),
        )

        # Start the refinement loop
        logger.info("Starting refinement loop with budget=%s", budget)

        # Hypervisor args
        prompt_args_hypervisor = {
            "human_specification": data["prompt_0shot"],
            "plan": "No plan yet.",
            "specification": env.config_data,
            "pddl_domain": domain,
            "pddl_problem": problem,
            "target_solver": args.target_solver,
            "pddl_plan": result["pddl_plan"],
            "syntax_errors": result["syntax_errors"],
            "pddl_logs": result["pddl_logs"],
            "history": [],
        }

        append_debug_log(
            "ITERATION 0", json.dumps(prompt_args_hypervisor, indent=4)
        )

        for j in range(1, budget + 1):
            hypervisor = Hypervisor(prompt_args_hypervisor)
            response = hypervisor.run(model_plan)

            # Dynamically instantiate the agent class
            try:
                match = re.search(r"<class>(.*?)</class>", response, re.DOTALL)
                agent_name = match.group(1).strip()
                agent_class = hypervisor.agents[agent_name]
            except Exception as exc:
                logger.warning(
                    "Failed to extract agent class from response: %s. Falling back to %s. Response snippet: %s",
                    exc,
                    base_agent,
                    response[:200],
                )
                agent_class = hypervisor.agents[base_agent]
                agent_name = base_agent

            logger.info("Selected agent: %s", agent_name)

            # Generate the refined plan
            required_args: dict[object] = {}
            for arg in agent_class.required_args.keys():
                agent_class.required_args[arg] = prompt_args_hypervisor[arg]

            new_agent = agent_class(model_plan, agent_class.required_args)
            response = new_agent.run()

            # The Hypervisor decides the plan is good
            if agent_name == "NoOpAgent":
                logger.info(
                    "NoOpAgent selected; stopping refinements at iteration %s.", j
                )
                break

            # Get domain and plan and update the hypervisor args
            domain, problem = pddl_parser.parse(response, from_file=False)
            prompt_args_hypervisor["pddl_domain"] = domain
            prompt_args_hypervisor["pddl_problem"] = problem

            # Run the pddl planner
            with open(BASE_FOLDER / f"problem_{j}.pddl", "w") as f:
                f.write(str(problem))

            with open(BASE_FOLDER / f"domain_{j}.pddl", "w") as f:
                f.write(str(domain))

            logger.debug(
                "Iteration %s: saved domain/problem to %s", j, BASE_FOLDER
            )

            optimization_log = (
                "no optimization"
                if not optimize_plan
                else f"optimization={SOLVER[args.target_solver]['timeout']} [s]"
            )
            logger.info(
                "Iteration %s: running %s with %s",
                j,
                args.target_solver,
                optimization_log,
            )
            result = solver(
                BASE_FOLDER,
                BASE_FOLDER / f"domain_{j}.pddl",
                BASE_FOLDER / f"problem_{j}.pddl",
                BASE_FOLDER / f"sas_plan_{j}",
                (
                    SOLVER[args.target_solver]["timeout"]
                    if optimize_plan and support_optimization
                    else 0
                ),
            )

            # Update the hypervisor args
            for k, v in result.items():
                prompt_args_hypervisor[k] = v

            # Update the history
            prompt_args_hypervisor["history"].append(agent_name)

            append_debug_log(
                f"ITERATION {j}", json.dumps(prompt_args_hypervisor, indent=4)
            )

            sleep(sleep_time_plan)

        # Produce the natural language plan
        plan_files = [f for f in os.listdir(BASE_FOLDER) if f.startswith("sas_plan_")]
        if plan_files:
            # Get the latest plan
            numbers = []
            for f in plan_files:
                match = re.search(r"_(\d+)$", f)  # match number at the end
                if match:
                    numbers.append((f, int(match.group(1))))

                highest_file, highest_number = max(numbers, key=lambda x: x[1])

            with open(BASE_FOLDER / f"domain_{highest_number}.pddl", "r") as f:
                domain = f.read()

            with open(BASE_FOLDER / f"problem_{highest_number}.pddl", "r") as f:
                problem = f.read()

            with open(BASE_FOLDER / highest_file, "r") as f:
                plan = f.read()

            prompt_args = {
                "specification": env.config_data,
                "pddl_domain": domain,
                "pddl_problem": problem,
                "pddl_plan": plan,
            }

            hypervisor_to_nl = AgentNaturalLanguage(
                llm=model_plan, prompt_args=prompt_args
            )

            natural_plan = hypervisor_to_nl.run()

            with open(BASE_FOLDER / "final_natural_plan.txt", "w") as f:
                f.write(natural_plan)
            logger.info(
                "Natural language plan saved to %s",
                BASE_FOLDER / "final_natural_plan.txt",
            )

            append_debug_log(f"NATURAL-PLAN {highest_file}", natural_plan)

        else:
            logger.warning("No plan files produced for %s", env.name)

        if debug:
            with open(FULL_LOGS_PATH, "w") as f:
                f.write("\n".join(full_debug_logs))
            logger.info(
                "Experiment %s complete. Logs written to %s", i + 1, FULL_LOGS_PATH
            )
        else:
            logger.info("Experiment %s complete. Debug log writing disabled.", i + 1)
