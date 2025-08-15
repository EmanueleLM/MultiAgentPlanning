from typing import List
from abc import ABC, abstractmethod

# This is not a good import practice, but we require it for the agentic framework
# TODO: fix this
from src.llm_plan.Environment import *


class Problem(ABC):
    """
    Abstract base class for problems.
    Classes that extend Problem should define the specific problem to be solved.
    TODO: add methods that are mandatory for any subclasses.
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
        self.orchestrator_prompt = "There are two agents in an environment. You will receive their PDDL domains and problems.\n\
You need to orchestrate them to solve the task. Keep in mind that the PDDL they send you may be partial or contain ambiguities.\n\
A partial PDDL may partially solve a planning problem, but it may require to integrate additional information from the other PDDL to achieve the goal.\n\
Ambiguities may appear in different forms: for example, two PDDL problems may refer to the same object with different names (e.g., a door for an agent is the entrance for the other).\n\
Here's the information the first agent has and its PDDL response:\n\
{pddl_agent_A}\n\
Here's the information the second agent has and its PDDL response:\n\
{pddl_agent_B}\n\
You need to integrate the PDDL responses of the two agents to solve the task. The goal is: {goal}.\n\
Think step by step and and provide a PDDL domain and a PDDL problem file to solve the task."

        self.system_prompts = {
            "Agent A": self.system_prompt_template,
            "Agent B": self.system_prompt_template,
            "Orchestrator": self.system_prompt_template,
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
            "Orchestrator": self.orchestrator_prompt,  # Need to format this! So probably rethink the code structure
        }


class ProblemStaticTwoAgentsBlocksworld(Problem):
    def __init__(self, static_blocksworld: StaticTwoAgentsBlocksworld):
        """
        Initialize the problem with a StaticTwoAgentsBlocksworld instance.

        Args:
            static_blocksworld (StaticTwoAgentsBlocksworld): The static blocksworld environment.
            This must be initialized before.
        """
        super().__init__()
        self.static_blocksworld = static_blocksworld

        def format_info(info: List | str) -> str:
            if isinstance(info, List):
                return "\n".join(info) + "\n"
            return str(info) + "\n"

        self.agent_A_knowledge = format_info(
            self.static_blocksworld.knowledge["Agent A"]
        )
        self.agent_B_knowledge = format_info(
            self.static_blocksworld.knowledge["Agent B"]
        )
        self.agent_A_observables = format_info(
            self.static_blocksworld.observables["Agent A"]
        )
        self.agent_B_observables = format_info(
            self.static_blocksworld.observables["Agent B"]
        )
        self.public_information = format_info(
            self.static_blocksworld.public_information
        )
        self.agent_A_goal = format_info(self.static_blocksworld.goal["Agent A"])
        self.agent_B_goal = format_info(self.static_blocksworld.goal["Agent B"])

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
            "Orchestrator": self.orchestrator_prompt,  # Need to format this! So probably rethink the code structure
        }


class ProblemStaticThreeSwitchesRoom(Problem):
    def __init__(self, static_three_switches_room: StaticThreeSwitchesRoom):
        """
        Problem definition for the Three Switches Room environment.
        """
        super().__init__()
        self.env = static_three_switches_room

        def fmt(info: List | str) -> str:
            return (
                "\n".join(info) + "\n" if isinstance(info, List) else str(info) + "\n"
            )

        self.agent_R_knowledge = fmt(self.env.knowledge["Agent R"])
        self.agent_G_knowledge = fmt(self.env.knowledge["Agent G"])
        self.agent_B_knowledge = fmt(self.env.knowledge["Agent B"])

        self.public_information = fmt(self.env.public_information)
        self.agent_R_goal = fmt(self.env.goal["Agent R"])
        self.agent_G_goal = fmt(self.env.goal["Agent G"])
        self.agent_B_goal = fmt(self.env.goal["Agent B"])

        self.system_prompt_template = (
            "You are an expert with PDDL problems (Planning Domain Definition Language). "
            "You always provide a PDDL domain and a PDDL problem file to solve the task."
        )

        self.prompt_template = (
            "You are {agent_name}. You are in an environment with the following public information:\n{public_information}\n"
            "You have the following knowledge:\n{agent_knowledge}\n"
            "This is the global goal to solve:\n{goal}\n"
            "Think step by step and provide a PDDL domain and a PDDL problem file to solve the task.\n"
            "If you miss some information, do not make assumptions—just give a plan that concerns the information you have."
        )

        self.orchestrator_prompt = (
            "There are three agents in an environment. You will receive their PDDL domains and problems.\n"
            "You need to orchestrate them to solve the task. Keep in mind that the PDDL they send you may be partial or contain ambiguities.\n"
            "The goal is for all three switches to be pressed simultaneously to unlock the door.\n"
            "A partial PDDL may partially solve a planning problem, but may require integrating additional information from other PDDLs.\n"
            "Ambiguities may appear, e.g., objects referred to with different names.\n"
            "Here's the information the first agent has and its PDDL response:\n"
            "{pddl_agent_R}\n"
            "Here's the information the second agent has and its PDDL response:\n"
            "{pddl_agent_G}\n"
            "Here's the information the third agent has and its PDDL response:\n"
            "{pddl_agent_B}\n"
            "You need to integrate the PDDL responses of the three agents to solve the task. The goal is: {goal}.\n"
            "Think step by step and provide a PDDL domain and a PDDL problem file to solve the task."
        )

        self.system_prompts = {
            "Agent R": self.system_prompt_template,
            "Agent G": self.system_prompt_template,
            "Agent B": self.system_prompt_template,
            "Orchestrator": self.system_prompt_template,
        }

        self.prompts = {
            "Agent R": self.prompt_template.format(
                agent_name="Agent R",
                public_information=self.public_information,
                agent_knowledge=self.agent_R_knowledge,
                goal=self.agent_R_goal,
            ),
            "Agent G": self.prompt_template.format(
                agent_name="Agent G",
                public_information=self.public_information,
                agent_knowledge=self.agent_G_knowledge,
                goal=self.agent_G_goal,
            ),
            "Agent B": self.prompt_template.format(
                agent_name="Agent B",
                public_information=self.public_information,
                agent_knowledge=self.agent_B_knowledge,
                goal=self.agent_B_goal,
            ),
            "Orchestrator": self.orchestrator_prompt,
        }


class ProblemStaticSingleAgentBlocksworld(Problem):
    def __init__(self, static_single_blocksworld: StaticSingleAgentBlocksworld):
        super().__init__()
        self.env = static_single_blocksworld

        def fmt(info: List | str) -> str:
            return (
                "\n".join(info) + "\n" if isinstance(info, List) else str(info) + "\n"
            )

        self.agent_knowledge = fmt(self.env.knowledge["Agent"])
        self.public_information = fmt(self.env.public_information)
        self.agent_goal = fmt(self.env.goal["Agent"])

        self.system_prompt_template = (
            "You are an expert with PDDL problems (Planning Domain Definition Language). "
            "You always provide a PDDL domain and a PDDL problem file to solve the task."
        )

        self.prompt = (
            "You are the only agent in an environment with the following public information:\n"
            "{public_information}\n"
            "You have the following knowledge:\n"
            "{agent_knowledge}\n"
            "This is the global goal to solve:\n"
            "{goal}\n"
            "Think step by step and provide a PDDL domain and a PDDL problem file to solve the task.\n"
            "If you miss some information, do not make assumptions—just give a plan that concerns the information you have."
        ).format(
            public_information=self.public_information,
            agent_knowledge=self.agent_knowledge,
            goal=self.agent_goal,
        )

        self.system_prompts = {"Agent": self.system_prompt_template}
        self.prompts = {"Agent": self.prompt}


# class ProblemSingleAgentBlocksWorld(Problem):
#     def __init__(self, initial_state: list[list[str]], goal_state: list[list[str]]):
#         """
#         Problem definition for a simple single-agent Blocks World environment.
#         The agent can only move a block if it does not have other blocks on top.

#         Args:
#             initial_state (list[list[str]]): Initial stacks of blocks (bottom at index 0).
#             goal_state (list[list[str]]): Goal stacks of blocks (bottom at index 0).
#         """
#         super().__init__()
#         self.initial_state = initial_state
#         self.goal_state = goal_state

#         def describe_state(stacks: list[list[str]]) -> str:
#             """Generate a natural language description of the block arrangement."""
#             facts = []
#             for stack in stacks:
#                 # bottom block is on the table
#                 bottom = stack[0]
#                 facts.append(f"the {bottom} block is on the table")

#                 # relationships between adjacent blocks
#                 for below, above in zip(stack, stack[1:]):
#                     facts.append(f"the block {above} is on top of the {below} block")

#                 # top block is clear
#                 top = stack[-1]
#                 facts.append(f"the block {top} is clear")

#             if len(facts) == 1:
#                 return facts[0] + "."
#             return ", ".join(facts[:-1]) + ", and " + facts[-1] + "."

#         self.public_information = [
#             "You are in a blocks world environment.",
#             "You can pick up a block if it is clear (no block on top) and on the table.",
#             "You can unstack a block from on top of another block if it is clear.",
#             "You can put down a block you are holding onto the table.",
#             "You can stack a block you are holding on top of another clear block.",
#             "You can only hold one block at a time.",
#             f"The initial configuration is: {describe_state(self.initial_state)}",
#         ]

#         self.goal = {
#             "Agent": f"Arrange the blocks so that {describe_state(self.goal_state)}"
#         }

#         self.system_prompt_template = (
#             "You are an expert with PDDL problems (Planning Domain Definition Language). "
#             "You always provide a PDDL domain and a PDDL problem file to solve the task."
#         )

#         self.prompt = (
#             "You are a single agent in a blocks world environment with the following public information:\n"
#             "{public_information}\n"
#             "Your goal is:\n{goal}\n"
#             "Think step by step and provide a PDDL domain and a PDDL problem file to solve the task.\n"
#             "If you miss some information, do not make assumptions—just give a plan that concerns the information you have."
#         )

#         self.system_prompts = {"Agent": self.system_prompt_template}

#         self.prompts = {
#             "Agent": self.prompt.format(
#                 public_information="\n".join(self.public_information),
#                 goal=self.goal["Agent"],
#             )
#         }
