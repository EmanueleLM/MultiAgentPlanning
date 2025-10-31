(define (problem depots3-combined)
  (:domain depots3-multiagent)

  (:objects
    object_0 object_1 object_2 object_3 object_4 object_5 object_6 object_7 object_8 object_9 - obj
  )

  (:init
    ;; From Player1 initial facts
    (cats object_0)
    (collect object_5 object_1)
    (collect object_6 object_2)
    (hand object_7)
    (hand object_8)
    (next object_0 object_6)
    (next object_3 object_5)
    (next object_4 object_6)
    (next object_7 object_6)
    (next object_8 object_6)
    (sneeze object_3)
    (sneeze object_4)
    (spring object_5)
    (spring object_6)
    (stupendous object_1)
    (stupendous object_2)
    (texture object_5)
    (texture object_6)

    ;; From Player2 initial facts (merged)
    (cats object_1)
    (collect object_7 object_3)
    ;; collect object_6 object_2 already added (duplicate)
    (hand object_9)
    ;; hand object_8 already added (duplicate)
    ;; next object_0 object_6 already added
    (next object_1 object_6)
    ;; next object_4 object_6 already added
    (next object_5 object_7)
    (next object_8 object_7)
    (next object_9 object_7)
    (sneeze object_5)
    ;; sneeze object_4 already added
    (spring object_7)
    ;; spring object_6 already added
    (stupendous object_3)
    ;; stupendous object_2 already added
    (texture object_7)
  )

  (:goal (and
    ;; Player1's goals
    (next object_7 object_5)
    (next object_8 object_5)
    ;; Player2's goals
    (next object_8 object_7)
    (next object_9 object_6)
  ))
)