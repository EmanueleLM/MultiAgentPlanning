(define (problem Logistics13-problem)
  (:domain Logistics13)
  (:objects
    object_0 object_1 object_2 object_3 object_4 object_5 object_6 object_7 object_8 object_9 object_10 object_11 object_12 - obj
    step_0 step_1 step_2 step_3 step_4 step_5 step_6 step_7 step_8 step_9 step_10 step_11 step_12 - stage
  )
  (:init
    ;; static/object facts from the latest scenario statement
    (cats object_0)
    (cats object_1)

    (collect object_6 object_2)
    (collect object_7 object_2)
    (collect object_8 object_3)
    (collect object_9 object_3)

    (hand object_10)
    (hand object_11)
    (hand object_12)

    (next object_0 object_8)
    (next object_1 object_6)
    (next object_10 object_8)
    (next object_11 object_9)
    (next object_12 object_6)
    (next object_4 object_6)
    (next object_5 object_9)

    (sneeze object_4)
    (sneeze object_5)

    (spring object_6)
    (spring object_8)

    (stupendous object_2)
    (stupendous object_3)

    (texture object_6)
    (texture object_7)
    (texture object_8)
    (texture object_9)

    ;; explicit stage chain to enforce ordering/time progression
    (succ step_0 step_1)
    (succ step_1 step_2)
    (succ step_2 step_3)
    (succ step_3 step_4)
    (succ step_4 step_5)
    (succ step_5 step_6)
    (succ step_6 step_7)
    (succ step_7 step_8)
    (succ step_8 step_9)
    (succ step_9 step_10)
    (succ step_10 step_11)
    (succ step_11 step_12)

    ;; initialize all objects to the initial stage step_0 to require explicit progression
    (at-stage object_0 step_0)
    (at-stage object_1 step_0)
    (at-stage object_2 step_0)
    (at-stage object_3 step_0)
    (at-stage object_4 step_0)
    (at-stage object_5 step_0)
    (at-stage object_6 step_0)
    (at-stage object_7 step_0)
    (at-stage object_8 step_0)
    (at-stage object_9 step_0)
    (at-stage object_10 step_0)
    (at-stage object_11 step_0)
    (at-stage object_12 step_0)
  )
  (:goal (and
    (next object_10 object_7)
    (next object_11 object_7)
    (next object_12 object_7)
  ))
)