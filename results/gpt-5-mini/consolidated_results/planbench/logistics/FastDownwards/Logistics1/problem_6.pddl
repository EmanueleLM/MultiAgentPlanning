(define (problem logistics1-problem0)
  (:domain Logistics1)
  (:objects
    object_0 object_1 object_2 object_3 object_4 object_5 object_6 object_7 object_8 - obj
    s0 s1 s2 s3 - stage
  )
  (:init
    ;; Initial facts from Statement A
    (cats object_0)
    (cats object_1)
    (collect object_6 object_2)
    (collect object_7 object_3)
    (hand object_8)
    (next object_0 object_7)
    (next object_1 object_7)
    (next object_4 object_6)
    (next object_5 object_7)
    (next object_8 object_7)
    (sneeze object_4)
    (sneeze object_5)
    (spring object_6)
    (spring object_7)
    (stupendous object_2)
    (stupendous object_3)
    (texture object_6)
    (texture object_7)

    ;; Stage ordering for discrete-time progression; actions must consume the current stage and advance to the next one.
    (succ s0 s1)
    (succ s1 s2)
    (succ s2 s3)
    (now s0)
  )
  (:goal (and
    (next object_8 object_6)
  ))
)