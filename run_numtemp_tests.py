from dotenv import load_dotenv

load_dotenv(".env")

import asyncio
from pathlib import Path
from langchain_core.messages import HumanMessage
from llm_plan.workflow import build_graph

FOLDER = Path("./numtemp_complexity_test/datasets_nl/satellite")
g = build_graph().compile()

CONCURRENCY = 3  # cap simultaneous LLM calls


async def run_one(file_path: Path, exp_num: int, sem: asyncio.Semaphore):
    # prep outside the semaphore so doing local work doesn't occypy slot
    initial_description = file_path.read_text(encoding="utf-8")

    initial_state = {
        "messages": [HumanMessage(content=initial_description)],
        "multi_agent": True,
        "mode": "direct",
        "refinement_iters": 10,
        "folder_name": f"satellite_t_{exp_num}",
        "enable_clarifications": False,
        "WSL": True,
    }
    config = {
        "configurable": {"thread_id": f"satellite_t_{exp_num}"},
        "recursion_limit": 100,
    }

    # only the networked/ratelimited bit is guarded
    async with sem:
        result = await g.ainvoke(initial_state, config=config)

    return exp_num, file_path.name, result


async def main():
    files = sorted([p for p in FOLDER.iterdir() if p.is_file()])
    sem = asyncio.Semaphore(CONCURRENCY)

    # schedule everything, but concurrency is capped by the semaphore
    tasks = [
        asyncio.create_task(run_one(fp, i + 1, sem))
        for i, fp in enumerate(files, start=5)
    ]

    # stream completions as they finish (not in start order)
    results = []
    for t in asyncio.as_completed(tasks):
        exp_num, name, _ = await t
        print(f"Experiment {exp_num} ({name}) complete.")
        results.append((exp_num, name))


if __name__ == "__main__":
    asyncio.run(main())
