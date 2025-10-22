import json
from pathlib import Path

from src.llm_plan.llm import ChatGPT, Gemini
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
    # Blocksworld
    "blocksworld": {
        "data": DATA_PATH / "planbench/blocksworld.json",
        "results": RESULTS_FOLDER / "planbench",
    },
    "blocksworld_10_actions_scaling": {
        "data": DATA_PATH / "blocksworld_scaling/blocksworld_10_actions_scaling.json",
        "results": RESULTS_FOLDER / "blocksworld_scaling" / "blocksworld_10_actions_scaling",
    },
    "blocksworld_20_actions_scaling": {
        "data": DATA_PATH / "blocksworld_scaling/blocksworld_20_actions_scaling.json",
        "results": RESULTS_FOLDER / "blocksworld_scaling" / "blocksworld_20_actions_scaling",
    },
    "blocksworld_30_actions_scaling": {
        "data": DATA_PATH / "blocksworld_scaling/blocksworld_30_actions_scaling.json",
        "results": RESULTS_FOLDER / "blocksworld_scaling" / "blocksworld_30_actions_scaling",
    },
    "blocksworld_40_actions_scaling": {
        "data": DATA_PATH / "blocksworld_scaling/blocksworld_40_actions_scaling.json",
        "results": RESULTS_FOLDER / "blocksworld_scaling" / "blocksworld_40_actions_scaling",
    },
    "blocksworld_50_actions_scaling": {
        "data": DATA_PATH / "blocksworld_scaling/blocksworld_50_actions_scaling.json",
        "results": RESULTS_FOLDER / "blocksworld_scaling" / "blocksworld_50_actions_scaling",
    },
    # Blocksworld Multi-agent
    "multiagent-blocksworld": {
        "data": DATA_PATH / "blocksworld/blocks_world_dataset.json",
        "results": RESULTS_FOLDER / "multiagent-blocksworld",
    },
    # Hanoi
    "hanoi_4_disks": {
        "data": DATA_PATH / "hanoi_scaling/hanoi_4_disks.json",
        "results": RESULTS_FOLDER / "hanoi_scaling" / "hanoi_4_disks",
    },
    "hanoi_5_disks": {
        "data": DATA_PATH / "hanoi_scaling/hanoi_5_disks.json",
        "results": RESULTS_FOLDER / "hanoi_scaling" / "hanoi_5_disks",
    },
    "hanoi_6_disks": {
        "data": DATA_PATH / "hanoi_scaling/hanoi_6_disks.json",
        "results": RESULTS_FOLDER / "hanoi_scaling" / "hanoi_6_disks",
    },
    "hanoi_7_disks": {
        "data": DATA_PATH / "hanoi_scaling/hanoi_7_disks.json",
        "results": RESULTS_FOLDER / "hanoi_scaling" / "hanoi_7_disks",
    },
    "hanoi_8_disks": {
        "data": DATA_PATH / "hanoi_scaling/hanoi_8_disks.json",
        "results": RESULTS_FOLDER / "hanoi_scaling" / "hanoi_8_disks",
    }
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
    }
}
