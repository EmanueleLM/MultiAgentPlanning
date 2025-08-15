"""
Package Delivery Experiment Runner
Note:
- This is a synchronous (non-async) implementation for simplicity.
- It runs multiple experiments for the package delivery problem.
"""

import subprocess
from pathlib import Path

# Import the necessary classes for the Package Delivery problem
from src.llm_plan.LLM import GPT_Ollama
from src.llm_plan.Parser import PDDLParser
from src.llm_plan.Problem import ProblemPackageDelivery
from src.llm_plan.Environment import StaticPackageDelivery

if __name__ == "__main__":
    # --- Configuration ---
    n_experiments = 10  # Number of experiments to run
    model = GPT_Ollama()
    parser = PDDLParser()

    # --- Setup Directories ---
    # Create base results directories for this specific experiment
    base_path = "./results/static-package-delivery/"
    offset_paths = ["plans/", "log/", "pddl/", "tmp/"]

    for path in offset_paths:
        Path(base_path + path).mkdir(parents=True, exist_ok=True)

    print(f"Results will be saved in: {Path(base_path).resolve()}")

    # --- Run Experiments ---
    for experiment in range(n_experiments):
        print(f"--- Running Experiment {experiment + 1} of {n_experiments} ---")

        # 1. Initialize the Environment and Problem
        # Each iteration creates a fresh instance of the problem.
        env = StaticPackageDelivery()
        problem = ProblemPackageDelivery(env)

        # 2. Prompt the Agent for PDDL Domain and Problem
        print("\tPrompting Agent for the PDDL problem and domain...")
        agent_response = model.generate_sync(
            problem.system_prompts["Agent"], problem.prompts["Agent"]
        )

        # 3. Save and Parse the Raw Response
        response_file_path = f"{base_path}tmp/agent_response_exp_{experiment}.txt"
        with open(response_file_path, "w") as f:
            f.write(str(agent_response))

        print(f"\tParsing PDDL from response...")
        pddl_domain, pddl_problem = parser.parse(response_file_path)

        # 4. Save the Parsed PDDL Files
        domain_file_path = f"{base_path}pddl/domain_exp_{experiment}.pddl"
        problem_file_path = f"{base_path}pddl/problem_exp_{experiment}.pddl"

        with open(domain_file_path, "w") as domain_file:
            domain_file.write(str(pddl_domain))

        with open(problem_file_path, "w") as problem_file:
            problem_file.write(str(pddl_problem))

        print(f"\tSaved PDDL to {domain_file_path} and {problem_file_path}")

        # 5. Call the Planner to Generate a Solution
        print("\tGenerating the plan using Fast Downward...")
        plan_file_path = f"{base_path}plans/sas_plan_exp_{experiment}"
        log_file_path = f"{base_path}log/log_exp_{experiment}"

        command = (
            f"./solvers/fast-downward-24.06.1/fast-downward.py --alias lama-first "
            f"--plan-file {plan_file_path} "
            f"{domain_file_path} {problem_file_path} "
            f"> {log_file_path} 2>&1"
        )

        try:
            subprocess.run(command, shell=True, check=True)
            print(f"\tPlan generated successfully: {plan_file_path}")
        except subprocess.CalledProcessError as e:
            print(
                f"\tError during planning: {e}. Check log for details: {log_file_path}"
            )

        print(
            "-"
            * (len(f"--- Running Experiment {experiment + 1} of {n_experiments} ---"))
        )
        print()

    print("All experiments completed.")
