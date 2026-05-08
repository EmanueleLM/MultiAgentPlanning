(define (problem orchestrator-problem)
  (:domain orchestrator)
  (:objects
    object_0 object_6 object_7 object_8 - obj
    step_0 step_1 step_2 step_3 - step
  )

  (:init
    ;; minimal succ chain to allow three actions (sip, memory, paltry)
    (succ step_0 step_1)
    (succ step_1 step_2)
    (succ step_2 step_3)
    (now step_0)

    ;; reduced initial facts: only those required by a valid plan
    (cats object_0)
    (hand object_8)
    (texture object_7)
    (texture object_6)
    (next object_8 object_7)
    (next object_0 object_7)
    (spring object_7)
    (spring object_6)
  )

  (:goal (and
    (next object_8 object_6)
  ))
)