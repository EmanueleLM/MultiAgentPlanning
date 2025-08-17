from src.llm_plan.problem import Problem
from src.llm_plan.environments.static.two_agents_blockworld import TwoAgentsBlocksworld


class TwoAgentsBlocksworldProblem(Problem):
    def __init__(self, two_agents_blocksworld: TwoAgentsBlocksworld):
        """
        Initialize the problem with a StaticTwoAgentsBlocksworld instance.

        Args:
            two_agents_blocksworld (StaticTwoAgentsBlocksworld): The static blocksworld environment.
            This must be initialized before.
        """
        super(TwoAgentsBlocksworldProblem, self).__init__()

        self.system_prompt_template = (
            "You are an expert with PDDL problems (Planning Domain Definition Language). \
You always provide a PDDL domain and a PDDL problem file to solve the task."
        )

        self.prompt = (
            "You are {agent_name}. You are in an enviroment with the following public information:\n{public_information}\n\
You have the following knowledge:\n{agent_knowledge}\n\
This is the global goal to solve:{goal}\n\
Think step by step and provide a PDDL domain and a PDDL problem file to solve the task.\nIf you miss some information, do not make assumptions,\
just give a plan that concerns the information you have."
        )

        self.orchestrator_prompt = (
            "There are two agents in an environment. You will receive their PDDL domains and problems.\n\
You need to orchestrate them to solve the task. Keep in mind that the PDDL they send you may be partial or contain ambiguities.\n\
A partial PDDL may partially solve a planning problem, but it may require integrating additional information from the other PDDL to achieve the goal.\n\
Ambiguities may appear in different forms: for example, two PDDL problems may refer to the same object with different names (e.g., a block for an agent is a cube for the other).\n\
Here's the information the first agent has and its PDDL response:\n\
{pddl_agent_A}\n\
Here's the information the second agent has and its PDDL response:\n\
{pddl_agent_B}\n\
You need to integrate the PDDL responses of the two agents to solve the task. The goal is: {goal}.\n\
Think step by step and provide a PDDL domain and a PDDL problem file to solve the task."
        )

        self.system_prompts = {
            "Agent A": self.system_prompt_template,
            "Agent B": self.system_prompt_template,
            "Orchestrator": self.system_prompt_template,
        }

        self.prompts = {
            "Agent A": self.prompt.format(
                agent_name="Agent A",
                public_information=two_agents_blocksworld.public_information,
                agent_knowledge=two_agents_blocksworld.knowledge["Agent A"],
                goal=self.format_info(two_agents_blocksworld.goal["Agent B"]),
            ),
            "Agent B": self.prompt.format(
                agent_name="Agent B",
                public_information=two_agents_blocksworld.public_information,
                agent_knowledge=two_agents_blocksworld.knowledge["Agent B"],
                goal=self.format_info(two_agents_blocksworld.goal["Agent B"]),
            ),
            "Orchestrator": self.orchestrator_prompt,  # Need to format this! So probably rethink the code structure
        }
