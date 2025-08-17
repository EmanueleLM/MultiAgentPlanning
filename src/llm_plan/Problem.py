from abc import ABC
from typing import List


class Problem(ABC):
    """
    Abstract base class for problems.
    Classes that extend Problem should define the specific problem to be solved.
    TODO: add methods that are mandatory for any subclasses.
    """

    # Collect information from the environment and format it
    def format_info(self, info: List | str) -> str:
        if isinstance(info, List):
            return "\n".join(info) + "\n"
        return str(info) + "\n"
