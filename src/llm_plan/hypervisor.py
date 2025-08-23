"""
This class implements a hypervisor, a piece of software that mixes neural (LLMs, etc.)
and formal techniques (VAL, uVal, etc.) to mitigate the issues of multi-agent planning.
The issues that we reckon are relevant in this context are:
- Hallucinations
- Asynchronicity
- Validity
- Optimality
- Partial observability

This class implements methods to check if:
- The plans (final and intermediate) are valid, executable and optimal.
- The final plan leverages asynchrnicity.
- The observations induce hallucinations in the final plan.
- The plans reflects the human specification.
- ...
"""

from abc import ABC, abstractmethod


class Hypervisor(ABC):
    def __init__(self, name: str):
        """Initialize the hypervisor with a name."""
        self.name = name

    def run(self, src: str) -> str:
        """
        Run the hypervisor on the given plan.
        Each subclass will use this method to mitigate a specific issue.

        Input:
            src (str): The source to be processed. Can be a plan or some generic text.
        """
        return "This function should be implemented by subclasses."


class HypervisorHallucinations(Hypervisor):
    def __init__(self):
        """Initialize the hypervisor for hallucinations detection."""
        super().__init__(name="HypervisorHallucinations")

    def detect_hallucinations(self, src: str) -> bool:
        """Detect hallucinations in the given plan."""
        return True

    def run(self, src: str) -> str:
        """
        Run the hypervisor to detect hallucinations in the plan.

        Input:
            src (str): The plan to be checked for hallucinations.

        Output:
            str: A message indicating whether hallucinations were detected.
        """
        if self.detect_hallucinations(src):
            return "Hallucinations detected in the plan."
        else:
            return "No hallucinations detected in the plan."
