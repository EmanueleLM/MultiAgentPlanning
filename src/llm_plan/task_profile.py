from __future__ import annotations

import json
import re
from typing import Any


def _parse_specification(specification: str | dict[str, Any] | None) -> dict[str, Any] | None:
    if specification is None:
        return None
    if isinstance(specification, dict):
        return specification
    try:
        return json.loads(specification)
    except (json.JSONDecodeError, TypeError):
        return None


def _flatten_text(value: Any) -> str:
    if value is None:
        return ""
    if isinstance(value, str):
        return value
    if isinstance(value, (int, float, bool)):
        return str(value)
    if isinstance(value, dict):
        return " ".join(_flatten_text(v) for v in value.values())
    if isinstance(value, list):
        return " ".join(_flatten_text(v) for v in value)
    return str(value)


def _extract_problem_name(specification: dict[str, Any] | None) -> str:
    if not specification:
        return ""
    return str(specification.get("name", ""))


def _detect_problem_signals(text: str) -> list[str]:
    lower = text.lower()
    signals: list[str] = []

    signal_rules = [
        (
            "explicit temporal constraints",
            r"\b(time|timeslot|slot|window|schedule|duration|minute|minutes|hour|hours|day|days|arrival|departure|availability)\b",
        ),
        (
            "movement or routing constraints",
            r"\b(travel|route|move|flight|flights|drive|driving|location|locations|from|to|city|cities|visit)\b",
        ),
        (
            "resource allocation constraints",
            r"\b(resource|participant|participants|vehicle|vehicles|package|packages|tray|trays|robot|robots)\b",
        ),
        (
            "stacking or support relations",
            r"\b(stack|stacking|block|blocks|tower|peg|disk|clear|on top|table)\b",
        ),
        (
            "grid or adjacency structure",
            r"\b(grid|tile|tiles|adjacent|adjacency|up|down|left|right|paint|color)\b",
        ),
        (
            "symbolic operator descriptions",
            r"\b(precondition|preconditions|effect|effects|action|actions|operator|operators)\b",
        ),
        (
            "possibly obfuscated symbol names",
            r"\b(object_[0-9]+|stage_[0-9]+|content[0-9]+|bread[0-9]+)\b",
        ),
        (
            "hard goal conditions",
            r"\b(goal|must|required|exactly|at least|at most|minimum|maximum|only)\b",
        ),
    ]

    for signal_name, pattern in signal_rules:
        if re.search(pattern, lower):
            signals.append(signal_name)

    if not signals:
        signals.append("generic classical planning structure")

    return signals


def _infer_problem_style(signals: list[str]) -> str:
    joined = " | ".join(signals)
    if "explicit temporal constraints" in joined and "movement or routing constraints" in joined:
        return "temporal planning with routing and feasibility constraints"
    if "explicit temporal constraints" in joined:
        return "temporal/resource coordination in classical planning form"
    if "symbolic operator descriptions" in joined and "possibly obfuscated symbol names" in joined:
        return "schema induction from grounded symbolic descriptions"
    if "grid or adjacency structure" in joined:
        return "spatial traversal and local state transformation"
    if "stacking or support relations" in joined:
        return "symbolic manipulation with structural support constraints"
    if "movement or routing constraints" in joined:
        return "transport or routing with state transitions"
    return "generic typed classical planning"


def _build_modeling_directives(signals: list[str]) -> list[str]:
    directives = [
        "Infer objects, types, predicates, and actions only from the problem statement and the available structured inputs.",
        "Prefer a small, explicit classical model over a broad or clever one.",
        "Make hard constraints structural in the PDDL instead of relying on rewards, penalties, or post-hoc bookkeeping.",
        "Keep the domain and problem fully specific to this instance.",
    ]

    joined = " | ".join(signals)
    if "explicit temporal constraints" in joined:
        directives.append(
            "If the task implies time or duration, encode it using ordered symbolic stages or time objects rather than unsupported numeric or durative features."
        )
    if "movement or routing constraints" in joined:
        directives.append(
            "Model connectivity and movement preconditions explicitly; do not invent missing routes or transitions."
        )
    if "resource allocation constraints" in joined:
        directives.append(
            "Make resource exclusivity and capacity constraints explicit in predicates and action preconditions."
        )
    if "symbolic operator descriptions" in joined:
        directives.append(
            "If the input describes actions through preconditions and effects, reproduce those semantics faithfully in the action schemas."
        )

    return directives


def _build_forbidden_shortcuts(signals: list[str]) -> list[str]:
    shortcuts = [
        "Do not invent objects, routes, resources, or goals that are not grounded in the input problem.",
        "Do not silently relax contradictory constraints just to make the problem solvable.",
        "Do not leave placeholders such as '...', 'None', or 'TBD' in the final artifacts.",
    ]

    if "explicit temporal constraints" in " | ".join(signals):
        shortcuts.append(
            "Do not replace durations, windows, or contiguity constraints with quota tokens, penalties, or optional clean-up actions."
        )

    return shortcuts


def _render_profile_prompt(profile: dict[str, Any]) -> str:
    def render_list(items: list[str]) -> str:
        return "\n".join(f"- {item}" for item in items)

    sections = [
        f"Problem style hypothesis: {profile['problem_style']}",
        "Observed signals:\n" + render_list(profile["observed_signals"]),
        "Modeling directives:\n" + render_list(profile["modeling_directives"]),
        "Forbidden shortcuts:\n" + render_list(profile["forbidden_shortcuts"]),
        "Canonicalization rules:\n" + render_list(profile["canonicalization_rules"]),
        "Solver rules:\n" + render_list(profile["solver_rules"]),
    ]

    if profile["problem_name"]:
        sections.insert(0, f"Problem name: {profile['problem_name']}")

    return "\n\n".join(sections)


def infer_task_profile(
    human_specification: str,
    dataset_hint: str = "",
    specification: str | dict[str, Any] | None = None,
    target_solver: str = "FastDownwards",
) -> dict[str, Any]:
    parsed_spec = _parse_specification(specification)
    problem_name = _extract_problem_name(parsed_spec)

    observed_text = " ".join(
        part
        for part in [
            human_specification,
            _flatten_text(parsed_spec),
            dataset_hint if dataset_hint and "/" not in dataset_hint else "",
        ]
        if part
    )
    observed_signals = _detect_problem_signals(observed_text)
    problem_style = _infer_problem_style(observed_signals)

    profile = {
        "problem_name": problem_name,
        "problem_style": problem_style,
        "observed_signals": observed_signals,
        "modeling_directives": _build_modeling_directives(observed_signals),
        "forbidden_shortcuts": _build_forbidden_shortcuts(observed_signals),
        "canonicalization_rules": [
            "Use lowercase ASCII identifiers with underscores for symbols whenever you introduce canonical names.",
            "Preserve object identity exactly; do not alias two entities unless the problem explicitly states they are the same.",
            "Use the same symbol consistently across objects, predicates, actions, init, and goal.",
        ],
        "solver_rules": [
            f"Target solver: {target_solver}. Stay within classical PDDL features supported by the solver.",
            "Prefer :strips, :typing, and :negative-preconditions only; keep :action-costs only when explicit increase effects are actually used.",
            "Do not use numeric fluents, durative actions, axioms, conditional effects, or unsupported comparison operators.",
        ],
        "domain_reference": "",
    }
    profile["task_profile_prompt"] = _render_profile_prompt(profile)
    return profile
