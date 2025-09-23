import inspect
from llm_plan.agent import Agent
from langchain.chat_models import ChatOpenAI
from langchain_core.messages import HumanMessage, SystemMessage


class MetaAnalyzer(Agent):
    required_args = {
        "human_specification": "(str) The human-readable specification of the task.",
        "specification": "(str) The JSON specification of the task.",
        "pddl_domain": "(str) The PDDL domain that describes the specification.",
        "pddl_problem": "(str) The PDDL problem that instantiates the specification.",
        "target_solver": "(str) The target PDDL solver.",
        "pddl_plan": "(str) The PDDL plan. May be empty if no plan was found.",
    }

    def __init__(self, llm: ChatOpenAI, prompt_args: dict[str, str]):
        """
        2-step agent that first analyzes a PDDL plan against a human specification to suggest edits to the PDDL domain and problem and make necessary changes.
        This agent evaluates the pddl plan against natural language description to use logic and common sense to suggest changes to pddl model.

        Input:
            llm (LLM): The language model used. Preferrably a reasoning model.
            prompt_args: (dict[str, str]): A dictionary containing the arguments for each prompt.
        """
        super().__init__(prompt_args=prompt_args)
        self.name = "MetaAnalyzer"
        self.llm = llm

        # Prompts
        self.system_prompt = inspect.cleandoc(
            """\
                                             Your task is to analyze a provided PDDL plan against the human specification, to see if it makes sense.
                                             The plan is produced by a planner which is guaranteed to be correct with respect to the PDDL domain and problem, but the PDDL domain and problem may not accurately reflect the human specification.
                                             You should think about whether the plan makes sense and is actually feasible, not from the PDDL model perspective, but from the perspective given by the human specification.
                                             
                                             You aim is to write a list of things, if any, that do not make sense or is illogical in the plan if it were to be read and executed.
                                             The plan may very well be fine. If you think the plan makes sense, return the exact phrase "<<PASS>>".
                                             You can think as much as you want before answering, and you can use as many steps as you want.
                                             """
        )

        self.editor_system_prompt = inspect.cleandoc(
            """\
                                             Your task is to edit a provided PDDL plan to better align it with the human specification.
                                             You are provided a list of feedback for the plan.
                                             The plan is produced by a planner which is guaranteed to be correct with respect to the PDDL domain and problem, but the PDDL domain and problem may not accurately reflect the human specification.
                                             The feedback is produced by considering whether the plan makes sense from a human standpoint.

                                             You aim is to return a revised PDDL domain and problem file that addresses the points raised in the feedback.
                                             Specifically, you might want to consider whether a missing precondition or effect from an action definition could have caused any of the issues raised in the feedback, and correspondingly modify them.
                                             You should return the revised PDDL domain between <domain> and </domain> tags, and the revised PDDL problem between <problem> and </problem> tags.
                                             Just return the PDDL code, do not add special characters or comments.
                                             """
        )
        self.prompt = inspect.cleandoc(
            """\
                                      Given this human specification of a task:
                                      <human_specification>{human_specification}</human_specification>
                                      
                                      This is the best plan the solver could find for a {target_solver} planner:
                                      <plan>{pddl_plan}</plan>
                                      
                                      Now, think *very carefully* and ask yourself:
                                      - Are there any actions that seem to contradict any of the constraints on each agents' behavior?
                                      - Is any agent performing a task they aren't supposed to be able to?
                                      - Does the sequence of actions make sense? E.g. is an agent picking up an object before it has been delivered?
                                      - Does any action seem redundant or ambiguous compared to another action?
                                      - If you were to re-enact this sequence of actions, would anything odd or unexpected happen? Are there any actions that seem to contradict common sense or violate the logic of the environment?
                                      
                                      Give your list of feedback here, or return the exact phrase "<<PASS>>" if you think the plan makes sense:
                                      """
        )
        self.editor_prompt = inspect.cleandoc(
            """\
                                      This is a plan specification, in JSON format, of the task:
                                      <specification>{specification}</specification>
                                      
                                      This is the PDDL domain that describes the specification:
                                      <domain>{pddl_domain}</domain>
                                      
                                      This is the PDDL problem that instatiates the specification:
                                      <problem>{pddl_problem}</problem>

                                      And this is the feedback you received about the plan:
                                      <feedback>{feedback}</feedback>

                                      Think *carefully*:
                                      - What parts of the PDDL domain and problem could have caused the issues raised in the feedback?
                                      - Could a missing precondition or effect from an action definition have caused any of the issues?
                                      - Do the names of the constants, actions and predicates make sense in the context of the specification?

                                      Return the PDDL domain between <domain> and </domain> tags, and the PDDL problem between <problem> and </problem> tags.
                                      Just return the PDDL code, do not add special characters or comments.
                                      """
        )

    def run(self) -> str:
        """
        Run the Agent to try to improve the PDDL model.
        """
        self.upload_args(self.prompt_args)  # ensure args are uploaded

        # Fix the plan
        prompt = self.prompt.format(
            human_specification=self.prompt_args["human_specification"],
            target_solver=self.prompt_args["target_solver"],
            pddl_plan=self.prompt_args["pddl_plan"],
        )

        inp = [SystemMessage(content=self.system_prompt), HumanMessage(content=prompt)]
        analyzer_out = self.llm.invoke(inp).text()

        if "<PASS>" in analyzer_out:
            return "<domain>{}</domain><problem>{}</problem><PASS>".format(
                self.prompt_args["pddl_domain"], self.prompt_args["pddl_problem"]
            )
        else:
            # Edit the PDDL domain and problem based on the feedback
            editor_prompt = self.editor_prompt.format(
                specification=self.prompt_args["specification"],
                pddl_domain=self.prompt_args["pddl_domain"],
                pddl_problem=self.prompt_args["pddl_problem"],
                feedback=analyzer_out,
            )
            editor_inp = [
                SystemMessage(content=self.editor_system_prompt),
                HumanMessage(content=editor_prompt),
            ]
            editor_out = self.llm.invoke(editor_inp).text()
            return editor_out
