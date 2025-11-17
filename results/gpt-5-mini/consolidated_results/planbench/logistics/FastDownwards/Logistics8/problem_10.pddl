(define (problem objects-manipulation-problem)
  (:domain objects-manipulation)
  (:objects
    object_2 object_4 object_5 object_7 object_8 object_9 object_10 - object
    step_0 step_1 step_2 step_3 - time
  )

  (:init
    ;; discrete time progression for up to three actions
    (time-now step_0)
    (succ step_0 step_1)
    (succ step_1 step_2)
    (succ step_2 step_3)

    ;; static facts and dynamic state at initial time (global state represented implicitly at time-now)
    (hand object_9)
    (sneeze object_4)

    (texture object_7)
    (texture object_8)

    (next object_4 object_8)
    (next object_9 object_8)
    (next object_10 object_5)

    (collect object_8 object_2)
    (collect object_7 object_2)
    (stupendous object_2)

    (cats object_0) ;; preserved from original specification although object_0 not listed as explicit object in this problem
  )

  (:goal (and
    (next object_10 object_5)
    (next object_9 object_7)
  ))
)