from pathlib import Path
import json

_config_file = Path(__file__).parent / "config.json"

if _config_file.exists():
    with open(_config_file) as f:
        CONFIG = json.load(f)
else:
    CONFIG = {}

SOLVER_BINARY = Path(CONFIG.get("solver_binary", ""))
SOLVERS_PATH = Path(CONFIG.get("solvers_path", ""))
PROJECT_ROOT = Path(CONFIG.get("project_root", ""))
