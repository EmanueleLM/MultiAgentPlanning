(define (problem object-relations-problem)
  (:domain object-relations)
  ; Nine objects available as specified in the analysis (object_0 .. object_8).
  (:objects
    object_0 object_1 object_2 object_3 object_4 object_5 object_6 object_7 object_8 - obj
  )

  ; Initial state:
  ; The analysis provided no explicit, complete initial-state scenarios. Per instructions we do not invent
  ; availability beyond the provided data, so the initial state is intentionally left empty (no ground facts).
  ; Planners will therefore find no action applicable unless additional facts are supplied externally.
  (:init
  )

  ; Goal:
  ; No explicit goal was provided in the analysis. A conjunctive goal is specified here only to make the
  ; problem syntactically complete. This goal is illustrative; it does not invent initial facts, but it
  ; requests the planner to reach a state where a 'next' and a 'vase' relation hold between concrete objects.
  ; If you intend to verify specific plans, replace this goal (and/or the empty init) with the concrete
  ; initial facts and the scenario-specific goals that were requested in the analysis.
  (:goal
    (and
      (next object_0 object_1)
      (vase object_2 object_3)
    )
  )
)