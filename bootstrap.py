#!/usr/bin/env python3
"""Project bootstrap utility.

This script prepares a development environment by:
- creating a Python virtual environment in ``.venv`` and installing ``requirements.txt``
- downloading/building the Fast Downward 2.1 and POPF2 solvers
- downloading/building the VAL and uVAL validators
- updating ``src/llm_plan/config.json`` with the discovered toolchain paths

The script supports macOS and Linux (tested with Ubuntu). It assumes that the host
has ``git``, ``cmake``, ``make``/``ninja`` and a modern C++ toolchain available.
"""

from __future__ import annotations

import json
import os
import platform
import subprocess
import sys
from pathlib import Path
from typing import Iterable, Optional

# ---------------------------------------------------------------------------
# Paths & constants

PROJECT_ROOT = Path(__file__).resolve().parent
SRC_DIR = PROJECT_ROOT / "src" / "llm_plan"
SOLVERS_DIR = PROJECT_ROOT / "solvers"
CONFIG_FILE = PROJECT_ROOT / "config.json"
VENV_DIR = PROJECT_ROOT / ".venv"

# Repositories / releases
FAST_DOWNWARD_REPO = "https://github.com/aibasel/downward.git"
FAST_DOWNWARD_BRANCH = "release-24.06.1"  # closest public release to Fast Downward 2.1

POPF2_REPO = "https://github.com/popf-tif/popf.git"

VAL_REPO = "https://github.com/KCL-Planning/VAL.git"
UVAL_REPO = "https://github.com/AI-Planning/uval.git"


# ---------------------------------------------------------------------------
# Utility helpers

def run(cmd: Iterable[str], cwd: Optional[Path] = None, env: Optional[dict[str, str]] = None) -> None:
    """Run a subprocess command, echoing it first."""

    command_list = [str(c) for c in cmd]
    pretty_cmd = " ".join(command_list)
    location = f" (cwd={cwd})" if cwd else ""
    print(f"[cmd]{location} $ {pretty_cmd}")
    subprocess.check_call(command_list, cwd=str(cwd) if cwd else None, env=env)


def ensure_directory(path: Path) -> Path:
    path.mkdir(parents=True, exist_ok=True)
    return path


def venv_python() -> Path:
    if platform.system() == "Windows":
        raise RuntimeError("This bootstrap script currently targets Linux and macOS only.")
    return VENV_DIR / "bin" / "python3"


def venv_pip() -> Path:
    return VENV_DIR / "bin" / "pip"


def ensure_virtualenv() -> None:
    """Create the virtual environment (if needed) and install requirements."""

    if not VENV_DIR.exists():
        print(f"Creating virtual environment at {VENV_DIR}...")
        run([sys.executable, "-m", "venv", str(VENV_DIR)])
    else:
        print(f"Virtual environment {VENV_DIR} already exists. Skipping creation.")

    pip_exe = venv_pip()
    run([str(venv_python()), "-m", "pip", "install", "--upgrade", "pip", "setuptools", "wheel"])

    requirements_file = PROJECT_ROOT / "requirements.txt"
    if requirements_file.exists():
        print(f"Installing requirements from {requirements_file} using {pip_exe}...")
        run([str(pip_exe), "install", "-r", str(requirements_file)])
    else:
        print("requirements.txt not found; skipping Python dependency installation.")


def clone_or_update(repo_url: str, dest: Path, branch: Optional[str] = None) -> None:
    """Clone ``repo_url`` into ``dest`` (or update if already present)."""

    if dest.exists():
        print(f"Repository {dest} already exists; fetching latest changes...")
        run(["git", "fetch", "--all"], cwd=dest)
        if branch:
            run(["git", "checkout", branch], cwd=dest)
        run(["git", "pull", "--ff-only"], cwd=dest)
    else:
        ensure_directory(dest.parent)
        clone_cmd = ["git", "clone", "--depth", "1"]
        if branch:
            clone_cmd.extend(["--branch", branch])
        clone_cmd.extend([repo_url, str(dest)])
        run(clone_cmd)


def build_fast_downward() -> Path:
    """Download and build Fast Downward, returning the solver entry point."""

    target_dir = SOLVERS_DIR / "fast-downward"
    clone_or_update(FAST_DOWNWARD_REPO, target_dir, FAST_DOWNWARD_BRANCH)

    print("Building Fast Downward (release configuration)...")
    run([str(sys.executable), "build.py", "release"], cwd=target_dir)

    expected = list((target_dir / "builds" / "release" / "bin").glob("*downward*"))
    if not expected:
        raise FileNotFoundError("Fast Downward binary not found after build.")
    solver_path = expected[0]
    solver_path.chmod(solver_path.stat().st_mode | 0o111)
    return solver_path


def build_popf2() -> Path:
    """Download and build POPF2, returning the primary binary path."""

    target_dir = SOLVERS_DIR / "popf2"
    clone_or_update(POPF2_REPO, target_dir)

    build_dir = target_dir / "build"
    ensure_directory(build_dir)

    print("Configuring POPF2 (Release build)...")
    run(["cmake", "-S", str(target_dir), "-B", str(build_dir), "-DCMAKE_BUILD_TYPE=Release"])
    print("Compiling POPF2...")
    run(["cmake", "--build", str(build_dir), "--config", "Release"])

    binaries = [p for p in build_dir.rglob("*popf*" ) if p.is_file() and os.access(p, os.X_OK)]
    if not binaries:
        raise FileNotFoundError("POPF2 binary not found after build.")
    binaries.sort(key=lambda p: len(str(p)))
    solver_path = binaries[0]
    solver_path.chmod(solver_path.stat().st_mode | 0o111)
    return solver_path


def build_val() -> Path:
    """Download and build the VAL validator."""

    target_dir = SOLVERS_DIR / "val"
    clone_or_update(VAL_REPO, target_dir)

    build_dir = target_dir / "build"
    ensure_directory(build_dir)

    print("Configuring VAL...")
    run(["cmake", "-S", str(target_dir), "-B", str(build_dir), "-DCMAKE_BUILD_TYPE=Release"])
    print("Building VAL...")
    run(["cmake", "--build", str(build_dir), "--config", "Release"])

    validate_bin = next((p for p in build_dir.rglob("Validate") if p.is_file()), None)
    if not validate_bin:
        raise FileNotFoundError("VAL 'Validate' binary not found after build.")
    validate_bin.chmod(validate_bin.stat().st_mode | 0o111)
    return validate_bin


def build_uval() -> Path:
    """Download and build uVAL validator (universal validator)."""

    target_dir = SOLVERS_DIR / "uval"
    clone_or_update(UVAL_REPO, target_dir)

    build_dir = target_dir / "build"
    ensure_directory(build_dir)

    print("Configuring uVAL...")
    run(["cmake", "-S", str(target_dir), "-B", str(build_dir), "-DCMAKE_BUILD_TYPE=Release"])
    print("Building uVAL...")
    run(["cmake", "--build", str(build_dir), "--config", "Release"])

    candidates = [
        p for p in build_dir.rglob("validate*") if p.is_file() and os.access(p, os.X_OK)
    ]
    if not candidates:
        raise FileNotFoundError("uVAL validator binary not found after build.")

    validator_bin = candidates[0]

    validator_bin.chmod(validator_bin.stat().st_mode | 0o111)
    return validator_bin


def update_config(
    fast_downward_path: Path,
    popf_path: Path,
    val_path: Path,
    uval_path: Path,
) -> None:
    """Inject solver / validator paths into config.json."""

    config: dict[str, object] = {}
    if CONFIG_FILE.exists():
        config = json.loads(CONFIG_FILE.read_text())

    config.update(
        {
            "project_root": str(PROJECT_ROOT),
            "package_folder": str(SRC_DIR),
            "solver_fd_binary": str(fast_downward_path),
            "solver_popf2_binary": str(popf_path),
            "validator_bin": str(val_path),
            "universal_validator_bin": str(uval_path),
            "python_venv": str(VENV_DIR),
        }
    )

    CONFIG_FILE.write_text(json.dumps(config, indent=4))
    print(f"Configuration updated at {CONFIG_FILE}")


def bootstrap() -> None:
    """Run the full bootstrap pipeline."""

    print("=== Bootstrapping MultiAgentPlanning ===")
    ensure_virtualenv()
    ensure_directory(SOLVERS_DIR)

    fast_downward = build_fast_downward()
    popf2 = build_popf2()
    val = build_val()
    uval = build_uval()

    update_config(fast_downward, popf2, val, uval)
    print("✅ Setup complete")


if __name__ == "__main__":
    try:
        bootstrap()
    except subprocess.CalledProcessError as exc:
        print(f"Bootstrap failed with return code {exc.returncode}")
        sys.exit(exc.returncode)
