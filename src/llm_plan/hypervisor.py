"""
This class implements a hypervisor, a piece of software that mixes neural (LLMs, etc.)
and formal techniques (VAL, uVal, etc.) to mitigate the issues of multi-agent planning.
The issues that we reckon are relevant in this context are:
- Correct PDDL syntax
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
    def __init__(
        self,
        prompt_args: dict[str, str],
    ):
        """Initialize the hypervisor with a name and the arguments."""
        self.name = "AbstractHypervisor"
        self.prompt_args = prompt_args
        self.required_args: dict[str, str] = {}

    def upload_args(self, prompt_args: dict[str, str]) -> None:
        """
        Upload the arguments to the hypervisor.

        Input:
            prompt_args (dict): A dictionary containing the arguments.
        """
        for arg in self.required_args.keys():
            if arg not in prompt_args:
                raise ValueError(f"Missing required argument: {arg}")
            self.prompt_args[arg] = prompt_args[arg]

    @abstractmethod
    def run(self) -> str:
        """
        Run the hypervisor on the given plan.
        Each subclass will use this method to mitigate a specific issue.
        """
        return "This function should be implemented by subclasses."


class HypervisorHallucinations(Hypervisor):
    def __init__(self, llm: LLM, prompt_args: dict[str, str]):
        """
        Initialize the hypervisor for hallucinations detection.

        Input:
            llm (LLM): The language model to use for detecting and mitigating hallucinations.
            threshold (int): The severity threshold above which a hallucination is considered critical.
        """
        super().__init__(prompt_args=prompt_args)

        self.name = "HypervisorHallucinations"
        self.llm = llm
        self.required_args = {
            "threshold": "(int) The severity threshold above which a hallucination is considered critical.",
            "plan": "(str) The plan to be checked for hallucinations.",
        }

        # Prompts
        # TODO: split logic and data
        self.system_prompt_detect = textwrap.dedent("""
                                                    You are a hypervisor that detects hallucinations. 
                                                    Your task is to analyze a provided plan and its assumptions
                                                    and detect any hallucinations or inconsistencies.
                                                    """).strip()
        self.prompt_detect = textwrap.dedent("""
                                             Analyze the following information and detect any hallucinations: 
                                             \n{plan}\n
                                             For any potential hallucination, return a description of it and its 
                                             severity, from 1 (low) to 5 (high). If there are no evident hallucinations,
                                             there is no need to invent them.
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

    def _detect_hallucinations(self) -> None:
        """
        Detect hallucinations in the given plan.

        Input:
            src (str): The plan to be checked for hallucinations.

        Output:
            str: The detected hallucinations.
        """
        self.prompt_args["hallucinations"] = self.llm.generate_sync(
            system_prompt=self.system_prompt_detect,
            prompt=self.prompt_detect.format(plan=self.prompt_args["plan"]),
        )

    def run(self) -> str:
        """
        Run the hypervisor to solve hallucinations in the plan.

        Input:
            src (str): The plan to be fixed for hallucinations.

        Output:
            str: The fixed plan.
        """
        self.upload_args(self.prompt_args)  # ensure args are uploaded
        self._detect_hallucinations()  # detect hallucinations first

        # Fix the plan
        prompt = self.prompt.format(
            hallucinations=self.prompt_args["hallucinations"],
            threshold=self.prompt_args["threshold"],
            plan=self.prompt_args["plan"],
        )
        return self.llm.generate_sync(
            system_prompt=self.system_prompt,
            prompt=prompt,
        )


class HypervisorDeepThinkPDDL(Hypervisor):
    def __init__(self, llm: LLM, prompt_args: dict[str, str]):
        """
        Initialize the hypervisor that deeply evaluates each PDDL plan's step.

        Input:
            llm (LLM): The language model to use for detecting and mitigating hallucinations.
        """
        super().__init__(prompt_args=prompt_args)
        self.name = "HypervisorDeepThinkPDDL"
        self.llm = llm
        self.required_args = {
            "specification": "(str) The plan to be checked for improvement.",
            "pddl_domain": "(str) The PDDL domain that describes the specification.",
            "pddl_problem": "(str) The PDDL problem that instantiates the specification.",
        }

        # Prompts
        self.system_prompt = textwrap.dedent("""
                                             You are a hypervisor that evaluates each plan's step. 
                                             Your task is to analyze a provided plan against the human specifics,
                                             and identify all the possible inconsistencies. You can think as much as you want before answering, and you can use as many steps as you want.
                                             """).strip()
        self.prompt = textwrap.dedent("""
                                      Given this specification in JSON format:
                                      \n{specification}\n
                                      And this PDDL domain that describes the specification:
                                      \n<domain>{pddl_domain}</domain>\n
                                      And this PDDL problem that instatiates the specification:
                                      \n<problem>{pddl_problem}</problem>\n
                                      Think *very carefully* whether the PDDL domain and plan reflect the human specification.
                                      In case anything does not satisfy the specification, return a fixed version of the PDDL domain and problem. Otherwise, return the original ones.\n
                                      Return the PDDL domain between <domain> and </domain> tags, 
                                      and the PDDL problem between <problem> and </problem> tags. Just return the PDDL code, do not add special characters or comments.
                                      """).strip()

    def run(self) -> str:
        """
        Run the hypervisor to solve hallucinations in the plan.

        Input:
            src (str): The plan to be fixed for hallucinations.

        Output:
            str: The fixed plan.
        """
        self.upload_args(self.prompt_args)  # ensure args are uploaded

        # Fix the plan
        prompt = self.prompt.format(
            specification=self.prompt_args["specification"],
            pddl_domain=self.prompt_args["pddl_domain"],
            pddl_problem=self.prompt_args["pddl_problem"],
        )
        return self.llm.generate_sync(
            system_prompt=self.system_prompt,
            prompt=prompt,
        )


class HypervisorSyntaxPDDL(Hypervisor):
    def __init__(self, llm: LLM, prompt_args: dict[str, str]):
        """
        Initialize the hypervisor that evaluates the PDDL syntax generated.

        Input:
            llm (LLM): The language model to use for fixing the syntax.
        """
        super().__init__(prompt_args=prompt_args)
        self.name = "HypervisorSyntaxPDDL"
        self.llm = llm
        self.required_args = {
            "specification": "(str) The plan to be checked for improvement.",
            "pddl_domain": "(str) The PDDL domain that describes the specification.",
            "pddl_problem": "(str) The PDDL problem that instantiates the specification.",
        }

        # Prompts
        self.system_prompt = textwrap.dedent("""
                                             You are a hypervisor that evaluates each plan's step. 
                                             Your task is to analyze a provided plan against the human specifics,
                                             and identify all the possible inconsistencies with the PDDL syntax.
                                             The PDDL syntax required is that used by *Fast Downward*. You can think as much as you want before answering, and you can use as many steps as you want.
                                             """).strip()
        self.prompt = textwrap.dedent("""
                                      Given this specification in JSON format:
                                      \n{specification}\n
                                      And this PDDL domain that describes the specification:
                                      \n<domain>{pddl_domain}</domain>\n
                                      And this PDDL problem that instatiates the specification:
                                      \n<problem>{pddl_problem}</problem>\n
                                      Think *very carefully* whether the PDDL domain and plan are compliant with the PDDL syntax required by *Fast Downward*. 
                                      In case anything does not satisfy the specification, return a fixed version of the PDDL domain and problem. Otherwise, return the original ones.\n
                                      Return the PDDL domain between <domain> and </domain> tags, 
                                      and the PDDL problem between <problem> and </problem> tags. Just return the PDDL code, do not add special characters or comments.
                                      """).strip()

    def run(self) -> str:
        """
        Run the hypervisor to solve hallucinations in the plan.

        Input:
            src (str): The plan to be fixed for hallucinations.

        Output:
            str: The fixed plan.
        """
        self.upload_args(self.prompt_args)  # ensure args are uploaded

        # Fix the plan
        prompt = self.prompt.format(
            specification=self.prompt_args["specification"],
            pddl_domain=self.prompt_args["pddl_domain"],
            pddl_problem=self.prompt_args["pddl_problem"],
        )
        return self.llm.generate_sync(
            system_prompt=self.system_prompt,
            prompt=prompt,
        )
