import argparse
import subprocess
from pathlib import Path

from src.llm_plan.llm import GPT_Ollama
from src.llm_plan.parser import PDDLParser
from src.llm_plan.config import RESULTS_FOLDER, SOLVER_BINARY, SOLVER_ARGS

from src.llm_plan.utils import create_problem_instance


if __name__ == "__main__":
    # Argparser for command line arguments
    parser = argparse.ArgumentParser(description="Run problems.")
    parser.add_argument(
        "--problem",
        type=str,
        default="two-agents-vault",
        help="The name of the problem to run.",
    )
    args = parser.parse_args()

    # Instantiate the model, parser, and problem
    model = GPT_Ollama()
    pddl_parser = PDDLParser()
    problem = create_problem_instance(
        args.problem
    )  # This eventually accepts **args for the environment creation
    env = problem.environment

    # Create result directory if they do not exist
    (RESULTS_FOLDER / Path(env.name)).mkdir(parents=True, exist_ok=True)

    # Generate the PDDL plan for each agent
    for agent_name in env.agent_names:
        answer = model.generate_sync(
            problem.system_prompts[agent_name], problem.prompts[agent_name]
        )
        # Format the pddl plan received by an agent
        problem.prompts[env.orchestrator_name].format(
            pddl_agent_A=f"{answer}",
        )

    # Format the goal
    problem.prompts[env.orchestrator_name].format(goal=env.goal)

    # The orchestrator generates the final plan
    orchestrator_plan = model.generate_sync(
        problem.system_prompts[env.orchestrator_name],
        problem.prompts[env.orchestrator_name],
    )

    # Isolate the pddl problem and domain
    pddl_domain, pddl_problem = pddl_parser.parse(orchestrator_plan, from_file=False)

    # Store the pddl domain and problem
    with open(RESULTS_FOLDER / "domain.pddl", "w") as f_domain:
        f_domain.write(str(pddl_domain))

    with open(RESULTS_FOLDER / "problem.pddl", "w") as f_problem:
        f_problem.write(str(pddl_domain))

    # Launch the solver
    command = [
        SOLVER_BINARY,
        *SOLVER_ARGS,
        RESULTS_FOLDER / "sas_plan",
        RESULTS_FOLDER / "domain.pddl",
        RESULTS_FOLDER / "problem.pddl",
    ]

    with open(RESULTS_FOLDER / "logs.txt", "w") as logfile:
        subprocess.run(command, stdout=logfile, stderr=subprocess.STDOUT)
