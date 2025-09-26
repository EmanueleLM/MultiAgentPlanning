from dotenv import load_dotenv

load_dotenv(".env")

import asyncio
from pathlib import Path
from langchain_core.messages import HumanMessage
from llm_plan.workflow import build_graph


FOLDER = Path("./numtemp_test/datasets_nl/depots/str")
g = build_graph().compile()


async def run_one(file_path: Path, exp_num: int):
    initial_description = file_path.read_text(encoding="utf-8")

    initial_state = {
        "messages": [HumanMessage(content=initial_description)],
        "multi_agent": True,
        "mode": "direct",
        "refinement_iters": 8,
        "folder_name": f"depots_str_{exp_num}",
        "enable_clarifications": False,
        "WSL": True,
    }

    config = {
        "configurable": {"thread_id": f"dep_str_{exp_num}"},
        "recursion_limit": 80,
    }

    result = await g.ainvoke(initial_state, config=config)
    return exp_num, file_path.name, result


async def main():
    # sort files
    files = sorted([p for p in FOLDER.iterdir() if p.is_file()])[:5]
    tasks = [run_one(fp, i + 1) for i, fp in enumerate(files)]
    results = await asyncio.gather(*tasks)

    for exp_num, name, result in results:
        print(f"Experiment {exp_num} complete.")


if __name__ == "__main__":
    asyncio.run(main())
