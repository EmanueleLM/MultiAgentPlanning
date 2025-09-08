from pathlib import Path
import json

# Assume you always run Python from project_root
_config_file = Path.cwd() / "config.json"
_secondary_config_file = Path(__file__).parent.parent.parent / "config.json"
if not _config_file.exists() and _secondary_config_file.exists():
    _config_file = _secondary_config_file

if _config_file.exists():
    with open(_config_file) as f:
        CONFIG = json.load(f)
else:
    raise FileNotFoundError(
        "Configuration file 'config.json' not found in the current directory."
    )

PROJECT_ROOT = Path(CONFIG.get("project_root", ""))
PACKAGE_FOLDER = Path(CONFIG.get("package_folder", ""))
ENVIRONMENTS_PATH = Path(CONFIG.get("environments_path", ""))
RESULTS_FOLDER = Path(CONFIG.get("results_folder", ""))
AGENT_PYTHON_PATH = Path(CONFIG.get("agent_python_path", ""))
ENVIRONMENTS_JSON_PATH = Path(CONFIG.get("environments_json_path", ""))
ENVIRONMENTS_JSON_SAMPLE_PATH = Path(CONFIG.get("environments_json_sample_path", ""))
ENVIRONMENTS_PYTHON_PATH_SAMPLE = Path(
    CONFIG.get("environments_python_path_sample", "")
)
SOLVER_BINARY = CONFIG.get("solver_binary", "")
TEMPORAL_SOLVER_BINARY = CONFIG.get("temporal_solver_binary", "")
SOLVER_ARGS = CONFIG.get("solver_args", [])
UNIVERSAL_VALIDATOR = CONFIG.get("universal_validator", "")
UNIVERSAL_VALIDATOR_BIN = CONFIG.get("universal_validator_bin", "")
