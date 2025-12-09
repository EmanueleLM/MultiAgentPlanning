#!/usr/bin/env python3
"""Linux bootstrap utility.

This script prepares a development environment by:
- creating a Python virtual environment in ``.venv`` and installing ``requirements.txt``
- installing the Fast Downward release, POPF2, uVAL, and VAL artifacts
- updating ``config.json`` with the discovered toolchain paths

Only Linux is targeted (mirroring README instructions). Ensure required build
tooling (git, cmake, compilers, etc.) is already installed on the host OS.
"""

from __future__ import annotations

import json
import os
import platform
import shutil
import subprocess
import sys
import tarfile
from pathlib import Path
from typing import Iterable, Optional, Tuple
from urllib.request import urlopen

# ---------------------------------------------------------------------------
# Paths & constants

PROJECT_ROOT = Path(__file__).resolve().parent
SRC_DIR = PROJECT_ROOT / "src" / "llm_plan"
SOLVERS_DIR = PROJECT_ROOT / "solvers"
CONFIG_FILE = PROJECT_ROOT / "config.json"
VENV_DIR = PROJECT_ROOT / ".venv"

# Fast Downward release artefact (matches README manual instructions)
FAST_DOWNWARD_RELEASE = "fast-downward-24.06.1"
FAST_DOWNWARD_ARCHIVE = f"{FAST_DOWNWARD_RELEASE}.tar.gz"
FAST_DOWNWARD_URL = (
    "https://www.fast-downward.org/latest/files/release24.06/fast-downward-24.06.1.tar.gz"
)

POPF2_REPO = "https://github.com/Minstoll/popf2.git"
VAL_REPO = "https://github.com/KCL-Planning/VAL.git"
UVAL_REPO = "https://github.com/aig-upf/universal-planning-validator.git"


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
    if platform.system() != "Linux":
        raise RuntimeError("bootstrap.py currently supports Linux only (per README instructions).")
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


def download_file(url: str, dest: Path) -> Path:
    """Download ``url`` into ``dest``."""

    ensure_directory(dest.parent)
    print(f"Downloading {url} -> {dest}")
    with urlopen(url) as response, dest.open("wb") as fh:  # type: ignore[arg-type]
        shutil.copyfileobj(response, fh)
    return dest


def extract_tarball(archive: Path, destination: Path) -> None:
    """Extract a .tar.gz archive into ``destination``."""

    print(f"Extracting {archive} into {destination}")
    with tarfile.open(archive, "r:gz") as tar:
        tar.extractall(path=destination)


def build_fast_downward() -> Path:
    """Download and build the Fast Downward release referenced in the README."""

    target_dir = SOLVERS_DIR / FAST_DOWNWARD_RELEASE
    archive_path = SOLVERS_DIR / FAST_DOWNWARD_ARCHIVE

    if not target_dir.exists():
        download_file(FAST_DOWNWARD_URL, archive_path)
        extract_tarball(archive_path, SOLVERS_DIR)
        archive_path.unlink(missing_ok=True)
    else:
        print(f"Fast Downward release already present at {target_dir}, skipping download.")

    build_script = target_dir / "build.py"
    if not build_script.exists():
        raise FileNotFoundError(f"Fast Downward build script not found in {target_dir}")

    print("Building Fast Downward ...")
    run([str(sys.executable), "build.py"], cwd=target_dir)

    solver_path = target_dir / "fast-downward.py"
    if not solver_path.exists():
        raise FileNotFoundError(f"{solver_path} missing after Fast Downward build.")
    solver_path.chmod(solver_path.stat().st_mode | 0o111)
    return solver_path


def detect_compiler(*candidates: str, default: str) -> str:
    """Return the first compiler available on PATH from ``candidates`` (or ``default``)."""

    for candidate in candidates:
        if shutil.which(candidate):
            return candidate
    return default


def build_popf2() -> Path:
    """Download and build POPF2 from the Minstoll fork."""

    target_dir = SOLVERS_DIR / "popf2"
    clone_or_update(POPF2_REPO, target_dir)

    build_script = target_dir / "build"
    if not build_script.exists():
        raise FileNotFoundError(f"POPF2 build script not found in {target_dir}")
    build_script.chmod(build_script.stat().st_mode | 0o111)

    env = os.environ.copy()
    env.setdefault("CC", detect_compiler("gcc-11", "gcc-12", default="gcc"))
    env.setdefault("CXX", detect_compiler("g++-11", "g++-12", default="g++"))

    print("Building POPF2 ...")
    run([str(build_script)], cwd=target_dir, env=env)

    binary = target_dir / "compile" / "popf2" / "popf3-clp"
    if not binary.exists():
        raise FileNotFoundError("POPF2 binary not found after build.")
    binary.chmod(binary.stat().st_mode | 0o111)
    return binary


def prepare_val() -> Tuple[Path, Path]:
    """Return the directory + Validate binary for VAL (use manual install if present)."""

    manual_dir = SOLVERS_DIR / "Val-20211204.1-Linux" / "bin"
    manual_validate = manual_dir / "Validate"
    if manual_validate.exists():
        manual_validate.chmod(manual_validate.stat().st_mode | 0o111)
        return manual_dir, manual_validate

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
    return build_dir, validate_bin


def build_uval() -> Tuple[Path, Path]:
    """Download and build the universal planning validator."""

    target_dir = SOLVERS_DIR / "universal-planning-validator"
    clone_or_update(UVAL_REPO, target_dir)

    build_script = target_dir / "build.sh"
    if not build_script.exists():
        raise FileNotFoundError(f"build.sh not found in {target_dir}")
    build_script.chmod(build_script.stat().st_mode | 0o111)

    print("Building Universal Planning Validator ...")
    run([str(build_script)], cwd=target_dir)

    validator_bin = target_dir / "validator" / "validate.bin"
    if not validator_bin.exists():
        raise FileNotFoundError("uVAL validator binary not found after build.")

    validator_bin.chmod(validator_bin.stat().st_mode | 0o111)
    return target_dir, validator_bin


def update_config(path_map: dict[str, str]) -> None:
    """Inject solver / validator paths into config.json."""

    config: dict[str, object] = {}
    if CONFIG_FILE.exists():
        config = json.loads(CONFIG_FILE.read_text())

    config.update(path_map)

    CONFIG_FILE.write_text(json.dumps(config, indent=4))
    print(f"Configuration updated at {CONFIG_FILE}")


def bootstrap() -> None:
    """Run the full bootstrap pipeline."""

    print("=== Bootstrapping MultiAgentPlanning ===")
    ensure_virtualenv()
    ensure_directory(SOLVERS_DIR)

    fast_downward = build_fast_downward()
    popf2 = build_popf2()
    val_dir, val_bin = prepare_val()
    uval_dir, uval_bin = build_uval()

    update_config(
        {
            "project_root": str(PROJECT_ROOT),
            "package_folder": str(SRC_DIR),
            "solver_fd_binary": str(fast_downward),
            "solver_popf2_binary": str(popf2),
            "validator": str(val_dir),
            "validator_bin": str(val_bin),
            "universal_validator": str(uval_dir),
            "universal_validator_bin": str(uval_bin),
            "python_venv": str(VENV_DIR),
        }
    )
    print("✅ Setup complete")


if __name__ == "__main__":
    try:
        bootstrap()
    except subprocess.CalledProcessError as exc:
        print(f"Bootstrap failed with return code {exc.returncode}")
        sys.exit(exc.returncode)
