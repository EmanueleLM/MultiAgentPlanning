import subprocess

universal_validator_path = "./solvers/universal-planning-validator"
universal_validator_bin = "/validator/validate.bin"


def test_uval():
    command = universal_validator_path + universal_validator_bin
    print(command + "--help")
    out = subprocess.run(command, shell=True, capture_output=True, text=True)
    assert out.stderr == ""  # empty


def test_static_agents_vault_plans():
    path_local = "./results/static-agents-vault"
    path_plans = "/plans/"
    path_domains_problems = "/pddl/"

    # Enumerate all the files in the plan directory
    plans = subprocess.run(
        f"ls {path_local}{path_plans}*", shell=True, capture_output=True, text=True
    )
    plan_files = plans.stdout.strip().split("\n")
    assert len(plan_files) > 0, "No plan files found."

    for plan_name in plan_files:
        common_suffix = plan_name.split("_plan_")[1]
        domain_name = "domain_" + common_suffix
        problem_name = "problem_" + common_suffix

        command = f"{universal_validator_path}{universal_validator_bin} -cv \
    {path_local}{path_domains_problems}{domain_name}.pddl \
    {path_local}{path_domains_problems}{problem_name}.pddl \
    {plan_name}"

        out = subprocess.run(command, shell=True, capture_output=True, text=True)

        # This part won't be printed at test time
        if out.stderr:
            print(
                f"The validation found a problem with the plan: {plan_name}: {out.stderr}"
            )
        else:
            print(f"The plan {plan_name} is valid.")
            print(out.stdout)
