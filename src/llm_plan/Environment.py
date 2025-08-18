from abc import ABC, abstractmethod
from typing import List


class Environment(ABC):
    """
    Abstract base class for static environments.
    Classes that extend StaticEnvironment should encompass only cases where:
    - the environment does not change;
    - the agents cannot explore.
    """

    def __init__(self, name: str):
        self.name = name
        self.system_prompts: str | dict[str, str]
        self.agent_names: str | List[str]
        self.orchestrator_name: str
        self.prompts: dict[str, str]
        self.goal: str | dict[str, str]

    @abstractmethod
    def render(self):
        """
        Render the current state of the environment.
        """
        pass

    @abstractmethod
    def reset(self):
        """
        Reset the environment.
        """
        pass
