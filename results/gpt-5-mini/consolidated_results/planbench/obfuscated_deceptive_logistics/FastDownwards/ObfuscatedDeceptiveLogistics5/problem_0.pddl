(define (problem orchestrator-problem)
  (:domain orchestrator-domain)

  ; Minimal assumptions about missing environment public initial facts:
  ; - No public initial "next" relations were provided. We assert none exist here.
  ; - We declare objects object_1 .. object_9 and the three agents acting_agent, observer_agent, auditor_agent.
  ; If the environment provided different or additional initial facts, they must replace these assumptions.
  (:objects
    acting_agent observer_agent auditor_agent - agent
    object_1 object_2 object_3 object_4 object_5 object_6 object_7 object_8 object_9 - obj
  )

  (:init
    ; Agents are present (so their prefixed actions are permitted).
    (agent-present acting_agent)
    (agent-present observer_agent)
    (agent-present auditor_agent)

    ; Explicitly assert no existing successor / predecessor relations by omission:
    ; (Because PDDL initial state lists positive facts only, the absence of (has-successor ...) and (has-predecessor ...),
    ; and the absence of any (next ...) facts, is the representation of "no links initially".)
    ; (No further initial facts were supplied by the environment public information.)
  )

  ; Goal enforces the mandated terminal condition: object_9 must be immediately before object_7.
  ; The planner must construct a plan composed of one of the agent-prefixed link actions that
  ; creates (next object_9 object_7) while respecting uniqueness constraints.
  (:goal (and
    (next object_9 object_7)
  ))
)