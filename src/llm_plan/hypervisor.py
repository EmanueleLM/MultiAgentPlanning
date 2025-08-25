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
    def __init__(self, llm: LLM, threshold: int = 3):
        """
        Initialize the hypervisor for hallucinations detection.

        Input:
            llm (LLM): The language model to use for detecting and mitigating hallucinations.
            threshold (int): The severity threshold above which a hallucination is considered critical.
        """
        super().__init__(name="HypervisorHallucinations")
        self.llm = llm
        self.threshold = threshold

        # Prompts
        # TODO: split logic and data
        self.system_prompt_detect = textwrap.dedent("""
                                                    You are a hypervisor that detects hallucinations. 
                                                    Your task is to analyze a provided plan and its assumptions
                                                    and detect any hallucinations or inconsistencies.
                                                    """).strip()
        self.prompt_detect = textwrap.dedent("""
                                             Analyze the following plan and detect any hallucinations: 
                                             \n{plan}\n
                                             For any potential hallucination, return a description of it and its 
                                             severity, from 1 (low) to 5 (high).
                                             """).strip()

        self.system_prompt = textwrap.dedent("""
                                             You are a hypervisor that mitigates hallucinations. 
                                             Your task is to analyze a provided plan and a list of hallucinations, 
                                             each flagged with a severity score, from 1 (low) to 5 (high), 
                                             and solve them.
                                             """).strip()
        self.prompt = textwrap.dedent("""
                                      Given this plan:
                                      \n{plan}\n
                                      And this list of hallucinations and their severity scores 
                                      (from 1 (low) to 5 (high)):
                                      \n{hallucinations}\n
                                      Return a plan where all the hallucinations whose severity 
                                      is at least {threshold} have been solved or removed.
                                      """).strip()

    def detect_hallucinations(self, src: str) -> str:
        """
        Detect hallucinations in the given plan.

        Input:
            src (str): The plan to be checked for hallucinations.

        Output:
            str: A free-form text with all the hallucinations the model could find.
        """
        hallucinations = self.llm.generate_sync(
            system_prompt=self.system_prompt_detect,
            prompt=self.prompt_detect.format(plan=src),
        )
        return hallucinations

    def run(self, src: str) -> str:
        """
        Run the hypervisor to solve hallucinations in the plan.

        Input:
            src (str): The plan to be fixed for hallucinations.

        Output:
            str: The fixed plan.
        """
        hallucinations = self.detect_hallucinations(src)
        response = self.llm.generate_sync(
            system_prompt=self.system_prompt,
            prompt=self.prompt.format(
                hallucinations=hallucinations, threshold=self.threshold, plan=src
            ),
        )
        return response
