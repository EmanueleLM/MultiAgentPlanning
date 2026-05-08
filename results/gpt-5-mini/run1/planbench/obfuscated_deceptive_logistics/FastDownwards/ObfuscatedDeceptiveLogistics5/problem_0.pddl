(define (problem orchestrate-problem)
  (:domain orchestrated_next)

  ; Minimal assumptions about missing environment public information:
  ; - The environment public information (initial facts) was not provided. To produce a valid PDDL problem,
  ;   the following minimal assumptions were made and encoded below:
  ;   * There are nine objects object_1 .. object_9. In particular object_9 and object_7 exist as required by the goal.
  ;   * Agents are present: acting_agent, observer, auditor.
  ;   * Only acting_agent has the capability to set (next ...); only observer can confirm; only auditor can validate.
  ; - No initial (next ...) facts are asserted (closed-world assumption applies).
  (:objects
    acting_agent observer auditor - agent
    object_1 object_2 object_3 object_4 object_5 object_6 object_7 object_8 object_9 - obj
  )

  (:init
    ; agents' capabilities (bind provenance of actions)
    (can-act acting_agent)
    (can-observe observer)
    (can-audit auditor)

    ; No (next ...) facts asserted here (assumed absent).
    ; No has-successor/has-predecessor/confirmed/validated facts asserted initially.
  )

  ; Goal: enforce final terminal condition mandated by the user
  (:goal (next object_9 object_7))
)