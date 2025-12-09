(define (domain orchestrator-domain)
  ; Minimal assumptions documented as required by the task:
  ; Assumption: No environment public initial facts were provided to the orchestrator.
  ; Therefore we assume the only required objects are object_1 .. object_9 and three named agents.
  ; We assume initially there are no (next ...) links and no (has-successor / has-predecessor) facts.
  ; These assumptions are recorded here so the problem file can be interpreted; if real initial facts
  ; are supplied, they must replace the assumed facts in the problem file.
  (:requirements :strips :typing :negative-preconditions)
  (:types agent obj)

  (:predicates
    ; next represents the immediate successor relation in a linear ordering:
    (next ?a - obj ?b - obj)
    ; bookkeeping predicates to ensure uniqueness of successor / predecessor:
    (has-successor ?a - obj)
    (has-predecessor ?a - obj)
    ; Agents declared for provenance of actions (presence facts may be provided in the problem):
    (agent-present ?ag - agent)
  )

  ; Actions are prefixed with the agent names to keep provenance explicit.
  ; Each action enforces uniqueness: a source cannot already have a successor and
  ; a target cannot already have a predecessor. No unlink or penalty actions exist,
  ; so once a successor / predecessor edge is established it cannot be removed.
  (:action acting_agent_link
    :parameters (?x - obj ?y - obj)
    :precondition (and
      (not (has-successor ?x))
      (not (has-predecessor ?y))
      ; Agent must be present to perform the action if the problem models presence:
      (agent-present acting_agent)
    )
    :effect (and
      (next ?x ?y)
      (has-successor ?x)
      (has-predecessor ?y)
    )
  )

  (:action observer_agent_link
    :parameters (?x - obj ?y - obj)
    :precondition (and
      (not (has-successor ?x))
      (not (has-predecessor ?y))
      (agent-present observer_agent)
    )
    :effect (and
      (next ?x ?y)
      (has-successor ?x)
      (has-predecessor ?y)
    )
  )

  ; The auditor's action is phrased as a correction action coming from the auditor agent.
  ; As an auditor-correction it follows the same constraints (cannot create conflicting links).
  (:action auditor_agent_link
    :parameters (?x - obj ?y - obj)
    :precondition (and
      (not (has-successor ?x))
      (not (has-predecessor ?y))
      (agent-present auditor_agent)
    )
    :effect (and
      (next ?x ?y)
      (has-successor ?x)
      (has-predecessor ?y)
    )
  )
)