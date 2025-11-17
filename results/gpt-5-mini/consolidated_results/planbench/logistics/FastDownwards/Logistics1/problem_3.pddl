(define (problem logistics1-problem0)
  (:domain Logistics1)
  (:objects
    object_0 object_1 object_2 object_3 object_4 object_5 object_6 object_7 object_8 - obj
    s0 s1 s2 s3 - stage
  )
  (:init
    ;; Statement B initial facts (full, no placeholders)
    (cats object_0)
    (collect object_5 object_1)
    (collect object_6 object_2)
    (hand object_7)
    (hand object_8)
    (next object_0 object_6)
    (next object_3 object_5)
    (next object_4 object_6)
    (next object_7 object_6)
    (next object_8 object_5)
    (sneeze object_3)
    (sneeze object_4)
    (spring object_5)
    (spring object_6)
    (stupendous object_1)
    (stupendous object_2)
    (texture object_5)
    (texture object_6)

    ;; Stage ordering and current time
    (succ s0 s1)
    (succ s1 s2)
    (succ s2 s3)
    (now s0)
  )
  (:goal (and
    (next object_7 object_6)
    (next object_8 object_6)
  ))
)