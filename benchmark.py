"""Benchmark NATURAL PLAN
It consists of three datasets:
- calendar scheduling
- meeting planning
- trip planning

We take the "prompt_0shot" and give it as natural language plan to our system.
If the plan succeeds in generating the pddl plan and the final naturalistic plan, we ask an LLM to
check if it is correct by comparing it to the "golden_plan".
"""

import argparse
import json
from pathlib import Path
import re


from src.llm_plan.agent import AgentNaturalLanguage
from src.llm_plan.config import ENVIRONMENTS_JSON_PATH
from src.llm_plan.environment import Environment
from src.llm_plan.hypervisor import Hypervisor
from src.llm_plan.llm import ChatGPT
from src.llm_plan.parser import PDDLParser
from src.llm_plan.planner import Planner
from src.llm_plan.utils import run_pddl_popf2_and_Val, run_pddl_fast_downwards_and_uVal

SOLVER = {
    "POPF2": run_pddl_popf2_and_Val,
    "FastDownwards": run_pddl_fast_downwards_and_uVal
}


def parse_args():
    parser = argparse.ArgumentParser(
        description="Run experiments with PDDL and planning agents."
    )

    parser.add_argument(
        "--dataset",
        type=str,
        default="calendar_scheduling",
        choices=["calendar_scheduling", "meeting_planning", "trip_planning"],
        help="The dataset to choose from. Default: calendar_scheduling.",
    )
    parser.add_argument(
        "--num_experiments",
        type=int,
        default=10,
        help="Number of experiments (default: 10)",
    )
    parser.add_argument(
        "--budget", type=int, default=5, help="Budget value (default: 5)"
    )
    parser.add_argument(
        "--model_json",
        type=str,
        default="gpt-5-mini",
        choices=["gpt-4o", "gpt-5-mini"],
        help="Model for generating PDDL from JSON (default: gpt-5-mini)",
    )
    parser.add_argument(
        "--model_plan",
        type=str,
        default="gpt-4o",
        choices=["gpt-4o", "gpt-5-mini"],
        help="Model for planning and refinements (default: gpt-4o)",
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
        default="POPF2",
        choices=SOLVER.keys(),
        help="The PDDL solver used to generate a plan.",
    )

    return parser.parse_args()


if __name__ == "__main__":
    args = parse_args()

    # Argpasrse arguments
    dataset_name = args.dataset
    num_experiments = args.num_experiments
    budget = args.budget
    model_json = ChatGPT(args.model_json)
    model_plan = ChatGPT(args.model_plan)
    base_agent = args.base_agent
    solver = SOLVER[args.target_solver]

    format = "json"
    pddl_parser = PDDLParser()

    with open(f"./data/natural_plan/{args.dataset}.json", "r") as f:
        calendar_scheduling_data = json.load(f)

    for i in range(num_experiments):
        k = f"calendar_scheduling_example_{i}"
        data = calendar_scheduling_data[k]
        environment_name = "".join([v.capitalize() for v in k.split("_")])

        # Generate the first representation
        planner = Planner()
        plan_path = Path(f"{environment_name}.{format}")
        full_path = ENVIRONMENTS_JSON_PATH / plan_path

        # Skip if the plan already exists
        if not full_path.exists():
            planner.generate_representation(
                model_json, data["prompt_0shot"], environment_name, format=format
            )
        else:
            print(f"{full_path} already exists. Skipping generation.")
            print("[Warning]: The prompt `specific` will be ignored!")

        # Load the environment
        env = Environment(f"./environments/static/{environment_name}.json")
        print("Problem: ", data["prompt_0shot"])
        print("Plan:\n", env.plan)

        BASE_FOLDER = Path(f"./tmp/google/{dataset_name}/{env.name}")
        BASE_FOLDER.mkdir(parents=True, exist_ok=True)

        # Generate the fist domain and problem (unless they already exist)
        if (BASE_FOLDER / f"problem_0.pddl").exists() and (BASE_FOLDER / f"domain_0.pddl").exists():
            print(f"A plan for {env.name} already exist. Loading domain and problem.")
            with open(BASE_FOLDER / f"domain_0.pddl", "r") as f:
                domain = f.read()
            with open(BASE_FOLDER / f"problem_0.pddl", "r") as f:
                problem = f.read()

        else:
            print("Generating the first plan.")
            responses = planner.plan(model_first_plan, env)
            final_plan = responses["pddl_orchestrator"]
            domain, problem = pddl_parser.parse(final_plan, from_file=False)
            
            # Save domain and problem
            with open(BASE_FOLDER / f"domain_0.pddl", "w") as f:
                f.write(domain)
            with open(BASE_FOLDER / f"problem_0.pddl", "w") as f:
                f.write(problem)
            
            
        # Generate the first POPF2 and VAL plan and logs
        result = solver(
            BASE_FOLDER,
            BASE_FOLDER / f"domain_0.pddl",
            BASE_FOLDER / f"problem_0.pddl",
            BASE_FOLDER / f"sas_plan_0",
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

            result = run_pddl_popf2_and_Val(
                BASE_FOLDER / f"domain_{j}.pddl",
                BASE_FOLDER / f"problem_{j}.pddl",
                BASE_FOLDER / f"sas_plan_{j}",
            )

            # Update the hypervisor args
            for k, v in result.items():
                prompt_args_hypervisor[k] = v

            # Update the history
            prompt_args_hypervisor["history"].append(hypervisor.history)

        # Produce the natural language plan
        if Path(BASE_FOLDER / f"sas_plan_{j}").exists():
            with open(BASE_FOLDER / f"domain_{j}.pddl", "r") as f:
                domain = f.read()

            with open(BASE_FOLDER / f"problem_{j}.pddl", "r") as f:
                problem = f.read()

            with open(BASE_FOLDER / f"sas_plan_{j}", "r") as f:
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

        print()
