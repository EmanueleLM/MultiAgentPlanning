from abc import ABC, abstractmethod


class Agent(ABC):
    """
    Abstract base class for agents.
    """

    @abstractmethod
    def reset(self):
        """
        Reset the agent's internal state.
        """
        pass


class StaticAgent(ABC):
    """
    Abstract base class for agents.
    """

    def __init__(
        self,
        name: str,
        knowledge=None,
        observables=None,
        public_information=None,
        goal=None,
    ):
        super(StaticAgent, self).__init__()
        self.name = name
        self.knowledge = knowledge
        self.observables = observables
        self.public_information = public_information
        self.goal = goal

    @abstractmethod
    def reset(
        self,
        knowledge=None,
        observables=None,
        public_information=None,
        goal=None,
    ):
        """
        Reset the agent's internal state.
        """
        self.knowledge = knowledge
        self.observables = observables
        self.public_information = public_information
        self.goal = goal
