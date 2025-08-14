from abc import ABC, abstractmethod
from typing import List


class DynamicEnviroment(ABC):
    """
    Abstract base class for environments.
    """

    @abstractmethod
    def reset(self):
        """
        Reset the environment to its initial state.
        """
        pass

    @abstractmethod
    def step(self, action):
        """
        Take a step in the environment based on the action.

        Args:
            action: The action to be taken in the environment.

        Returns:
            A tuple containing the next state, reward, done flag, and additional info.
        """
        pass

    @abstractmethod
    def render(self):
        """
        Render the current state of the environment.
        """
        pass
