import json
from abc import ABC, abstractmethod
from collections import defaultdict, deque
from typing import List


class Environment(ABC):
    """
    Abstract base class for static environments.
    """

    def __init__(self, config: str):
        """
        Initialize the environment with a json configuration file.

        Args:
            config (str): Path to the json configuration string for the environment.
        """
        with open(config, "r") as f:
            self.config_data = json.load(f)

        self.name = self.config_data.get("name", "UnnamedEnvironment")
        self.agents = self.config_data.get("agents")
        self.orchestrator = self.config_data.get("orchestrator", None)
        self.environment = self.config_data.get("environment")
        self.workflow = self.config_data.get("workflow")
        self.plan: List[List[str]]

    @staticmethod
    def schedule(actions: List[str], constraints: List[str]) -> List[List[str]]:
        # Build graph
        graph = defaultdict(list)
        indegree = {a: 0 for a in actions}

        for c in constraints:
            src, dst = c.split("->")
            graph[src].append(dst)
            indegree[dst] += 1

        # Kahn’s algorithm: collect levels
        result = []
        queue = deque([a for a in actions if indegree[a] == 0])

        while queue:
            level = list(queue)  # current layer (parallel actions)
            result.append(level)

            for _ in range(len(queue)):
                node = queue.popleft()
                for nei in graph[node]:
                    indegree[nei] -= 1
                    if indegree[nei] == 0:
                        queue.append(nei)

        # sanity check (detect cycle)
        if any(indegree[a] > 0 for a in actions):
            raise ValueError("Cycle detected in constraints!")

        return result

    @abstractmethod
    def render(self):
        """
        Render the current state of the environment.
        """
        pass
