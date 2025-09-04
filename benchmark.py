"""Benchmark NATURAL PLAN
It consists of three datasets:
- calendar scheduling
- meeting planning
- trip planning

We take the "prompt_0shot" and give it as natural language plan to our system.
If the plan succeeds in generating the pddl plan and the final naturalistic plan, we ask an LLM to
check if it is correct by comparing it to the "golden_plan".
"""

import json
from pathlib import Path
import re
import subprocess


from src.llm_plan.agent import AgentNaturalLanguage
from src.llm_plan.config import (
    ENVIRONMENTS_JSON_PATH,
    UNIVERSAL_VALIDATOR_BIN,
    SOLVER_BINARY,
    SOLVER_ARGS,
)
from src.llm_plan.environment import Environment
from src.llm_plan.hypervisor import Hypervisor
from src.llm_plan.llm import ChatGPT
from src.llm_plan.parser import PDDLParser
from src.llm_plan.planner import Planner

format = "json"
num_experiments = 10
budget = 5
model_json = ChatGPT("gpt-4o")
model_plan = ChatGPT("gpt-4o")

with open("./data/natural_plan/calendar_scheduling.json", "r") as f:
    calendar_scheduling_data = json.load(f)

for i in range(num_experiments):
    k = f"calendar_scheduling_example_{i}"
    data = calendar_scheduling_data[k]
    environment_name = "".join([v.capitalize() for v in k.split("_")])

    planner = Planner()
    plan_path = Path(f"{environment_name}.{format}")
    full_path = ENVIRONMENTS_JSON_PATH / plan_path

    # Skip if the plan already exists
    if not full_path.exists():
        planner.generate_representation(
            model_plan, data["prompt_0shot"], environment_name, format=format
        )
    else:
        print(f"{full_path} already exists. Skipping generation.")
        print("[Warning]: The prompt `specific` will be ignored!")

    env = Environment(f"./environments/static/{environment_name}.json")
    print("Problem: ", calendar_scheduling_data)
    print("Plan:\n", env.plan)

    BASE_FOLDER = Path(f"./tmp/{env.name}")
    BASE_FOLDER.mkdir(parents=True, exist_ok=True)

    # Fist plan to collect domain and problem
    pddl_parser = PDDLParser()
    print("Generating the first plan.")
    responses = planner.plan(model_plan, env)
    final_plan = responses["pddl_orchestrator"]
    domain, problem = pddl_parser.parse(final_plan, from_file=False)

    print("Generating the refinements...")
    for _ in range(budget):
        prompt_args_hypervisor = {
            "plan": "No plan yet.",
            "specification": env.config_data,
            "pddl_domain": domain,
            "pddl_problem": problem,
            "syntax_errors": "No error file yet.",
            "pddl_logs": "No log file yet.",
            "history": [],
        }
        hypervisor = Hypervisor(prompt_args_hypervisor)
        response = hypervisor.run(model_plan)

        # Dynamically instantiate the agent class
        match = re.search(r"<class>(.*?)</class>", response, re.DOTALL)

        if match:
            agent_name = match.group(1).strip()
        else:
            print(
                f"[Warning] No agent class found in the response ({agent_name}). Using default AgentDeepThinkPDDL."
            )
            agent_name = "AgentDeepThinkPDDL"

        agent_class = hypervisor.agents[agent_name]

        required_args = {}
        for arg in agent_class.required_args.keys():
            agent_class.required_args[arg] = prompt_args_hypervisor[arg]

        new_agent = agent_class(model_plan, agent_class.required_args)
        response = new_agent.run()

        # Get domain and plan
        domain, problem = pddl_parser.parse(response, from_file=False)
        prompt_args_hypervisor["pddl_domain"] = domain
        prompt_args_hypervisor["pddl_problem"] = problem

        # Run the pddl planner
        with open(BASE_FOLDER / "problem.pddl", "w") as f:
            f.write(problem)

        with open(BASE_FOLDER / "domain.pddl", "w") as f:
            f.write(domain)

        # Launch the solver
        command = [
            SOLVER_BINARY,
            *SOLVER_ARGS,
            BASE_FOLDER / "sas_plan",
            BASE_FOLDER / "domain.pddl",
            BASE_FOLDER / "problem.pddl",
        ]

        with open(BASE_FOLDER / "logs.txt", "w") as logfile:
            subprocess.run(command, stdout=logfile, stderr=subprocess.STDOUT)

        # Validate the plan with uVAL
        command = f"{UNIVERSAL_VALIDATOR_BIN} -cv \
        {BASE_FOLDER / 'domain.pddl'} \
        {BASE_FOLDER / 'problem.pddl'} \
        {BASE_FOLDER / 'sas_plan'}"

        out = subprocess.run(command, shell=True, capture_output=True, text=True)

        # This part won't be printed at test time
        if out.stderr:
            pddl_error = out.stderr
        else:
            pddl_error = "No error found."

        with open(BASE_FOLDER / "logs.txt", "r") as f:
            pddl_logs = f.read()

        # Syntax errors and logs
        prompt_args_hypervisor["syntax_errors"] = pddl_error
        prompt_args_hypervisor["pddl_logs"] = pddl_logs

        # History
        hypervisor.history.append(agent_name)
        prompt_args_hypervisor["history"] = hypervisor.history

    # Report the natural language plan
    with open(BASE_FOLDER / "problem.pddl", "r") as f:
        problem = f.read()

    with open(BASE_FOLDER / "domain.pddl", "r") as f:
        domain = f.read()

    with open(BASE_FOLDER / "sas_plan", "r") as f:
        plan = f.read()

    prompt_args = {
        "specification": env.config_data,
        "pddl_domain": domain,
        "pddl_problem": problem,
        "pddl_plan": plan,
    }

    hypervisor_to_nl = AgentNaturalLanguage(llm=model_plan, prompt_args=prompt_args)

    natural_plan = hypervisor_to_nl.run()

    with open(BASE_FOLDER / "refined_nl_plan.txt", "w") as f:
        f.write(natural_plan)

    print()
