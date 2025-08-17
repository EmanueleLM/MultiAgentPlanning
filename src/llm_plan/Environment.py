from abc import ABC, abstractmethod


class Environment(ABC):
    """
    Abstract base class for static environments.
    Classes that extend StaticEnvironment should encompass only cases where:
    - the environment does not change;
    - the agents cannot explore.
    """

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
