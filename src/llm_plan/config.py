from pathlib import Path
import json

# Assume you always run Python from project_root
_config_file = Path.cwd() / "config.json"

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
SOLVER_BINARY = Path(CONFIG.get("solver_binary", ""))
SOLVER_ARGS = CONFIG.get("solver_args", [])
UNIVERSAL_VALIDATOR_BIN = CONFIG.get("universal_validator_bin", "")
