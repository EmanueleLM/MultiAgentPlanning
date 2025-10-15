from __future__ import annotations

import atexit
import logging
import threading
import time
import uuid
import re
import sys
from datetime import datetime
from pathlib import Path
from typing import Any

from flask import Flask, jsonify, render_template, request

# Ensure repository root is on the Python path when running via `python webapp/app.py`.
REPO_ROOT = Path(__file__).resolve().parent.parent
if str(REPO_ROOT) not in sys.path:
    sys.path.insert(0, str(REPO_ROOT))

from plan_single import MODELS, RESULTS_ROOT, SOLVER, run_workflow

app = Flask(__name__)
app.config["SECRET_KEY"] = "multi-agent-planning-demo"

MODEL_OPTIONS = list(MODELS.keys())
SOLVER_OPTIONS = list(SOLVER.keys())
OPTIMIZE_OPTIONS = [
    ("True", "Yes, allow optimisation"),
    ("False", "No, keep it quick"),
]

DEFAULT_MODEL = "gpt-5-mini" if "gpt-5-mini" in MODEL_OPTIONS else MODEL_OPTIONS[0]
DEFAULT_SOLVER = (
    "FastDownwards" if "FastDownwards" in SOLVER_OPTIONS else SOLVER_OPTIONS[0]
)
DEFAULT_OPTIMISE = "False"
DEFAULT_BUDGET = 5

JOBS: dict[str, dict[str, Any]] = {}
JOBS_LOCK = threading.Lock()
ENV_PATH = REPO_ROOT / ".env"


def _make_environment_name(prompt: str) -> str:
    """Generate a readable PascalCase identifier from the prompt."""
    tokens = re.findall(r"[A-Za-z0-9]+", prompt)
    if not tokens:
        base = "Scenario"
    else:
        base = "".join(word.capitalize() for word in tokens[:4])
        base = base or "Scenario"
    suffix = datetime.utcnow().strftime("%Y%m%d%H%M%S")
    candidate = f"{base}{suffix}"
    return candidate[:60]


def _shutdown_models():
    """Attempt to gracefully close model clients when the app exits."""
    for model_cfg in MODELS.values():
        model = model_cfg.get("model")
        close_fn = getattr(model, "close", None) or getattr(model, "shutdown", None)
        if callable(close_fn):
            try:
                close_fn()
            except Exception:
                continue


atexit.register(_shutdown_models)


def _read_openai_api_key() -> str | None:
    if not ENV_PATH.exists():
        return None
    for line in ENV_PATH.read_text(encoding="utf-8").splitlines():
        if line.startswith("OPENAI_API_KEY="):
            return line[len("OPENAI_API_KEY=") :].strip()
    return None


def _write_openai_api_key(value: str) -> None:
    lines: list[str] = []
    found = False
    if ENV_PATH.exists():
        for line in ENV_PATH.read_text(encoding="utf-8").splitlines():
            if line.startswith("OPENAI_API_KEY="):
                lines.append(f"OPENAI_API_KEY={value}")
                found = True
            else:
                lines.append(line)
    if not found:
        lines.append(f"OPENAI_API_KEY={value}")
    ENV_PATH.write_text("\n".join(lines) + "\n", encoding="utf-8")


def _mask_key(key: str) -> str:
    if not key:
        return ""
    return "•" * min(len(key), 20)


def _read_artifacts(base_folder: Path) -> tuple[int, str, str, str]:
    if not base_folder or not base_folder.exists():
        return 0, "", "", ""

    def _latest(prefix: str) -> Path | None:
        candidates = sorted(base_folder.glob(f"{prefix}*.pddl"))
        return candidates[-1] if candidates else None

    domain_file = _latest("domain_") or base_folder / "domain_0.pddl"
    problem_file = _latest("problem_") or base_folder / "problem_0.pddl"

    iteration = 0
    if domain_file and domain_file.exists():
        match = re.search(r"_(\d+)\.pddl$", domain_file.name)
        if match:
            iteration = int(match.group(1))

    def _read_file(path: Path | None) -> str:
        if path and path.exists():
            try:
                return path.read_text(encoding="utf-8")
            except Exception:
                return ""
        return ""

    plan_candidates = sorted(base_folder.glob("sas_plan_*"))
    plan_file = plan_candidates[-1] if plan_candidates else None

    domain_content = _read_file(domain_file)
    problem_content = _read_file(problem_file)
    plan_content = _read_file(plan_file)

    return iteration, domain_content, problem_content, plan_content


@app.route("/", methods=["GET"])
def index():
    return render_template(
        "index.html",
        model_options=MODEL_OPTIONS,
        solver_options=SOLVER_OPTIONS,
        optimize_options=OPTIMIZE_OPTIONS,
        default_model_json=DEFAULT_MODEL,
        default_model_plan=DEFAULT_MODEL,
        default_target_solver=DEFAULT_SOLVER,
        default_optimize=DEFAULT_OPTIMISE,
        default_budget=DEFAULT_BUDGET,
    )


def _run_job(job_id: str, config: dict[str, Any]) -> None:
    prompt = config["prompt"]
    environment_name = config["environment_name"]
    model_json = config["model_json"]
    model_plan = config["model_plan"]
    target_solver = config["target_solver"]
    optimize_plan = config["optimize_plan"]
    budget = config["budget"]

    base_folder = RESULTS_ROOT / environment_name / target_solver
    logs_path = base_folder / "__full_logs.txt"
    logs_path.parent.mkdir(parents=True, exist_ok=True)
    if logs_path.exists():
        try:
            logs_path.unlink()
        except Exception:
            pass

    status = "running"
    summary: dict[str, Any] = {}

    try:
        summary = run_workflow(
            human_specification=prompt,
            environment_name=environment_name,
            model_json=model_json,
            model_plan=model_plan,
            target_solver=target_solver,
            optimize_plan=optimize_plan,
            budget=budget,
            debug=True,
        )
        status = "failed" if summary.get("error") else "completed"
    except Exception as exc:  # pragma: no cover
        status = "failed"
        summary = {"error": f"Unhandled error: {exc}"}

    summary.setdefault("base_folder", base_folder)
    summary.setdefault("logs_path", logs_path)

    with JOBS_LOCK:
        job = JOBS.get(job_id)
        if job is not None:
            job["status"] = status
            job["summary"] = summary
            job["logs_path"] = str(logs_path)
            job["completed_at"] = time.time()


@app.route("/start_run", methods=["POST"])
def start_run():
    payload = request.get_json(silent=True) or {}

    prompt = (payload.get("prompt") or "").strip()
    if not prompt:
        return jsonify({"error": "Prompt cannot be empty."}), 400

    model_json = payload.get("model_json") or DEFAULT_MODEL
    model_plan = payload.get("model_plan") or DEFAULT_MODEL
    target_solver = payload.get("target_solver") or DEFAULT_SOLVER
    optimize_plan = str(payload.get("optimize_plan", DEFAULT_OPTIMISE)) == "True"
    try:
        budget = max(1, int(payload.get("budget", DEFAULT_BUDGET)))
    except (TypeError, ValueError):
        budget = DEFAULT_BUDGET

    environment_name = _make_environment_name(prompt)
    base_folder = RESULTS_ROOT / environment_name / target_solver
    logs_path = base_folder / "__full_logs.txt"

    job_id = uuid.uuid4().hex
    job_config = {
        "prompt": prompt,
        "environment_name": environment_name,
        "model_json": model_json,
        "model_plan": model_plan,
        "target_solver": target_solver,
        "optimize_plan": optimize_plan,
        "budget": budget,
    }

    with JOBS_LOCK:
        JOBS[job_id] = {
            "status": "running",
            "created_at": time.time(),
            "logs_path": str(logs_path),
            "summary": None,
            "base_folder": str(base_folder),
            "total_budget": budget,
        }

    worker = threading.Thread(target=_run_job, args=(job_id, job_config), daemon=True)
    worker.start()

    return jsonify(
        {
            "job_id": job_id,
            "logs_path": str(logs_path),
            "iterations_completed": 0,
            "total_budget": budget,
        }
    )


def _read_logs(path: str) -> str:
    file_path = Path(path)
    if not file_path.exists():
        return ""
    try:
        content = file_path.read_text(encoding="utf-8")
        if len(content) > 20000:
            content = (
                content[-20000:]
                + "\n…\n[truncated; open the log file on disk to view everything]"
            )
        return content
    except Exception:
        return ""


@app.route("/logs/<job_id>", methods=["GET"])
def get_logs(job_id: str):
    with JOBS_LOCK:
        job = JOBS.get(job_id)
        if job is None:
            return jsonify({"error": "Unknown job id."}), 404
        job_data = dict(job)

    logs_text = _read_logs(job_data["logs_path"])
    base_folder = Path(job_data.get("base_folder", ""))
    latest_step, domain_content, problem_content, plan_content = _read_artifacts(base_folder)

    total_budget = max(1, int(job_data.get("total_budget", 1)))
    iterations_completed = min(latest_step, total_budget)

    response: dict[str, Any] = {
        "status": job_data["status"],
        "logs": logs_text,
        "iterations_completed": iterations_completed,
        "total_budget": total_budget,
        "artifacts": {
            "domain": domain_content,
            "problem": problem_content,
            "plan": plan_content,
        },
    }

    if job_data["summary"] is not None:
        summary = job_data["summary"]
        response["summary"] = {
            "natural_plan": summary.get("natural_plan"),
            "error": summary.get("error"),
            "base_folder": str(summary.get("base_folder", "")),
        }

    return jsonify(response)


@app.route("/clear", methods=["POST"])
def clear_jobs():
    with JOBS_LOCK:
        JOBS.clear()
    _shutdown_models()
    return jsonify({"status": "cleared"})


@app.route("/api_key", methods=["GET"])
def get_api_key():
    key = _read_openai_api_key()
    if key:
        return jsonify({"has_key": True, "masked": _mask_key(key)})
    return jsonify({"has_key": False, "masked": ""})


@app.route("/api_key", methods=["POST"])
def set_api_key():
    payload = request.get_json(silent=True) or {}
    key = (payload.get("openai_api_key") or "").strip()
    if not key:
        return jsonify({"error": "API key cannot be empty."}), 400
    _write_openai_api_key(key)
    return jsonify({"status": "saved", "masked": _mask_key(key)})


if __name__ == "__main__":
    logging.basicConfig(level=logging.DEBUG, format="%(asctime)s %(levelname)s %(message)s")
    app.logger.setLevel(logging.DEBUG)
    app.run(debug=True, host="0.0.0.0", port=5000, use_reloader=True)
