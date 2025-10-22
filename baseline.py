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

from src.llm_plan.config import DATASET, MODELS


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

    # Argparse arguments
    dataset_name = args.dataset
    num_experiments = args.num_experiments
    debug = args.debug
    
    # Init LLMs
    model = MODELS[args.model]["model"]
    
    # Sleep time not to make the experiments with the APIs crash
    sleep_time_plan = MODELS[args.model]["sleep"]
    
    with open(DATASET[args.dataset]["data"], "r") as f:
        scheduling_data = json.load(f)

    # Take the problem name (e.g., calendar_scheduling_0 -> calendar_scheduling)
    key = list(scheduling_data.keys())[0]
    if "_" in key:
        problem_name, _ = key.rsplit("_", 1)
    else:
        problem_name = key
        
    BASE_FOLDER = DATASET[args.dataset]["results"] / f"{dataset_name}/vanilla_llm"
    
    system_prompt = "You are an expert planner and scheduling assistant."
    for i in range(num_experiments):
        numbered_problem_name = f"{problem_name}_{i}"
        data = scheduling_data[numbered_problem_name]
        
        prompt_0shot = data["prompt_0shot"]
        response = model.generate_sync(system_prompt, prompt_0shot)

        result = {
            "prompt_0shot": prompt_0shot,
            "prompt": prompt_0shot,
            "golden_plan": data.get("golden_plan"),
            "response": response,
        }
        
        if not (BASE_FOLDER / f"{args.model}.json").exists():
            os.makedirs(BASE_FOLDER, exist_ok=True)
            with open(BASE_FOLDER / f"{args.model}.json", "w", encoding="utf-8") as f:
                json.dump({}, f)
        
        # Append the response to a(n existing) json file
        with open(BASE_FOLDER / f"{args.model}.json", "r+", encoding="utf-8") as f:
            data = json.load(f)
            key = numbered_problem_name
            data[key] = result
            f.seek(0)
            json.dump(data, f, indent=2)
            f.truncate()
        
        sleep(sleep_time_plan)
