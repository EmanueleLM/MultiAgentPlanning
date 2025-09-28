import nest_asyncio

nest_asyncio.apply()  # <-- fixes the event-loop error in notebooks
from pathlib import Path
import io
from unified_planning.io import PDDLReader
from unified_planning.shortcuts import OneshotPlanner
from unified_planning.model.metrics import MinimizeMakespan

ACTOR_OUTPUT_PATH = "./numtemp_test/results/depots/t"
folder_name = "depots_t_2"


base_dir = (Path(__file__).parent / (ACTOR_OUTPUT_PATH + f"/{folder_name}")).resolve()

dom, prob = (
    base_dir / "domain.pddl",
    base_dir / "problem.pddl",
)  # put your paths here

problem = PDDLReader().parse_problem(dom, prob)

buf = io.StringIO()
try:
    with OneshotPlanner(name="lpg") as planner:
        result = planner.solve(problem, output_stream=buf)
        print("Status:", result.status)
        if result.plan:
            print(result.plan)
            print("----- LPG raw log -----")
            print(buf.getvalue())
except Exception as e:
    print("Error occurred:", e)
    print("----- LPG raw log -----")
    print(buf.getvalue())
