import json
from collections import defaultdict, deque
from typing import List, Any, Dict


class Environment:
    """
    Abstract base class for static environments.
    """

    def __init__(self, config: str | Dict[str, Any]):
        """
        Initialize the environment with a json configuration file/dictionary object.

        Args:
            config (str | dict): Dict, or str path to the json configuration string for the environment.
        """
        if isinstance(config, str):
            with open(config, "r") as f:
                self.config_data = json.load(f)
        elif isinstance(config, dict):
            self.config_data = config
        else:
            raise ValueError("Invalid config type. Must be str or dict.")

        self.name = self.config_data.get("name", "UnnamedEnvironment")
        self.agents = self.config_data.get("agents")
        self.orchestrator = self.config_data.get("orchestrator", None)
        self.environment = self.config_data.get("environment")
        self.workflow = self.config_data.get("workflow")
        self.plan: List[List[str]]

        self.reset()

    def reset(self, **args):
        """
        This method creates the graph of the constraints and sets up the prompts
        """
        # Map additional fields that are not defined in the abstract Environment class
        # 1. Envrionment constants
        for arg in args:
            self.environment.get("init").get(arg)

        # 2. Agents information
        self.agent_names = self.agents.get("names")

        # Workflow information
        # 1. Agents actions
        self.actions = {}
        for agent in self.agent_names:
            self.actions[agent] = self.workflow.get(agent)

        # 2. Collect actions and constraints
        actions = []
        for agent, config in self.workflow.participants.items():
            actions.extend([f"{agent}.{a}" for a in config.get("tasks", {}).keys()])

        self.workflow_constraints: List[str] = self.workflow.get("constraints", [])

        # 4. Build the dependency graph between tasks
        self.plan = self.schedule(actions, self.workflow_constraints)

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
