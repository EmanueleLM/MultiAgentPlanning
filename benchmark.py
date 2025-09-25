"""Benchmark an existing dataset in a given format.

We take the "prompt_0shot" and give it as natural language plan to our system.
If the plan succeeds in generating the pddl plan and the final naturalistic plan, we ask an LLM to
check if it is correct by comparing it to the "golden_plan".
"""

import argparse
import asyncio
import json
import os
import re
from time import sleep
from pathlib import Path


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
    collect_debug_logs
    )

DATASET = {
    "calendar_scheduling": {
        "data": DATA_PATH / "natural_plan/calendar_scheduling.json",
        "results": RESULTS_FOLDER / "google"
        },
    "meeting_planning": {
        "data": DATA_PATH / "natural_plan/meeting_planning.json",
        "results": RESULTS_FOLDER / "google"
        },
    "trip_planning": {
        "data": DATA_PATH / "natural_plan/trip_planning.json",
        "results": RESULTS_FOLDER / "google"
        },
    "blocksworld": {
        "data": DATA_PATH / "blocksworld/blocks_world_dataset.json",
        "results": RESULTS_FOLDER / "blocksworld"
        },
    "calendar_easy_to_hard": {
        "data": DATA_PATH / "miscellanea/calendar_easy_to_hard.json",
        "results": RESULTS_FOLDER / "calendar_easy_to_hard"
        }
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
        "timeout": 60,
        }
}

MODELS = {
    "gpt-4o": {"model": ChatGPT("gpt-4o"),
                "persistent": False,
                "sleep": 0},
    "gpt-5-mini": {"model": ChatGPT("gpt-5-mini"),
                "persistent": False, 
                "sleep": 0},
    "gpt-5-nano": {"model": ChatGPT("gpt-5-nano"),
                "persistent": False, 
                "sleep": 0},
    "gemini-2.5-flash": {"model": Gemini("gemini-2.5-flash"),
                "persistent": False,
                "sleep": 10},
    "gemini-2.5-pro": {"model": Gemini("gemini-2.5-pro"),
                "persistent": False,
                "sleep": 20},
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
        default=True,
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


if __name__ == "__main__":
    args = parse_args()

    # Argpasrse arguments
    dataset_name = args.dataset
    num_experiments = args.num_experiments
    budget = args.budget
    base_agent = args.base_agent
    solver = SOLVER[args.target_solver]["solver"]
    support_optimization = SOLVER[args.target_solver]["support_optimization"]
    optimize_plan = args.optimize_plan
    debug = args.debug
    
    # Init LLMs
    if args.model_json ==  args.model_plan:
        model_json = MODELS[args.model_json]["model"]
        model_plan = model_json
    else:
        model_json = MODELS[args.model_json]["model"]
        model_plan = MODELS[args.model_plan]["model"]
    
    # Sleep time not to make the experiments with the APIs crash
    sleep_time_json = (0 if args.model_json != args.model_plan else MODELS[args.model_json]["sleep"])
    sleep_time_first_plan = 3*MODELS[args.model_json]["sleep"]
    sleep_time_plan = MODELS[args.model_plan]["sleep"]

    # Other initializations
    format = "json"
    pddl_parser = PDDLParser()
    full_debug_logs = ""

    # Read the dataset
    with open(DATASET[args.dataset]["data"], "r") as f:
        scheduling_data = json.load(f)
    
    # Take the problem name (e.g., calendar_scheduling_0 -> calendar_scheduling)
    key = list(scheduling_data.keys())[0]
    match = re.match(r'^(.*)_(\d+)$', key)
    if match:
        problem_name, _ = match.groups()
    else:
        problem_name = key

    # Start the experiments
    for i in range(num_experiments):
        k = f"{problem_name}_{i}"
        data = scheduling_data[k]
        environment_name = "".join([v.capitalize() for v in k.split("_")])

        # Collect the full logs (default -> __full_logs.txt)
        full_debug_logs += collect_debug_logs("PROBLEM", data["prompt_0shot"])

        # Generate the first representation
        planner = Planner()
        plan_path = Path(f"{environment_name}.{format}")
        full_path = ENVIRONMENTS_JSON_PATH / problem_name / plan_path

        # Skip if the plan already exists
        if not full_path.exists():
            planner.generate_representation(
                model_json,
                data["prompt_0shot"],
                environment_name,
                file_format=format,
            )
            sleep(sleep_time_json)
        else:
            print(f"{full_path} already exists. Skipping generation.")
            print("[Warning]: The prompt `specific` will be ignored!")

        # Load the environment
        env = Environment(plan_path)
        print("Problem: ", data["prompt_0shot"])
        print("Plan:\n", env.plan)

        # Collect the full logs (default -> __full_logs.txt)
        full_debug_logs += collect_debug_logs("ENVIRONMENT", data["prompt_0shot"])

        BASE_FOLDER = DATASET[args.dataset]["results"] / f"{dataset_name}/{args.target_solver}/{env.name}"
        BASE_FOLDER.mkdir(parents=True, exist_ok=True)
        FULL_LOGS_PATH = BASE_FOLDER / "__full_logs.txt"

        # Generate the fist domain and problem (unless they already exist)
        if (BASE_FOLDER / f"problem_0.pddl").exists() and (BASE_FOLDER / f"domain_0.pddl").exists():
            print(f"A plan for {env.name} already exist. Loading domain and problem.")
            with open(BASE_FOLDER / f"domain_0.pddl", "r") as f:
                domain = f.read()
            with open(BASE_FOLDER / f"problem_0.pddl", "r") as f:
                problem = f.read()

        else:
            print("Generating the first plan.")
            responses = asyncio.run(planner.plan(model_plan, env))
            final_plan = responses["pddl_orchestrator"]
            domain, problem = pddl_parser.parse(final_plan, from_file=False)

            # Collect the full logs (default -> __full_logs.txt)
            full_debug_logs += collect_debug_logs("FINAL-PLAN", final_plan)
            
            # Save domain and problem
            with open(BASE_FOLDER / f"domain_0.pddl", "w") as f:
                f.write(domain)
            with open(BASE_FOLDER / f"problem_0.pddl", "w") as f:
                f.write(problem)
                
            sleep(sleep_time_first_plan)

        # Collect the full logs (default -> __full_logs.txt)
        full_debug_logs += collect_debug_logs("DOMAIN", domain)
        full_debug_logs += collect_debug_logs("PROBLEM", problem)
            
        # Generate the first POPF2 and VAL plan and logs
        optimization_log = ("no optimization" if not optimize_plan else f"optimization={SOLVER[args.target_solver]['timeout']} [s]")
        print(f"Running {args.target_solver} with {optimization_log}")
        result = solver(
            BASE_FOLDER,
            BASE_FOLDER / f"domain_0.pddl",
            BASE_FOLDER / f"problem_0.pddl",
            BASE_FOLDER / f"sas_plan_0",
            (SOLVER[args.target_solver]["timeout"] if optimize_plan and support_optimization else 0),
        )

        # Start the refinement loop
        print("Generating the refinements...")

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

        # Collect the full logs (default -> __full_logs.txt)
        full_debug_logs += collect_debug_logs("ITERATION 0", json.dumps(prompt_args_hypervisor, indent=4))

        for j in range(1, budget+1):
            hypervisor = Hypervisor(prompt_args_hypervisor)
            response = hypervisor.run(model_plan)

            # Dynamically instantiate the agent class
            match = re.search(r"<class>(.*?)</class>", response, re.DOTALL)

            if match:
                agent_name = match.group(1).strip()
            else:
                print(
                    f"[Warning] No agent class found in the response ({agent_name}). Using default {base_agent}."
                )
                agent_name = base_agent

            print(f"Selected agent: {agent_name}")
            agent_class = hypervisor.agents[agent_name]

            # Generate the refined plan
            required_args: dict[object] = {}
            for arg in agent_class.required_args.keys():
                agent_class.required_args[arg] = prompt_args_hypervisor[arg]

            new_agent = agent_class(model_plan, agent_class.required_args)
            response = new_agent.run()

            # The Hypervisor decides the plan is good
            if agent_name == "NoOpAgent":
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

            optimization_log = ("no optimization" if not optimize_plan else f"optimization={SOLVER[args.target_solver]['timeout']} [s]")
            print(f"Running {args.target_solver} with {optimization_log}")
            result = solver(
                BASE_FOLDER,
                BASE_FOLDER / f"domain_{j}.pddl",
                BASE_FOLDER / f"problem_{j}.pddl",
                BASE_FOLDER / f"sas_plan_{j}",
                (SOLVER[args.target_solver]["timeout"] if optimize_plan and support_optimization else 0),
            )

            # Update the hypervisor args
            for k, v in result.items():
                prompt_args_hypervisor[k] = v

            # Update the history
            prompt_args_hypervisor["history"].append(agent_name)

            # Collect the full logs (default -> __full_logs.txt)
            full_debug_logs += collect_debug_logs(f"ITERATION {j}", json.dumps(prompt_args_hypervisor, indent=4))
            
            sleep(sleep_time_plan)

        # Produce the natural language plan
        plan_files = [f for f in os.listdir(BASE_FOLDER) if f.startswith("sas_plan_")]
        if plan_files:
            # Get the latest plan
            numbers = []
            for f in plan_files:
                match = re.search(r'_(\d+)$', f)  # match number at the end
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

            # Collect the full logs (default -> __full_logs.txt)
            full_debug_logs += collect_debug_logs(f"NATURAL-PLAN {highest_file}", natural_plan)

        print()
        
        # Write the full logs in a file
        if debug:
            with open(FULL_LOGS_PATH, "w") as f:
                f.write(full_debug_logs)
