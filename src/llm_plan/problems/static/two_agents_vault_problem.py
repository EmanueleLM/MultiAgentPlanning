import textwrap

from src.llm_plan.problem import Problem
from src.llm_plan.environments.static.two_agents_vault import TwoAgentsVault

# Separate data from logic
_SYSTEM_PROMPT = textwrap.dedent("""You are an expert with PDDL problems (Planning Domain Definition Language). 
                                You always provide a PDDL domain and a PDDL problem file to solve the task.""").strip()

_PROMPT_TEMPLATE = textwrap.dedent("""
                                You are {agent_name}. You are in an enviroment with the following public information:
                                {public_information}

                                You have the following knowledge:
                                {agent_knowledge}

                                This is the global goal to solve:
                                {goal}

                                Think step by step and and provide a PDDL domain and a PDDL problem file to solve the task.
                                If you miss some information, do not make assumptions, just give a plan that concerns the information you have.
                            """).strip()

_PROMPT_ORCHESTRATOR = textwrap.dedent("""
                                    There are two agents in an environment. You will receive their PDDL domains and problems.
                                    You need to orchestrate them to solve the task. Keep in mind that the PDDL they send you may be partial or contain ambiguities.
                                    A partial PDDL may partially solve a planning problem, but it may require to integrate additional information from the other PDDL to achieve the goal.
                                    Ambiguities may appear in different forms: for example, two PDDL problems may refer to the same object with different names 
                                    (e.g., a door for an agent is the entrance for the other).

                                    Here's the information the first agent has and its PDDL response:
                                    {pddl_agent_A}

                                    Here's the information the second agent has and its PDDL response:
                                    {pddl_agent_B}

                                    You need to integrate the PDDL responses of the two agents to solve the task. The goal is: {goal}.
                                    Think step by step and and provide a PDDL domain and a PDDL problem file to solve the task.
                                """).strip()


class AgentsVaultProblem(Problem):
    def __init__(self, two_agent_vault: TwoAgentsVault):
        """
        Initialize the problem with a StaticAgentsVault instance.

        Args:
            two_agent_vault (StaticAgentsVault): The static agents vault environment.
            This must be initialized before.
        """
        super(AgentsVaultProblem, self).__init__()
        self.prompts = {}
        self.system_prompts = {}

        # Agent System Prompt
        for agent_name in two_agent_vault.agent_names:
            self.system_prompts[agent_name] = _SYSTEM_PROMPT
            self.prompts[agent_name] = _PROMPT_TEMPLATE.format(
                agent_name=agent_name,
                public_information=two_agent_vault.public_information,
                agent_knowledge=two_agent_vault.knowledge[agent_name],
                goal=self.format_info(two_agent_vault.goal),
            )

        # Orchestrator
        self.system_prompts[two_agent_vault.orchestrator_name] = _SYSTEM_PROMPT
        self.prompts[two_agent_vault.orchestrator_name] = _PROMPT_ORCHESTRATOR
