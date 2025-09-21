"""Baseline for different benchmarks

Works in a similar way to benchmark.py, 
but uses a single LLM to directly solve the task in natural language.
"""

import argparse
import asyncio
import json
import os
import re
from time import sleep
from pathlib import Path


from src.llm_plan.config import DATA_PATH
from src.llm_plan.llm import ChatGPT, Gemini

DATASET = {
    "calendar_scheduling": {
        "data": DATA_PATH / "natural_plan/calendar_scheduling.json",
        "results": Path("./tmp/google")
        },
    "meeting_planning": {
        "data": DATA_PATH / "natural_plan/meeting_planning.json",
        "results": Path("./tmp/google")
        },
    "trip_planning": {
        "data": DATA_PATH / "natural_plan/trip_planning.json",
        "results": Path("./tmp/google")
        },
    "blocksworld": {
        "data": DATA_PATH / "blocksworld/blocks_world_dataset.json",
        "results": Path("./tmp/blocksworld")
        },
    "calendar_easy_to_hard": {
        "data": DATA_PATH / "miscellanea/calendar_easy_to_hard.json",
        "results": Path("./tmp/calendar_easy_to_hard")
        },
    "calendar_easy_to_hard_shifted": {
        "data": DATA_PATH / "miscellanea/calendar_easy_to_hard_shifted.json",
        "results": Path("./tmp/calendar_easy_to_hard_shifted")
        },
    "calendar_easy_to_hard_shifted_noise": {
        "data": DATA_PATH / "miscellanea/calendar_easy_to_hard_shifted_noise.json",
        "results": Path("./tmp/calendar_easy_to_hard_shifted_noise")
        },
    "calendar_easy_to_hard_analogy": {
        "data": DATA_PATH / "miscellanea/calendar_easy_to_hard_analogy.json",
        "results": Path("./tmp/calendar_easy_to_hard_analogy")
        },
    "calendar_easy_to_hard_analogy_shifted": {
        "data": DATA_PATH / "miscellanea/calendar_easy_to_hard_analogy_shifted.json",
        "results": Path("./tmp/calendar_easy_to_hard_analogy_shifted")
        }
}

MODELS = {
    "gpt-4o": {"model": ChatGPT("gpt-4o"),
                "persistent": False,
                "sleep": 0},
    "gpt-5-mini": {"model": ChatGPT("gpt-5-mini"),
                "persistent": False, 
                "sleep": 0},
    "gpt-5-nano": {"model": ChatGPT("gpt-5-nano"),
                "persistent": False, 
                "sleep": 0},
    "gemini-2.5-flash": {"model": Gemini("gemini-2.5-flash"),
                "persistent": False,
                "sleep": 10},
    "gemini-2.5-pro": {"model": Gemini("gemini-2.5-pro"),
                "persistent": False,
                "sleep": 20},
    # "gpt-oss-120b": {"model": GPT_OSS("gpt-oss-120b"),
    #             "persistent": True,
    #             "sleep": 0},  # this model won't be loaded until generate_sync is called
}


def parse_args():
    parser = argparse.ArgumentParser(
        description="Run experiments with PDDL and planning agents."
    )

    parser.add_argument(
        "--dataset",
        type=str,
        default="calendar_scheduling",
        choices=DATASET.keys(),
        help="The dataset to choose from. Default: calendar_scheduling.",
    )
    parser.add_argument(
        "--num_experiments",
        type=int,
        default=10,
        help="Number of experiments (default: 10)",
    )
    parser.add_argument(
        "--model",
        type=str,
        default="gpt-5-mini",
        choices=MODELS.keys(),
        help="Model for solving the task in dataset (default: gpt-5-mini)",
    )
    parser.add_argument(
        "--debug",
        type=bool,
        default=True,
        help="Outputs the full logs in a file named __full_logs.txt (default: True)",
    )

    return parser.parse_args()


if __name__ == "__main__":
    args = parse_args()

    # Argpasrse arguments
    dataset_name = args.dataset
    num_experiments = args.num_experiments
    debug = args.debug
    
    # Init LLMs
    model = MODELS[args.model]["model"]
    
    # Sleep time not to make the experiments with the APIs crash
    sleep_time_plan = MODELS[args.model]["sleep"]
    
    with open(DATASET[args.dataset]["data"], "r") as f:
        scheduling_data = json.load(f)
    
    problem_name = list(scheduling_data.keys())[0][:-1]
    BASE_FOLDER = DATASET[args.dataset]["results"] / f"{dataset_name}/zero_shot"
    
    system_prompt = "You are an expert planner and scheduling assistant."
    for i in range(num_experiments):
        k = f"{problem_name}{i}"
        data = scheduling_data[k]
        
        response = model.generate_sync(system_prompt, 
                                       data["prompt_0shot"])
        
        result = {
            "prompt_0shot": data["prompt_0shot"],
            "response": response
        }
        
        if not (BASE_FOLDER / f"{args.model}.json").exists():
            os.makedirs(BASE_FOLDER, exist_ok=True)
            with open(BASE_FOLDER / f"{args.model}.json", "w", encoding="utf-8") as f:
                json.dump({}, f)
        
        # Append the response to a(n existing) json file
        with open(BASE_FOLDER / f"{args.model}.json", "r+", encoding="utf-8") as f:
            data = json.load(f)
            key = k
            data[key] = result
            f.seek(0)
            json.dump(data, f, indent=2)
            f.truncate()
        
        sleep(sleep_time_plan)