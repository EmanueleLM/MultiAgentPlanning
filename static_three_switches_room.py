"""
Experiment Runner for the Three Switches Room Problem

Runs 30 experiments:
1. Creates the Three Switches Room environment with random positions.
2. Wraps it in a ProblemStaticThreeSwitchesRoom to get prompts.
3. Queries each agent's LLM for partial PDDL domains/problems.
4. Queries the Orchestrator LLM to merge into a final PDDL.
5. Parses, saves, and solves the PDDL with Fast Downward.
"""

import subprocess
from pathlib import Path

from src.llm_plan.LLM import GPT_Ollama
from src.llm_plan.Parser import PDDLParser
from src.llm_plan.Problem import ProblemStaticThreeSwitchesRoom
from src.llm_plan.StaticEnvironment import StaticThreeSwitchesRoom

if __name__ == "__main__":
    n_experiments = 30
    grid_size = 4
    model = GPT_Ollama()
    parser = PDDLParser()

    base_path = "./results/static-three-switches-room/"
    offset_path = ["plans/", "log/", "pddl/", "tmp/"]

    # Ensure output directories exist
    for path in offset_path:
        Path(base_path + path).mkdir(parents=True, exist_ok=True)

    for experiment in range(n_experiments):
        print(f"Running experiment {experiment + 1} out of {n_experiments}")

        # Alternate visibility: full grid vs. zero (as in original vault script)
        visibility = grid_size if experiment % 2 == 0 else 0

        # Step 1: Create environment and problem wrapper
        env = StaticThreeSwitchesRoom(grid_size=grid_size, visibility=visibility)
        problem = ProblemStaticThreeSwitchesRoom(env)

        # Step 2: Prompt each agent for their partial PDDL
        agents = ["Agent R", "Agent G", "Agent B"]
        agent_prompts = {}
        agent_responses = {}

        for agent in agents:
            print(f"\tPrompting {agent} for the PDDL problem and domain.")
            agent_prompts[agent] = f"{agent} Problem:\n" + problem.prompts[agent] + "\n"
            answer = model.generate_sync(
                problem.system_prompts[agent], problem.prompts[agent]
            )
            agent_responses[agent] = f"{agent} Response:\n" + answer + "\n"

        # Step 3: Prompt orchestrator to merge into a complete plan
        orchestrator_prompt = problem.prompts["Orchestrator"].format(
            pddl_agent_R=agent_prompts["Agent R"] + agent_responses["Agent R"],
            pddl_agent_G=agent_prompts["Agent G"] + agent_responses["Agent G"],
            pddl_agent_B=agent_prompts["Agent B"] + agent_responses["Agent B"],
            goal=env.goal["Agent R"],
        )

        print("\tPrompting the Orchestrator for the PDDL problem and domain.")
        final_plan = model.generate_sync(
            problem.system_prompts["Orchestrator"], orchestrator_prompt
        )

        # Step 4: Save orchestrator output
        tmp_plan_path = f"{base_path}tmp/final_plan_in_text.txt"
        with open(tmp_plan_path, "w") as f:
            f.write(final_plan)

        # Step 5: Parse PDDL
        pddl_domain, pddl_problem = parser.parse(tmp_plan_path)

        domain_path = f"{base_path}pddl/domain_exp_{experiment}_visibility_{experiment % 2 == 0}.pddl"
        problem_path = f"{base_path}pddl/problem_exp_{experiment}_visibility_{experiment % 2 == 0}.pddl"

        with open(domain_path, "w") as domain_file:
            domain_file.write(str(pddl_domain))

        with open(problem_path, "w") as problem_file:
            problem_file.write(str(pddl_problem))

        # Step 6: Solve using Fast Downward
        print("\tGenerating the plan.")
        plan_path = f"{base_path}plans/sas_plan_exp_{experiment}_visibility_{experiment % 2 == 0}"
        log_path = (
            f"{base_path}log/log_exp_{experiment}_visibility_{experiment % 2 == 0}"
        )

        command = (
            f"./solvers/fast-downward-24.06.1/fast-downward.py --alias lama-first "
            f"--plan-file {plan_path} {domain_path} {problem_path} "
            f"> {log_path} 2>&1"
        )
        subprocess.run(command, shell=True)
        print()
