"""
Single-Agent Blocks World Experiment Runner
Note:
- This is a synchronous (non-async) implementation for simplicity.
- It runs multiple experiments with alternating easy/hard setups.
"""

import subprocess
from pathlib import Path

from src.llm_plan.LLM import GPT_Ollama
from src.llm_plan.Parser import PDDLParser
from src.llm_plan.Problem import ProblemStaticSingleAgentBlocksworld
from src.llm_plan.StaticEnvironment import StaticSingleAgentBlocksworld

if __name__ == "__main__":
    n_experiments = 30
    model = GPT_Ollama()
    parser = PDDLParser()

    # Create base results directories
    base_path, offset_paths = (
        "./results/static-single-agent-blocks-world/",
        ["plans/", "log/", "pddl/", "tmp/"],
    )
    for path in offset_paths:
        Path(base_path + path).mkdir(parents=True, exist_ok=True)

    for experiment in range(n_experiments):
        print(f"Running experiment {experiment + 1} of {n_experiments}")

        easy_mode = True if experiment % 2 == 0 else False
        env = StaticSingleAgentBlocksworld(num_blocks=5, easy=easy_mode)
        problem = ProblemStaticSingleAgentBlocksworld(env)

        # Prompt the single agent for its PDDL problem and domain
        print("\tPrompting Agent for the PDDL problem and domain.")
        agent_prompt = f"Agent Problem:\n{problem.prompts['Agent']}\n"
        agent_response = model.generate_sync(
            problem.system_prompts["Agent"], problem.prompts["Agent"]
        )

        # Save raw response
        with open(f"{base_path}tmp/agent_response_exp_{experiment}.txt", "w") as f:
            f.write(agent_response)

        # Parse PDDL domain and problem from the response
        pddl_domain, pddl_problem = parser.parse(
            f"{base_path}tmp/agent_response_exp_{experiment}.txt"
        )

        # Save domain & problem
        with open(
            f"{base_path}pddl/domain_exp_{experiment}_easy_{easy_mode}.pddl", "w"
        ) as domain_file:
            domain_file.write(str(pddl_domain))

        with open(
            f"{base_path}pddl/problem_exp_{experiment}_easy_{easy_mode}.pddl", "w"
        ) as problem_file:
            problem_file.write(str(pddl_problem))

        # Call the planner
        print("\tGenerating the plan using Fast Downward.")
        command = (
            f"./solvers/fast-downward-24.06.1/fast-downward.py --alias lama-first "
            f"--plan-file {base_path}plans/sas_plan_exp_{experiment}_easy_{easy_mode} "
            f"{base_path}pddl/domain_exp_{experiment}_easy_{easy_mode}.pddl "
            f"{base_path}pddl/problem_exp_{experiment}_easy_{easy_mode}.pddl "
            f"> {base_path}log/log_exp_{experiment}_easy_{easy_mode} 2>&1"
        )

        subprocess.run(command, shell=True)
        print()
