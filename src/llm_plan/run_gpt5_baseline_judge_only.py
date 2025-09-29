"""Batch judging pipeline (lenient) driven by GPT-5 models via LangChain.

This script
1. loads previously generated plans from baseline folders (per variant),
2. asks a fresh GPT-5 Mini instance (medium reasoning effort) to JUDGE ONLY,
3. appends batched evaluation summaries (lenient) to judge_report_lenient.txt.

Folder structure (unchanged from the planning version):
- Domain PDDLs (per-variant):
    numtemp_test/datasets_pddl/domains/{dep|sat}_{variant}_domain.pddl
- PDDL problems:
    numtemp_test/datasets_pddl/depots_instances/{variant}/<instance_id>(.pddl)
    numtemp_test/datasets_pddl/satellite_instances/{variant}/<instance_id>(.pddl)
- Plans (already generated):
    numtemp_test/baseline/depots/{variant}_<instance_id>_plan.txt
    numtemp_test/baseline/satellite/{variant}_<instance_id>_plan.txt
- Outputs (summaries):
    numtemp_test/baseline/depots/judge_report_lenient.txt
    numtemp_test/baseline/satellite/judge_report_lenient.txt
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
from typing import Any, Dict, Iterable, List

from langchain_core.messages import HumanMessage, SystemMessage
from langchain_openai import ChatOpenAI

REPO_ROOT = Path(__file__).resolve().parents[3]
PROJECT_ROOT = Path(__file__).resolve().parents[2]

load_dotenv(PROJECT_ROOT / ".env")
if not os.getenv("OPENAI_API_KEY"):
    key_file = REPO_ROOT / "openai_key.txt"
    if key_file.exists():
        os.environ["OPENAI_API_KEY"] = key_file.read_text(encoding="utf-8").strip()

BASE_DIR = Path(__file__).resolve().parents[2] / "numtemp_test"
VARIANTS = ["str", "n", "st", "t"]

# --- Lenient judge prompt ---
JUDGE_SYSTEM_PROMPT = (
    "You are a meticulous PDDL plan validator. Decide if the given plan "
    "satisfies the domain and problem. The action names and order of arguments "
    "don't need to match the PDDL exactly, but everything needs to be internally "
    "consistent and achieve the same goal. You can imagine that the plan is "
    "produced from a different PDDL specification based on the same problem, and "
    "your task is to check if it is essentially correct up to naming and variable "
    "ordering. Assume no prior conversation. You might want to repeat to yourself "
    "the current state of certain aspects of the environment after each action to keep track."
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
    """Resolve the problem file; try bare name and common .pddl extensions."""
    candidates = [
        problem_dir / instance_id,
        problem_dir / f"{instance_id}.pddl",
        problem_dir / f"{instance_id}.PDDL",
    ]
    for p in candidates:
        if p.exists():
            return p
    return None


def _parse_instance_id_from_plan(plan_path: Path, expected_variant: str) -> str:
    """
    From a filename like 'str_foo123_plan.txt' extract 'foo123'.
    Falls back to removing a trailing '_plan' then stripping '<variant>_' prefix.
    """
    stem = plan_path.stem  # e.g., 'str_foo123_plan'
    if stem.endswith("_plan"):
        stem = stem[: -len("_plan")]
    # Prefer pattern '<variant>_<id>'
    prefix = f"{expected_variant}_"
    if stem.startswith(prefix):
        return stem[len(prefix) :]
    # Generic: capture the last '_' separated chunk after removing optional variant
    m = re.match(r"^[^_]+_(.+)$", stem)
    return m.group(1) if m else stem


def judge_only_instance(
    domain_text: str,
    problem_text: str,
    plan_path: Path,
) -> InstanceResult:
    instance_id = plan_path.stem
    if instance_id.endswith("_plan"):
        instance_id = instance_id[: -len("_plan")]
    # Keep only the id part for readability in logs
    m = re.match(r"^[^_]+_(.+)$", instance_id)
    if m:
        instance_id = m.group(1)

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


def run_batches() -> None:
    domain_configs = {
        "depots": {
            # kept for reference; NL not used in judge-only mode
            "nl_root": BASE_DIR / "datasets_nl" / "depots",
            "domain_prefix": "dep",
            "problem_root": BASE_DIR / "datasets_pddl" / "depots_instances",
            "plan_dir": BASE_DIR / "baseline" / "depots",
            "summary_file": BASE_DIR
            / "baseline"
            / "depots"
            / "judge_report_lenient.txt",
        },
        "satellite": {
            "nl_root": BASE_DIR / "datasets_nl" / "satellite",
            "domain_prefix": "sat",
            "problem_root": BASE_DIR / "datasets_pddl" / "satellite_instances",
            "plan_dir": BASE_DIR / "baseline" / "satellite",
            "summary_file": BASE_DIR
            / "baseline"
            / "satellite"
            / "judge_report_lenient.txt",
        },
    }

    for domain_key in ("depots", "satellite"):
        config = domain_configs[domain_key]
        domain_prefix = config["domain_prefix"]
        plan_dir = config["plan_dir"]
        summary_path = config["summary_file"]
        plan_dir.mkdir(parents=True, exist_ok=True)

        for variant in VARIANTS:
            domain_path = (
                BASE_DIR
                / "datasets_pddl"
                / "domains"
                / f"{domain_prefix}_{variant}_domain.pddl"
            )
            if not domain_path.exists():
                print(
                    f"Domain file missing for {domain_key} variant {variant}: {domain_path}"
                )
                continue
            domain_text = _read_text(domain_path)

            # Judge ONLY: read pre-generated plans for this variant
            plan_files = sorted(plan_dir.glob(f"{variant}_*_plan.txt"))
            if not plan_files:
                print(
                    f"No pre-generated plans found for {domain_key} variant {variant} in {plan_dir}; skipping batch."
                )
                continue

            problem_dir = config["problem_root"] / variant

            print(f"Judging only: {domain_key} / {variant} ({len(plan_files)} plans)")
            results: List[InstanceResult] = []
            with ThreadPoolExecutor(max_workers=min(5, len(plan_files))) as executor:
                future_map = {}
                for plan_path in plan_files:
                    instance_id = _parse_instance_id_from_plan(plan_path, variant)
                    problem_path = _find_problem_file(problem_dir, instance_id)
                    if problem_path is None:
                        print(
                            f"  Missing problem file for instance {instance_id}; marking as failure."
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
                                    f"Tried: {problem_dir / instance_id}, "
                                    f"{problem_dir / (instance_id + '.pddl')}"
                                ],
                            )
                        )
                        continue

                    problem_text = _read_text(problem_path)
                    future = executor.submit(
                        judge_only_instance,
                        domain_text,
                        problem_text,
                        plan_path,
                    )
                    future_map[future] = instance_id

                for future in as_completed(future_map):
                    instance_id = future_map[future]
                    try:
                        result = future.result()
                    except Exception as exc:
                        print(f"  ERROR - {instance_id}: {exc}")
                        results.append(
                            InstanceResult(
                                instance_id=instance_id,
                                plan_path=plan_dir
                                / f"{variant}_{instance_id}_plan.txt",
                                plan_text="",
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

            append_summary(summary_path, variant, results)


if __name__ == "__main__":
    run_batches()
