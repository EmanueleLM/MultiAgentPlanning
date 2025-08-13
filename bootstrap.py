#!/usr/bin/env python3
import subprocess
import sys
import platform
from pathlib import Path
import json
import urllib.request
import zipfile

# Directories
PROJECT_ROOT = Path(__file__).resolve().parent
SRC_DIR = PROJECT_ROOT / "src" / "package_name"
SOLVERS_DIR = PROJECT_ROOT / "solvers"
CONFIG_FILE = SRC_DIR / "config.json"

# URLs for solver binaries by OS (could be .zip or direct binary)
SOLVER_URLS = {
    "Windows": "https://example.com/solver_windows.zip",
    "Linux": "https://example.com/solver_linux.zip",
    "Darwin": "https://example.com/solver_mac.zip",
}


def install_requirements():
    """Install dependencies for development."""
    req_file = PROJECT_ROOT / "requirements.txt"
    if req_file.exists():
        print(f"Installing dependencies from {req_file}...")
        subprocess.check_call(
            [sys.executable, "-m", "pip", "install", "-r", str(req_file)]
        )


def detect_os():
    """Return current OS string."""
    system = platform.system()
    if system not in SOLVER_URLS:
        raise RuntimeError(f"Unsupported OS: {system}")
    return system


def download_and_extract_solver(system):
    """Download the solver for the detected OS and extract it."""
    SOLVERS_DIR.mkdir(exist_ok=True)
    url = SOLVER_URLS[system]
    zip_path = SOLVERS_DIR / "solver_download.zip"

    print(f"Downloading solver for {system} from {url}...")
    urllib.request.urlretrieve(url, zip_path)

    print(f"Extracting solver to {SOLVERS_DIR}...")
    with zipfile.ZipFile(zip_path, "r") as zip_ref:
        zip_ref.extractall(SOLVERS_DIR)

    zip_path.unlink()  # Remove the zip after extraction

    # Find binary inside solvers directory
    solver_file = next(SOLVERS_DIR.glob("solver_*"), None)
    if not solver_file:
        raise FileNotFoundError("Solver binary not found after extraction")

    return solver_file


def write_config(solver_file):
    """Write solver location to config.json."""
    config_data = {
        "solver_binary": str(solver_file),
        "solvers_path": str(SOLVERS_DIR),
        "project_root": str(PROJECT_ROOT),
    }
    CONFIG_FILE.write_text(json.dumps(config_data, indent=4))
    print(f"Config written to {CONFIG_FILE}")


def bootstrap(dev_mode=True):
    """Run full bootstrap."""
    if dev_mode:
        install_requirements()
    system = detect_os()
    solver_file = download_and_extract_solver(system)
    write_config(solver_file)


if __name__ == "__main__":
    print("=== Bootstrapping my_project ===")
    bootstrap(dev_mode=True)
    print("✅ Setup complete")
