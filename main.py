"""
A few notes about this implementation:
- It is sub-optimal, as it does not query the LLMs asynchronously.
"""

import subprocess
from pathlib import Path

from src.llm_plan.llm import GPT_Ollama
from src.llm_plan.parser import PDDLParser
from src.llm_plan.problems.static.two_agents_vault_problem import (
    AgentsVaultProblem,
)
from src.llm_plan.environments.static.two_agents_vault import TwoAgentsVault

# TODO: Move some of this logic to a config file
_BASE_PATH = "./results/static-agents-vault/pddl"
_SOLVER = "./solvers/fast-downward-24.06.1/fast-downward.py"

if __name__ == "__main__":
    # Problem local variables
    model = GPT_Ollama()
    parser = PDDLParser()
    env = TwoAgentsVault()
    problem = AgentsVaultProblem(env)

    # Create result directories
    Path(_BASE_PATH).mkdir(parents=True, exist_ok=True)

    # Generate the PDDL plan for each agent
    for agent_name in env.agent_names:
        answer = model.generate_sync(
            problem.system_prompts[agent_name], problem.prompts[agent_name]
        )
        # Format the pddl plan received by an agent
        problem.prompts["Orchestrator"].format(
            pddl_agent_A=f"{answer}",
        )

    # Format the goal
    problem.prompts["Orchestrator"].format(goal=env.goal)

    # The orchestrator generates the final plan
    orchestrator_plan = model.generate_sync(
        problem.system_prompts["Orchestrator"], problem.prompts["Orchestrator"]
    )

    # Isolate the pddl problem and domain
    pddl_domain, pddl_problem = parser.parse(orchestrator_plan, from_file=False)

    # Store the pddl domain and problem
    with open(_BASE_PATH + "domain.pddl", "w") as f_domain:
        f_domain.write(str(pddl_domain))

    with open(_BASE_PATH + "problem.pddl", "w") as f_problem:
        f_problem.write(str(pddl_domain))

    # Invoke the solver and generate the plan
    command = f"{_SOLVER} --alias lama-first --plan-file \
{_BASE_PATH}/sas_plan \
{_BASE_PATH}/domain.pddl \
{_BASE_PATH}/problem.pddl \
> \
{_BASE_PATH}/logs.txt 2>&1"

    subprocess.run(command, shell=True)
