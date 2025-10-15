(define (problem integrated-problem)
  (:domain integrated-domain)
  (:objects
    object_0 object_1 object_2 object_3 object_4 object_5 object_6 object_7 object_8 object_9 object_10 - object
  )
  (:init
    ; scenarioA initial facts
    (cats object_0)
    (cats object_1)
    (collect object_6 object_2)
    (collect object_7 object_2)
    (collect object_8 object_3)
    (collect object_9 object_3)
    (hand object_10)
    (next object_0 object_8)
    (next object_1 object_6)
    (next object_10 object_9)
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

    ; scenarioB initial facts (unioned)
    (collect object_5 object_1)
    (collect object_6 object_1)
    (collect object_7 object_2) ; already included above but repeated safe
    (collect object_8 object_2)
    (hand object_9)
    (next object_0 object_7)
    (next object_10 object_5)
    (next object_3 object_5)
    (next object_4 object_8)
    (next object_9 object_8)
    (sneeze object_3)
    (sneeze object_4) ; already included above
    (spring object_5)
    (spring object_7)
    (stupendous object_1)
    (stupendous object_2) ; already included above
    (texture object_5)
    (texture object_6) ; already included above
    (texture object_7) ; already included above
    (texture object_8) ; already included above
    (cats object_0) ; already included
  )

  (:goal (and
    (next object_10 object_6)    ; scenarioA goal
    (next object_10 object_5)    ; scenarioB goal (already true in init)
    (next object_9 object_7)     ; scenarioB goal (not provable from init)
  ))
)