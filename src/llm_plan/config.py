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
RESULTS_FOLDER = Path(CONFIG.get("results_folder", ""))
SOLVER_BINARY = Path(CONFIG.get("solver_binary", ""))
SOLVER_ARGS = CONFIG.get("solver_args", [])
