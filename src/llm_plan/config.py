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
    # Blocksworld
    "blocksworld": {
        "data": DATA_PATH / "planbench/blocksworld.json",
        "results": RESULTS_FOLDER / "planbench",
    },
    # Hanoi multi-agent
    "hanoi_multi_agent_2_agents_10_disks": {
        "data": DATA_PATH / "hanoi_multi_agent/hanoi_2_agents_10_disks.json",
        "results": RESULTS_FOLDER / "hanoi_multi_agent" / "hanoi_2_agents_10_disks",
    },
    "hanoi_multi_agent_2_agents_15_disks": {
        "data": DATA_PATH / "hanoi_multi_agent/hanoi_2_agents_15_disks.json",
        "results": RESULTS_FOLDER / "hanoi_multi_agent" / "hanoi_2_agents_15_disks",
    },
    "hanoi_multi_agent_2_agents_20_disks": {
        "data": DATA_PATH / "hanoi_multi_agent/hanoi_2_agents_20_disks.json",
        "results": RESULTS_FOLDER / "hanoi_multi_agent" / "hanoi_2_agents_20_disks",
    },
    "hanoi_multi_agent_3_agents_10_disks": {
        "data": DATA_PATH / "hanoi_multi_agent/hanoi_3_agents_10_disks.json",
        "results": RESULTS_FOLDER / "hanoi_multi_agent" / "hanoi_3_agents_10_disks",
    },
    "hanoi_multi_agent_3_agents_15_disks": {
        "data": DATA_PATH / "hanoi_multi_agent/hanoi_3_agents_15_disks.json",
        "results": RESULTS_FOLDER / "hanoi_multi_agent" / "hanoi_3_agents_15_disks",
    },
    "hanoi_multi_agent_3_agents_20_disks": {
        "data": DATA_PATH / "hanoi_multi_agent/hanoi_3_agents_20_disks.json",
        "results": RESULTS_FOLDER / "hanoi_multi_agent" / "hanoi_3_agents_20_disks",
    },
    "hanoi_multi_agent_4_agents_10_disks": {
        "data": DATA_PATH / "hanoi_multi_agent/hanoi_4_agents_10_disks.json",
        "results": RESULTS_FOLDER / "hanoi_multi_agent" / "hanoi_4_agents_10_disks",
    },
    "hanoi_multi_agent_4_agents_15_disks": {
        "data": DATA_PATH / "hanoi_multi_agent/hanoi_4_agents_15_disks.json",
        "results": RESULTS_FOLDER / "hanoi_multi_agent" / "hanoi_4_agents_15_disks",
    },
    "hanoi_multi_agent_4_agents_20_disks": {
        "data": DATA_PATH / "hanoi_multi_agent/hanoi_4_agents_20_disks.json",
        "results": RESULTS_FOLDER / "hanoi_multi_agent" / "hanoi_4_agents_20_disks",
    },
}

# LLM-as-a-judge prompts
PROMPTS_LLM_JUDGE: Dict[str, List[str]] = {
    "trip_planning": [
        "Verify that the duration of each city visitation strictly matches the original prompt (prompt_0shot); when judging against the golden reference plan, keep in mind that the proposed plan may visit each city in a different order and with multiple flights; unless otherwise stated, what matters is that the stay duration in each city is correct and the meetings with other people happen as planned. This is also important: if one flies between two cities, that counts as a day spent in both cities!",
    ],
    "meeting_planning": [
        "Ensure every scheduled meeting matches the golden plan in start time and duration. It is important that you check whether the proposed plan matches the constraints in the original prompt (prompt_0shot), rather than the golden plan, as the proposed plan may schedule events in a different order or time slots, as long as all constraints are satisfied.",
    ],
    "calendar_scheduling": [
        "Check that every calendar event in the golden plan appears at the same time, with the same participants and resources.",
    ],
    "logistics": [
        "Confirm that all packages, vehicles, and locations end in the same configuration as the golden plan and that load/unload steps match. Keep in mind that the proposed plan may use different routes or intermediate stops, as long as the final configuration and load/unload actions are consistent with the golden plan.",
    ],
    "depots": [
        "Ensure hoist, truck, and pallet interactions mirror the golden plan exactly, including pickup/drop ordering.",
        "Reject plans that leave objects at different depots, but keep those that introduce alternative lifting sequences or drop-off points, if they still achieve the same overall goal.",
    ],
    "blocksworld": [
        "Check that every block stack configuration matches the golden plan at the end. If the intermediate steps differ but the final arrangement is identical and all the actions in the proposed plan are allowed, accept the plan.",
        "Ignore cost differences only if the final arrangement is identical to the golden plan.",
    ],
    "mystery_blocksworld": [
        "Treat the golden plan as the authoritative block arrangement; ensure the candidate builds identical towers and ordering. If the candidate plan achieves the same final arrangement with different intermediate steps, accept it, as long as the actions are allowed.",
    ],
    "obfuscated_deceptive_logistics": [
        "Confirm that all packages, vehicles, and locations end in the same configuration as the golden plan and that load/unload steps match. Keep in mind that the proposed plan may use different routes or intermediate stops, as long as the final configuration and load/unload actions are consistent with the golden plan.",
    ],
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
