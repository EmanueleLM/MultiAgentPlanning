import subprocess
from pathlib import Path

from src.llm_plan.config import UNIVERSAL_VALIDATOR_BIN


def test_uval():
    out = subprocess.run(
        UNIVERSAL_VALIDATOR_BIN, shell=True, capture_output=True, text=True
    )
    assert out.stderr == ""  # empty


def test_static_agents_vault_plans():
    path_local = Path("./test/data/TwoAgentsVault")

    # Enumerate all the files in the plan directory
    plans = subprocess.run(
        f"ls {path_local}*", shell=True, capture_output=True, text=True
    )
    plan_files = plans.stdout.strip().split("\n")
    assert len(plan_files) > 0, "No plan files found."

    command = f"{UNIVERSAL_VALIDATOR_BIN} -cv \
    {path_local / 'domain.pddl'} \
    {path_local / 'problem.pddl'} \
    sas_plan"

    out = subprocess.run(command, shell=True, capture_output=True, text=True)

    # This part won't be printed at test time
    if out.stderr:
        print(f"The validation found a problem with the plan: {out.stderr}")
    else:
        print("The plan is valid.")
        print(out.stdout)
