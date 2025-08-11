import subprocess
from pathlib import Path

from src.llm_plan.LLM import GPT_Ollama
from src.llm_plan.Problem import ProblemStaticAgentsVault
from src.llm_plan.StaticEnvironment import StaticAgentsVault

if __name__ == "__main__":
    n_experiments = 30
    grid_size = 4  # Default grid size
    model = GPT_Ollama()

    # Create tmp and results directories if they do not exist
    base_path, offset_path = (
        "./results/static-agents-vault/",
        ["plans/", "log/", "pddl/"],
    )
    for path in offset_path:
        Path(base_path + path).mkdir(parents=True, exist_ok=True)

    for experiment in range(n_experiments):
        print(f"Running experiment {experiment + 1} out of {n_experiments}")
        visibility = grid_size if experiment % 2 == 0 else 0  # Alternate visibility
        env = StaticAgentsVault(grid_size=grid_size, visibility=visibility)
        problem = ProblemStaticAgentsVault(env)

        # Generate the PDDL plans for each agent
        agents = ["Agent A", "Agent B"]
        agent_prompts = {agent: "" for agent in agents}
        agent_responses = {agent: "" for agent in agents}

        for agent in agents:
            print(f"\tPrompting {agent} for the PDDL problem and domain.")
            agent_prompts[agent] = f"{agent} Problem:\n" + problem.prompts[agent] + "\n"
            answer = model.generate_sync(
                problem.system_prompts[agent], problem.prompts[agent]
            )
            agent_responses[agent] = f"{agent} Response:\n" + answer + "\n"

        # Prompt the orchestrator for the final plan
        orchestrator_prompt = problem.prompts["Orchestrator"].format(
            pddl_agent_A=agent_prompts["Agent A"] + agent_responses["Agent A"],
            pddl_agent_B=agent_prompts["Agent B"] + agent_responses["Agent B"],
            goal=env.goal["Agent A"],
        )

        print("\tPrompting the Orchestrator for the PDDL problem and domain.")
        final_plan = model.generate_sync(
            problem.system_prompts["Orchestrator"], orchestrator_prompt
        )

        # Isolate the pddl problem and domain
        print("\tPrompting an LLM to clean the PDDL problem and domain.")
        pddl_domain = model.generate_sync(
            "You are a helpful assistant with expertise with PDDL.",
            "Extract the PDDL domain from this text:\n"
            + final_plan
            + "\n Just give me the PDDL domain, nothing else. Avoid any comments or explanations, \
and remove any line that contains the ` character (or many of them). In other words, give me something that compiles with PDDL syntax.",
        )

        pddl_problem = model.generate_sync(
            "You are a helpful assistant with expertise with PDDL.",
            "Extract the PDDL problem from this text:\n"
            + final_plan
            + "\n Just give me the PDDL problem, nothing else. Avoid any comments or explanations, \
and remove any line that contains the ` character (or many of them). In other words, give me something that compiles with PDDL syntax.",
        )

        # Save the PDDL domain and problem to files
        with open(
            f"{base_path}pddl/domain_exp_{experiment}_visibility_{experiment % 2 == 0}.pddl",
            "w",
        ) as domain_file:
            domain_file.write(pddl_domain)

        with open(
            f"{base_path}pddl/problem_exp_{experiment}_visibility_{experiment % 2 == 0}.pddl",
            "w",
        ) as problem_file:
            problem_file.write(pddl_problem)

        # Invoke fast downward and solve the problem
        print("\tGenerating the plan.")
        command = f"./solvers/fast-downward-24.06.1/fast-downward.py --alias lama-first --plan-file \
{base_path}plans/sas_plan_exp_{experiment}_visibility_{experiment % 2 == 0} \
{base_path}pddl/domain_exp_{experiment}_visibility_{experiment % 2 == 0}.pddl \
{base_path}pddl/problem_exp_{experiment}_visibility_{experiment % 2 == 0}.pddl \
> ./results/static-agents-vault/log_exp_{experiment}_visibility_{experiment % 2 == 0} 2>&1"

        subprocess.run(command, shell=True)
        print()
