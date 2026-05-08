(define (problem pddl_orchestrator-problem)
  (:domain pddl_orchestrator)
  (:objects
    object_1 object_2 object_3 object_4 object_5
    object_6 object_7 object_8 object_9 object_10 - obj
  )
  (:init
    ;; All objects are initially available. No proposals, confirmations, or next relations exist.
    (available object_1)
    (available object_2)
    (available object_3)
    (available object_4)
    (available object_5)
    (available object_6)
    (available object_7)
    (available object_8)
    (available object_9)
    (available object_10)
  )
  (:goal (and
    (next object_10 object_6)
    (next object_9 object_6)
  ))
)