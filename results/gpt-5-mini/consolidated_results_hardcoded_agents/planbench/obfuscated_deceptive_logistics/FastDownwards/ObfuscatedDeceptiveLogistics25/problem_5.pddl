(define (problem object_playground-problem)
  (:domain object_playground)

  (:objects
    object_5 object_7 object_9 object_10 object_11 object_12 object_13 - object
    step0 step1 step2 step3 - step
  )

  (:init
    ;; Minimal facts needed to support the required memory transitions
    (cats object_11)
    (cats object_12)
    (cats object_13)

    (spring object_5)
    (spring object_7)
    (spring object_9)
    (spring object_10)

    (next object_11 object_10)
    (next object_12 object_7)
    (next object_13 object_7)

    ;; compact time progression sufficient for three memory actions
    (succ step0 step1)
    (succ step1 step2)
    (succ step2 step3)
    (now step0)
  )

  (:goal (and
    (next object_11 object_5)
    (next object_12 object_9)
    (next object_13 object_10)
  ))
)