import json
from pathlib import Path
from typing import Dict, List

from src.llm_plan.llm import ChatGPT, Gemini, DeepSeekR170B
from src.llm_plan.utils import (
    run_pddl_popf2_and_Val,
    run_pddl_fast_downwards_and_uVal,
)

# Assume you always run Python from project_root
_config_file = Path.cwd() / "config.json"

if _config_file.exists():
    with open(_config_file) as f:
        CONFIG = json.load(f)
else:
    raise FileNotFoundError(
        "Configuration file 'config.json' not found in the current directory."
    )

# Project folders
PROJECT_ROOT = Path(CONFIG.get("project_root", ""))
PACKAGE_FOLDER = Path(CONFIG.get("package_folder", ""))
ENVIRONMENTS_PATH = Path(CONFIG.get("environments_path", ""))
RESULTS_FOLDER = Path(CONFIG.get("results_folder", ""))
AGENT_PYTHON_PATH = Path(CONFIG.get("agent_python_path", ""))

# Benchmarks and data
DATA_PATH = Path(CONFIG.get("data_folder", ""))

# json paths
ENVIRONMENTS_JSON_PATH = Path(CONFIG.get("environments_json_path", ""))
ENVIRONMENTS_JSON_SAMPLE_PATH = Path(CONFIG.get("environments_json_sample_path", ""))
ENVIRONMENTS_PYTHON_PATH_SAMPLE = Path(
    CONFIG.get("environments_python_path_sample", "")
)

# Solvers and validators
SOLVER_POPF2_BINARY = Path(CONFIG.get("solver_popf2_binary", ""))
SOLVER_FD_BINARY = Path(CONFIG.get("solver_fd_binary", ""))
SOLVER_FD_ARGS = CONFIG.get("solver_fd_args", [])
SOLVER_FD_OPTIMIZE_ARGS = CONFIG.get("solver_fd_optimize_args", [])
VALIDATOR_BIN = CONFIG.get("validator_bin", "")
UNIVERSAL_VALIDATOR_BIN = CONFIG.get("universal_validator_bin", "")

# Datasets
DATASET = {
    # Google Natural Bench
    "calendar_scheduling": {
        "data": DATA_PATH / "natural_plan/calendar_scheduling.json",
        "results": RESULTS_FOLDER / "google",
    },
    "meeting_planning": {
        "data": DATA_PATH / "natural_plan/meeting_planning.json",
        "results": RESULTS_FOLDER / "google",
    },
    "trip_planning": {
        "data": DATA_PATH / "natural_plan/trip_planning.json",
        "results": RESULTS_FOLDER / "google",
    },
    # PlanBench
    "depots": {
        "data": DATA_PATH / "planbench/depots.json",
        "results": RESULTS_FOLDER / "planbench",
    },
    "logistics": {
        "data": DATA_PATH / "planbench/logistics.json",
        "results": RESULTS_FOLDER / "planbench",
    },
    "mystery_blocksworld": {
        "data": DATA_PATH / "planbench/mystery_blocksworld.json",
        "results": RESULTS_FOLDER / "planbench",
    },
    "obfuscated_deceptive_logistics": {
        "data": DATA_PATH / "planbench/obfuscated_deceptive_logistics.json",
        "results": RESULTS_FOLDER / "planbench",
    },
    "blocksworld": {
        "data": DATA_PATH / "planbench/blocksworld.json",
        "results": RESULTS_FOLDER / "planbench",
    },
    "blocksworld_easy": {
        "data": DATA_PATH / "blocksworld/blocksworld_easy.json",
        "results": RESULTS_FOLDER / "blocksworld" / "blocksworld_easy",
    },
    "blocksworld_medium": {
        "data": DATA_PATH / "blocksworld/blocksworld_medium.json",
        "results": RESULTS_FOLDER / "blocksworld" / "blocksworld_medium",
    },
    "blocksworld_hard": {
        "data": DATA_PATH / "blocksworld/blocksworld_hard.json",
        "results": RESULTS_FOLDER / "blocksworld" / "blocksworld_hard",
    },
    "hanoi_easy": {
        "data": DATA_PATH / "hanoi/hanoi_easy.json",
        "results": RESULTS_FOLDER / "hanoi" / "hanoi_easy",
    },
    "hanoi_medium": {
        "data": DATA_PATH / "hanoi/hanoi_medium.json",
        "results": RESULTS_FOLDER / "hanoi" / "hanoi_medium",
    },
    "hanoi_hard": {
        "data": DATA_PATH / "hanoi/hanoi_hard.json",
        "results": RESULTS_FOLDER / "hanoi" / "hanoi_hard",
    }
}

# LLM-as-a-judge prompts
PROMPTS_LLM_JUDGE: Dict[str, List[str]] = {
    "calendar_scheduling": [
        "For this problem, check whether the natural plan, which is the candidate plan, matches the golden plan.",
        "Check that every calendar event in the golden plan appears at the same time, with the same participants and resources.",
    ],
    "meeting_planning": [
        "For this problem, check whether the natural plan, which is the candidate plan, matches the golden plan.",
        "Ensure every scheduled meeting matches the golden plan in start time and duration. It is important that you check whether the candidate plan matches the constraints in the original prompt (prompt_0shot), rather than the golden plan, as the candidate plan may schedule events in a different order or time slots, as long as all constraints are satisfied.",
    ],
    "trip_planning": [
        "For this problem, check whether the natural plan, which is the candidate plan, matches the golden plan.",
        "Verify that the duration of each city visitation strictly matches the original prompt (prompt_0shot); when judging against the golden reference plan, keep in mind that the candidate plan may visit each city in a different order and with multiple flights; unless otherwise stated, what matters is that the stay duration in each city is correct and the meetings with other people happen as planned. This is also important: if one flies between two cities, that counts as a day spent in both cities!",
    ],
    "logistics": [
        "For this problem, check whether the natural plan, which is the candidate plan, matches the golden plan.",
        "Confirm that all packages, vehicles, and locations end in the same configuration as the golden plan and that load/unload steps match. Keep in mind that the candidate plan may use different routes or intermediate stops, as long as the final configuration and load/unload actions are consistent with the golden plan.",
    ],
    "depots": [
        "For this problem, check whether the natural plan, which is the candidate plan, matches the golden plan.",
        "Ensure the actions in the candidate plan produce the correct outcome. The plan may differ, as long as the final outcomes are achieved and the actions defined in the prompt are followed and valid.",
        "Reject plans that leave objects at different depots, but keep those that introduce alternative lifting sequences or drop-off points, if they still achieve the same overall goal.",
    ],
    "blocksworld": [
        "For this problem, check whether the natural plan, which is the candidate plan, matches the golden plan.",
        "Check that every block stack configuration matches the golden plan at the end. If the intermediate steps differ but the final arrangement is identical and all the actions in the candidate plan are allowed, accept the plan.",
        "Ignore cost differences if the final arrangement is identical to the golden plan.",
    ],
    "blocksworld_easy": [
        "For this problem, check first whether the sas plan is present: if present, that is the candidate plan. Otherwise, the candidate plan is the natural language plan. Your task is to check whether the candidate plan matches the golden plan.",
        "Check that the actions executed in the candidate plan and in the golden plan are the same or, equivalently, that the candidate plan achieves the same final goal with valid actions and *employing the same number of actions*. Ignore if the candidate plan uses a different syntax or action order, as long as it is feasible, optimal, and produces the same final outcome.",
    ],
    "blocksworld_medium": [
        "For this problem, check first whether the sas plan is present: if present, that is the candidate plan. Otherwise, the candidate plan is the natural language plan. Your task is to check whether the candidate plan matches the golden plan.",
        "Check that the actions executed in the candidate plan and in the golden plan are the same or, equivalently, that the candidate plan achieves the same final goal with valid actions and *employing the same number of actions*. Ignore if the candidate plan uses a different syntax or action order, as long as it is feasible, optimal, and produces the same final outcome.",
    ],
    "blocksworld_hard": [
        "For this problem, check first whether the sas plan is present: if present, that is the candidate plan. Otherwise, the candidate plan is the natural language plan. Your task is to check whether the candidate plan matches the golden plan.",
        "Check that the actions executed in the candidate plan and in the golden plan are the same or, equivalently, that the candidate plan achieves the same final goal with valid actions and *employing the same number of actions*. Ignore if the candidate plan uses a different syntax or action order, as long as it is feasible, optimal, and produces the same final outcome.",
    ],
    "hanoi_easy": [
        "For this problem, check first whether the sas plan is present: if present, that is the candidate plan. Otherwise, the candidate plan is the natural language plan. Your task is to check whether the candidate plan matches the golden plan.",
        "Check that the actions executed in the candidate plan and in the golden plan are the same or, equivalently, that the candidate plan achieves the same final goal with valid actions. Ignore if the candidate plan uses a different syntax or action order, as long as it is feasible and produces the same final outcome.",
    ],
    "hanoi_medium": [
        "For this problem, check first whether the sas plan is present: if present, that is the candidate plan. Otherwise, the candidate plan is the natural language plan. Your task is to check whether the candidate plan matches the golden plan.",
        "Check that the actions executed in the candidate plan and in the golden plan are the same or, equivalently, that the candidate plan achieves the same final goal with valid actions. Ignore if the candidate plan uses a different syntax or action order, as long as it is feasible and produces the same final outcome.",
    ],
    "hanoi_hard": [
        "For this problem, check first whether the sas plan is present: if present, that is the candidate plan. Otherwise, the candidate plan is the natural language plan. Your task is to check whether the candidate plan matches the golden plan.",
        "Check that the actions executed in the candidate plan and in the golden plan are the same or, equivalently, that the candidate plan achieves the same final goal with valid actions. Ignore if the candidate plan uses a different syntax or action order, as long as it is feasible and produces the same final outcome.",
    ]
}

# Solvers configuration
SOLVER = {
    "POPF2": {
        "solver": run_pddl_popf2_and_Val,
        "support_optimization": False,
        "timeout": 0,
    },
    "FastDownwards": {
        "solver": run_pddl_fast_downwards_and_uVal,
        "support_optimization": True,
        "timeout": 120,
    },
}

# Models configuration
MODELS = {
    "gpt-4o": {"model": ChatGPT("gpt-4o"), "persistent": False, "sleep": 0},
    "gpt-5": {"model": ChatGPT("gpt-5"), "persistent": False, "sleep": 0},
    "gpt-5-mini": {"model": ChatGPT("gpt-5-mini"), "persistent": False, "sleep": 0},
    "gpt-5-nano": {"model": ChatGPT("gpt-5-nano"), "persistent": False, "sleep": 0},
    "gemini-2.5-flash": {
        "model": Gemini("gemini-2.5-flash"),
        "persistent": False,
        "sleep": 10,
    },
    "gemini-2.5-pro": {
        "model": Gemini("gemini-2.5-pro"),
        "persistent": False,
        "sleep": 20,
    },
    "deepseek-r1-70B": {
        "model": DeepSeekR170B("deepseek-r1-70B"),
        "persistent": True,
        "sleep": 0,
    }
}
