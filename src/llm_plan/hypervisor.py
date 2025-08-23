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

import textwrap
from abc import ABC, abstractmethod

from src.llm_plan.llm import LLM


class Hypervisor(ABC):
    def __init__(self, name: str):
        """Initialize the hypervisor with a name."""
        self.name = name

    @abstractmethod
    def run(self, src: str) -> str:
        """
        Run the hypervisor on the given plan.
        Each subclass will use this method to mitigate a specific issue.

        Input:
            src (str): The source to be processed. Can be a plan or some generic text.
        """
        return "This function should be implemented by subclasses."


class HypervisorHallucinations(Hypervisor):
    def __init__(self, llm: LLM):
        """Initialize the hypervisor for hallucinations detection."""
        super().__init__(name="HypervisorHallucinations")
        self.llm = llm
        self.system_prompt = textwrap.dedent("""You are a hypervisor that detects hallucinations. 
                                             Your task is to analyze the provided plan and determine if it 
                                             contains any hallucinations or inconsistencies.""").strip()
        self.prompt = textwrap.dedent("""Analyze the following information and detect any hallucinations: 
                                      {src}
                                      For any potential hallucination, return a description of it and its 
                                      severity, from 1 (low) to 5 (high).""").strip()

    def detect_hallucinations(self, src: str) -> str:
        """Detect hallucinations in the given plan."""
        hallucinations = self.llm.generate_sync(
            system_prompt=self.system_prompt, prompt=self.prompt.format(src=src)
        )
        return hallucinations

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
