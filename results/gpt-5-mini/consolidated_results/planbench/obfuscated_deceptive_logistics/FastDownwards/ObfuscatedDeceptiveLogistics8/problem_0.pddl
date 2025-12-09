(define (problem pddl_orchestrator_problem)
  (:domain pddl_orchestrator)
  (:objects
    object_1 object_2 object_3 object_4 object_5
    object_6 object_7 object_8 object_9 object_10 - obj
  )
  (:init
    ;; Intentionally no (next ...) facts in the initial state;
    ;; actions must establish the required next relations.
  )
  (:goal
    (and
      ;; Mandated terminal conditions: both must hold in the final state.
      (next object_10 object_6)
      (next object_9 object_6)
    )
  )
)