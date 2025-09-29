"""Batch judging pipeline (lenient) driven by GPT-5 models via LangChain.

This script
1. loads previously generated plans from baseline folders,
2. asks a fresh GPT-5 Mini instance (medium reasoning effort) to JUDGE ONLY,
3. appends batched evaluation summaries (lenient) to judge_report_lenient.txt.

Updated folder structure (no per-variant subfolders):
- Judge domain PDDLs (fixed 'str' domains):
    numtemp_complexity_test/domains/dep_str_domain.pddl
    numtemp_complexity_test/domains/sat_str_domain.pddl
- PDDL problems:
    numtemp_complexity_test/datasets_pddl/depots
    numtemp_complexity_test/datasets_pddl/satellite
- Plans (already generated):
    numtemp_complexity_test/baseline/depot/*.txt   (preferred)
    numtemp_complexity_test/baseline/satellite/*.txt
  (If depot plans are under baseline/depots, we still read them.)
- Outputs (summaries):
    numtemp_complexity_test/baseline/depots/judge_report_lenient.txt
    numtemp_complexity_test/baseline/satellite/judge_report_lenient.txt
"""

from __future__ import annotations

import os
import json
import re
from concurrent.futures import ThreadPoolExecutor, as_completed
from dataclasses import dataclass
from datetime import datetime
from pathlib import Path
from dotenv import load_dotenv
from typing import Any, Dict, Iterable, List, Tuple

from langchain_core.messages import HumanMessage, SystemMessage
from langchain_openai import ChatOpenAI

REPO_ROOT = Path(__file__).resolve().parents[3]
PROJECT_ROOT = Path(__file__).resolve().parents[2]

load_dotenv(PROJECT_ROOT / ".env")
if not os.getenv("OPENAI_API_KEY"):
    key_file = REPO_ROOT / "openai_key.txt"
    if key_file.exists():
        os.environ["OPENAI_API_KEY"] = key_file.read_text(encoding="utf-8").strip()

# Base directory (per your new layout)
BASE_DIR = Path(__file__).resolve().parents[2] / "numtemp_complexity_test"

# We retain the logical variant label for filenames/summaries.
VARIANT = "str"

# --- Lenient judge prompt (as provided) ---
JUDGE_SYSTEM_PROMPT = (
    "You are a meticulous PDDL plan validator. Decide if the given plan"
    "satisfies the domain and problem. The action names and order of arguments don't need to match the PDDL exactly, but everything needs to be internally consistent and achieve the same goal. You can imagine that the plan is produced from a different PDDL specification based on the same problem, and your task is to check if it is essentially correct up to naming and variable ordering. Assume no prior conversation. You might want to repeat to yourself the current state of certain aspects of the environment after each action to keep track."
)
JUDGE_USER_TEMPLATE = """Evaluate whether the colleague's plan reaches the goal without violating preconditions or effects. If any step is wrong or missing, mark it invalid. Respond as strict JSON with boolean field "is_valid", a short "verdict" string, and optional "issues" list.

Domain PDDL (verbatim):
{domain_pddl}

Problem PDDL (verbatim):
{problem_pddl}

Candidate plan:
{plan}
"""


@dataclass
class InstanceResult:
    instance_id: str
    plan_path: Path
    plan_text: str
    judge_raw: str
    is_valid: bool
    verdict: str
    issues: List[str]
    error: str | None = None


def create_judge() -> ChatOpenAI:
    """Return a fresh judge LLM constrained to JSON output."""
    return ChatOpenAI(
        model="gpt-5-mini",
        reasoning={"effort": "medium"},
        model_kwargs={"response_format": {"type": "json_object"}},
    )


def message_text(ai_message: Any) -> str:
    """Extract text content from a LangChain message."""
    content = ai_message.content
    if isinstance(content, str):
        return content
    if isinstance(content, list):
        return "".join(
            part.get("text", "") if isinstance(part, dict) else str(part)
            for part in content
        )
    return str(content)


def _read_text(path: Path) -> str:
    return path.read_text(encoding="utf-8")


def _find_problem_file(problem_dir: Path, instance_id: str) -> Path | None:
    """Resolve the problem file for an instance (try common patterns)."""
    candidates = [
        problem_dir / instance_id,
        problem_dir / f"{instance_id}.pddl",
        problem_dir / f"{instance_id}.PDDL",
    ]
    for p in candidates:
        if p.exists():
            return p
    return None


def _parse_instance_from_plan_filename(plan_path: Path) -> Tuple[str, str]:
    """
    From a filename like 'str_foo123_plan.txt' extract (variant, instance_id) -> ('str', 'foo123').
    Falls back gracefully if the pattern isn't exact.
    """
    name = plan_path.stem  # e.g., 'str_foo123_plan'
    # Strip trailing '_plan'
    if name.endswith("_plan"):
        name = name[:-5]
    # Try variant_prefix + '_' + instance_id
    m = re.match(r"^(?P<variant>[^_]+)_(?P<id>.+)$", name)
    if m:
        return m.group("variant"), m.group("id")
    # Fallback: assume whole thing is the id; use default variant
    return VARIANT, name


def judge_only_instance(
    domain_key: str,
    variant: str,
    plan_path: Path,
    domain_text: str,
    problem_text: str,
) -> InstanceResult:
    instance_variant, instance_id = _parse_instance_from_plan_filename(plan_path)
    # Prefer parsed variant but keep provided variant if missing
    variant = instance_variant or variant

    if not plan_path.exists():
        return InstanceResult(
            instance_id=instance_id,
            plan_path=plan_path,
            plan_text="",
            judge_raw="",
            is_valid=False,
            verdict="Missing plan file",
            issues=[f"Expected plan file {plan_path} not found."],
        )

    plan_text = _read_text(plan_path).strip()

    judge = create_judge()
    judge_messages = [
        SystemMessage(content=JUDGE_SYSTEM_PROMPT),
        HumanMessage(
            content=JUDGE_USER_TEMPLATE.format(
                domain_pddl=domain_text,
                problem_pddl=problem_text,
                plan=plan_text,
            ).strip()
        ),
    ]
    judge_reply = judge.invoke(judge_messages)
    judge_text = message_text(judge_reply)

    try:
        judge_payload: Dict[str, Any] = json.loads(judge_text)
    except json.JSONDecodeError as exc:
        return InstanceResult(
            instance_id=instance_id,
            plan_path=plan_path,
            plan_text=plan_text,
            judge_raw=judge_text,
            is_valid=False,
            verdict="Malformed JSON from judge",
            issues=[f"JSON parse error: {exc}"],
        )

    is_valid = bool(judge_payload.get("is_valid"))
    verdict = str(judge_payload.get("verdict", "")) or (
        "valid" if is_valid else "invalid"
    )
    issues_field = judge_payload.get("issues", [])
    if isinstance(issues_field, list):
        issues = [str(item) for item in issues_field]
    elif issues_field:
        issues = [str(issues_field)]
    else:
        issues = []

    return InstanceResult(
        instance_id=instance_id,
        plan_path=plan_path,
        plan_text=plan_text,
        judge_raw=judge_text,
        is_valid=is_valid,
        verdict=verdict,
        issues=issues,
    )


def append_summary(
    summary_path: Path, variant: str, results: Iterable[InstanceResult]
) -> None:
    results_list = list(results)
    success_ids = [r.instance_id for r in results_list if r.is_valid]
    failure_entries = [r for r in results_list if not r.is_valid]

    header_needed = not summary_path.exists()
    summary_path.parent.mkdir(parents=True, exist_ok=True)
    timestamp = datetime.now().isoformat(timespec="seconds")
    with summary_path.open("a", encoding="utf-8") as stream:
        if header_needed:
            stream.write(f"Plan validation summary (lenient) generated {timestamp}\n\n")
        stream.write(f"=== Variant {variant} ===\n")
        stream.write(f"Timestamp: {timestamp}\n")
        stream.write(f"Successful plans: {len(success_ids)} / {len(results_list)}\n")
        stream.write(
            "Successful instances: "
            + (", ".join(success_ids) if success_ids else "None")
            + "\n"
        )
        if failure_entries:
            stream.write("Failed instances:\n")
            for failure in failure_entries:
                issues_summary = "; ".join(failure.issues)
                stream.write(f"- {failure.instance_id}: {failure.verdict}")
                if issues_summary:
                    stream.write(f" | Issues: {issues_summary}")
                stream.write("\n")
        else:
            stream.write("Failed instances: None\n")
        stream.write("\n")


def _first_existing(*paths: Path) -> Path | None:
    for p in paths:
        if p.exists():
            return p
    return None


def run_batches() -> None:
    # Config uses judge domains under BASE_DIR / 'domains' (primary),
    # but will fall back to BASE_DIR / 'datasets_pddl' / 'domains' if needed.
    domain_configs = {
        "depots": {
            "domain_primary": BASE_DIR
            / "datasets_pddl"
            / "domains"
            / "dep_str_domain.pddl",
            "problem_root": BASE_DIR / "datasets_pddl" / "depots",
            "plan_input_candidates": [BASE_DIR / "baseline" / "depots"],
            "summary_dir": BASE_DIR / "baseline" / "depots",
        },
        "satellite": {
            "domain_primary": BASE_DIR
            / "datasets_pddl"
            / "domains"
            / "sat_str_domain.pddl",
            "problem_root": BASE_DIR / "datasets_pddl" / "satellite",
            "plan_input_candidates": [
                BASE_DIR / "baseline" / "satellite",
            ],
            "summary_dir": BASE_DIR / "baseline" / "satellite",
        },
    }

    for domain_key in ("depots", "satellite"):
        cfg = domain_configs[domain_key]

        # Domain PDDL
        domain_path = cfg["domain_primary"]
        if not domain_path.exists():
            fb = cfg["domain_fallback"]
            if fb.exists():
                domain_path = fb
        if not domain_path.exists():
            print(
                f"[{domain_key}] Domain file missing: {cfg['domain_primary']} (and fallback {cfg['domain_fallback']})"
            )
            continue
        domain_text = _read_text(domain_path)

        # Plan input directory (choose the first that exists)
        plan_input_dir = _first_existing(*cfg["plan_input_candidates"])
        if plan_input_dir is None:
            print(
                f"[{domain_key}] No plan directory found among: {', '.join(map(str, cfg['plan_input_candidates']))}"
            )
            continue

        # Collect plan files
        plan_files = sorted(plan_input_dir.glob("*_plan.txt"))
        if not plan_files:
            print(
                f"[{domain_key}] No plan files found in {plan_input_dir}; nothing to judge."
            )
            continue

        # Problems root
        problem_root: Path = cfg["problem_root"]
        if not problem_root.exists():
            print(f"[{domain_key}] Problem root not found: {problem_root}")
            continue

        # Summary file path (lenient)
        summary_dir: Path = cfg["summary_dir"]
        summary_dir.mkdir(parents=True, exist_ok=True)
        summary_path = summary_dir / "judge_report_lenient.txt"

        print(
            f"[{domain_key}] Judging {len(plan_files)} pre-generated plans (variant={VARIANT})"
        )

        results: List[InstanceResult] = []
        with ThreadPoolExecutor(max_workers=min(5, len(plan_files))) as executor:
            future_map = {}
            for plan_path in plan_files:
                _, instance_id = _parse_instance_from_plan_filename(plan_path)
                problem_path = _find_problem_file(problem_root, instance_id)
                if problem_path is None:
                    print(
                        f"  Missing problem for instance {instance_id}; marking as failure."
                    )
                    results.append(
                        InstanceResult(
                            instance_id=instance_id,
                            plan_path=plan_path,
                            plan_text=(
                                _read_text(plan_path) if plan_path.exists() else ""
                            ),
                            judge_raw="",
                            is_valid=False,
                            verdict="Missing PDDL problem file",
                            issues=[
                                f"Tried: {problem_root / instance_id}, "
                                f"{problem_root / (instance_id + '.pddl')}"
                            ],
                        )
                    )
                    continue

                problem_text = _read_text(problem_path)
                future = executor.submit(
                    judge_only_instance,
                    domain_key,
                    VARIANT,
                    plan_path,
                    domain_text,
                    problem_text,
                )
                future_map[future] = (plan_path, instance_id)

            for future in as_completed(future_map):
                plan_path, instance_id = future_map[future]
                try:
                    result = future.result()
                except Exception as exc:
                    print(f"  ERROR - {instance_id}: {exc}")
                    results.append(
                        InstanceResult(
                            instance_id=instance_id,
                            plan_path=plan_path,
                            plan_text=(
                                _read_text(plan_path) if plan_path.exists() else ""
                            ),
                            judge_raw="",
                            is_valid=False,
                            verdict="Unhandled exception during judging",
                            issues=[str(exc)],
                            error=str(exc),
                        )
                    )
                else:
                    results.append(result)
                    status = "PASS" if result.is_valid else "FAIL"
                    print(f"  {status} - {instance_id}: {result.verdict}")

        append_summary(summary_path, VARIANT, results)


if __name__ == "__main__":
    run_batches()
