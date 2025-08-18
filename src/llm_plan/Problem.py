from abc import ABC
from typing import List

from src.llm_plan.environment import Environment


class Problem(ABC):
    """
    Abstract base class for problems.
    Classes that extend Problem should define the specific problem to be solved.
    TODO: add methods that are mandatory for any subclasses.
    """

    def __init__(self, name: str):
        self.name = name
        self.environment: Environment
        self.system_prompts: dict[str, str]
        self.prompts: dict[str, str]

    # Collect information from the environment and format it
    def format_info(self, info: List | str) -> str:
        if isinstance(info, List):
            return "\n".join(info) + "\n"
        return str(info) + "\n"
