# Agent to evaluate plan against natural language description to use logic and common sense to suggest changes to pddl model.
# Need reasoning model for this.


# questions for the agent to consider:
# Are there any actions that seem to contradict any of the constraints on each agents' behavior?
# Is any agent performing a task they aren't supposed to be able to?
# Does the sequence of actions make sense? E.g. is an agent picking up an object before it has been delivered?
# Does any action seem redundant or ambiguous compared to another action?
# If you were to re-enact this sequence of actions, would anything odd or unexpected happen? Are there any actions that seem to contradict common sense or real-world logic?
#
