from typing import List
from abc import ABC, abstractmethod
from src.llm_plan.StaticEnvironment import StaticAgentsVault


class Problem(ABC):
    """
    Abstract base class for problems.
    Classes that extend Problem should define the specific problem to be solved.
    TODO: add eventual methods that are mandatory for the subclasses.
    """

    pass


class ProblemStaticAgentsVault(Problem):
    def __init__(self, static_agent_vault: StaticAgentsVault):
        """
        Initialize the problem with a StaticAgentsVault instance.

        Args:
            static_agent_vault (StaticAgentsVault): The static agents vault environment.
            This must be initialized before.
        """
        super(ProblemStaticAgentsVault, self).__init__()
        self.static_agent_vault = static_agent_vault

        # Collect information from the environment and format it
        def format_info(info: List | str) -> str:
            if isinstance(info, List):
                return "\n".join(info) + "\n"
            return str(info) + "\n"

        self.agent_A_knowledge = format_info(
            self.static_agent_vault.knowledge["Agent A"]
        )
        self.agent_B_knowledge = format_info(
            self.static_agent_vault.knowledge["Agent B"]
        )
        self.agent_A_observables = format_info(
            self.static_agent_vault.observables["Agent A"]
        )
        self.agent_B_observables = format_info(
            self.static_agent_vault.observables["Agent B"]
        )
        self.public_information = format_info(
            self.static_agent_vault.public_information
        )
        self.agent_A_goal = format_info(self.static_agent_vault.goal["Agent A"])
        self.agent_B_goal = format_info(self.static_agent_vault.goal["Agent B"])

        self.system_prompt_template = (
            "You are an expert with PDDL problems (Planning Domain Definition Language). \
You always provide a PDDL domain and a PDDL problem file to solve the task."
        )
        self.prompt = (
            "You are {agent_name}. You are in an enviroment with the following public information:\n{public_information}\n\
You have the following knowledge:\n{agent_knowledge}\n\
This is the global goal to solve:{goal}\n\
Think step by step and and provide a PDDL domain and a PDDL problem file to solve the task.\nIf you miss some information, do not make assumptions,\
just give a plan that concerns the information you have."
        )

        self.system_prompts = {
            "Agent A": self.system_prompt_template.format,
            "Agent B": self.system_prompt_template.format,
        }

        self.prompts = {
            "Agent A": self.prompt.format(
                agent_name="Agent A",
                public_information=self.public_information,
                agent_knowledge=self.agent_A_knowledge,
                goal=self.agent_A_goal,
            ),
            "Agent B": self.prompt.format(
                agent_name="Agent B",
                public_information=self.public_information,
                agent_knowledge=self.agent_B_knowledge,
                goal=self.agent_B_goal,
            ),
        }
