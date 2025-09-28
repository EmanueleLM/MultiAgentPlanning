from dotenv import load_dotenv

load_dotenv(".env")

from datetime import datetime
from pathlib import Path
import traceback
from langchain_core.messages import HumanMessage
from llm_plan.workflow import build_graph


FOLDER = Path("./numtemp_test/datasets_nl/depots/t")
ERROR_LOG = Path("./numtemp_test/error_log.txt")
g = build_graph().compile()


def log_error(exp_num: int, file_path: Path, exc: Exception) -> None:
    """Append details about a failed experiment to the error log."""
    ERROR_LOG.parent.mkdir(parents=True, exist_ok=True)
    timestamp = datetime.utcnow().isoformat()
    details = "".join(traceback.format_exception(type(exc), exc, exc.__traceback__))
    with ERROR_LOG.open("a", encoding="utf-8") as log_file:
        log_file.write(f"[{timestamp}] Experiment {exp_num} ({file_path.name}) failed.\n")
        log_file.write(details)
        if not details.endswith("\n"):
            log_file.write("\n")
        log_file.write("\n")


def run_one(file_path: Path, exp_num: int):
    initial_description = file_path.read_text(encoding="utf-8")

    initial_state = {
        "messages": [HumanMessage(content=initial_description)],
        "multi_agent": True,
        "mode": "direct",
        "refinement_iters": 10,
        "folder_name": f"depots_t_{exp_num}",
        "enable_clarifications": False,
        "WSL": True,
    }

    config = {
        "configurable": {"thread_id": f"dep_t_{exp_num}"},
        "recursion_limit": 100,
    }

    return g.invoke(initial_state, config=config)


def main():
    files = sorted([p for p in FOLDER.iterdir() if p.is_file()])

    for exp_num, file_path in enumerate(files, start=1):
        try:
            run_one(file_path, exp_num)
            print(f"Experiment {exp_num} complete.")
        except Exception as exc:
            log_error(exp_num, file_path, exc)
            print(
                f"Experiment {exp_num} failed for {file_path.name}. See {ERROR_LOG} for details."
            )


if __name__ == "__main__":
    main()
