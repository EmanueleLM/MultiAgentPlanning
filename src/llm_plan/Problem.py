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

        # Collect information from the environment
        self.agent_A_knowledge = " ".join(self.static_agent_vault.knowledge["Agent A"])
        self.agent_B_knowledge = " ".join(self.static_agent_vault.knowledge["Agent B"])
        self.agent_A_observables = " ".join(
            self.static_agent_vault.observables["Agent A"]
        )
        self.agent_B_observables = " ".join(
            self.static_agent_vault.observables["Agent B"]
        )
        self.public_information = " ".join(self.static_agent_vault.public_information)
        self.goal = self.static_agent_vault.goal

        self.system_prompt_template = "You are {agent_name}. You are an expert with PDDL problems (Planning Domain Definition Language)."
        self.prompt = (
            "You are {agent_name}. You are in an enviroment with the following public information: {public_information}. \
You have the following knowledge: {agent_knowledge}. \
This is the global goal to solve: {goal}. \
Provide a PDDL plan to solve the task. If you miss some information, do not make assumptions, \
just give a plan that concerns the information you have."
        )

        self.system_prompts = {
            "Agent A": self.system_prompt_template.format(agent_name="Agent A"),
            "Agent B": self.system_prompt_template.format(agent_name="Agent B"),
        }

        self.prompts = {
            "Agent A": self.prompt.format(
                agent_name="Agent A",
                public_information=self.public_information,
                agent_knowledge=self.agent_A_knowledge,
                goal=self.goal,
            ),
            "Agent B": self.prompt.format(
                agent_name="Agent B",
                public_information=self.public_information,
                agent_knowledge=self.agent_B_knowledge,
                goal=self.goal,
            ),
        }
