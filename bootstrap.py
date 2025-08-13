#!/usr/bin/env python3
import subprocess
import sys
import platform
from pathlib import Path
import json

PROJECT_ROOT = Path(__file__).resolve().parent
PACKAGE_DIR = PROJECT_ROOT / "my_project"
CONFIG_FILE = PACKAGE_DIR / "config.json"


def install_requirements():
    req_file = PROJECT_ROOT / "requirements.txt"
    if req_file.exists():
        print(f"Installing dependencies from {req_file}...")
        subprocess.check_call(
            [sys.executable, "-m", "pip", "install", "-r", str(req_file)]
        )


def detect_solver():
    """Detect correct solver binary for current OS."""
    system = platform.system()
    solvers_dir = PACKAGE_DIR / "solvers"

    if system == "Windows":
        solver_file = solvers_dir / "solver_windows.exe"
    elif system == "Linux":
        solver_file = solvers_dir / "solver_linux.bin"
    elif system == "Darwin":  # macOS
        solver_file = solvers_dir / "solver_mac.bin"
    else:
        raise RuntimeError(f"Unsupported OS: {system}")

    if not solver_file.exists():
        raise FileNotFoundError(f"Solver binary not found: {solver_file}")

    return solver_file


def write_config():
    solver_file = detect_solver()
    config_data = {
        "solver_binary": str(solver_file),
        "solvers_path": str(solver_file.parent),
        "project_root": str(PROJECT_ROOT),
    }
    CONFIG_FILE.write_text(json.dumps(config_data, indent=4))
    print(f"Config written to {CONFIG_FILE}")


def bootstrap(dev_mode: bool = True):
    if dev_mode:
        install_requirements()
    write_config()


if __name__ == "__main__":
    print("=== Bootstrapping my_project ===")
    bootstrap(dev_mode=True)
    print("✅ Setup complete")
