(define (problem orchestrated-problem)
  (:domain orchestrated)
  (:objects
    object_0 object_1 object_2 object_3 object_4 object_5 object_6 object_7 object_8 object_9 object_10 object_11 object_12
  )

  (:init
    ;-- Facts originating from Problem A (agent_a)
    (cats object_0)
    (collect object_5 object_1)
    (collect object_6 object_1)
    (collect object_7 object_2)
    (collect object_8 object_2)
    (hand object_10)
    (hand object_11)
    (hand object_9)
    (next object_0 object_5)
    (next object_10 object_5)
    (next object_11 object_5)
    (next object_3 object_6)
    (next object_4 object_7)
    (next object_9 object_8)
    (sneeze object_3)
    (sneeze object_4)
    (spring object_5)
    (spring object_7)
    (stupendous object_1)
    (stupendous object_2)
    (texture object_5)
    (texture object_6)
    (texture object_7)
    (texture object_8)

    ;-- Facts originating from Problem B (agent_b)
    (cats object_1)
    (collect object_6 object_2)
    (collect object_7 object_2)
    (collect object_8 object_3)
    (collect object_9 object_3)
    (hand object_12)
    (hand object_11) ; already listed, included for clarity
    (hand object_10)
    (next object_0 object_6)
    (next object_1 object_8)
    (next object_10 object_9)
    (next object_11 object_6)
    (next object_12 object_6)
    (next object_4 object_7)
    (next object_5 object_8)
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

    ;-- Note: combined initial facts are the union of the two problem statements.
  )

  ;; Combined goals: both Goal A and Goal B must be achieved.
  (:goal
    (and
      ;; Goal A
      (next object_10 object_8)
      (next object_11 object_7)
      (next object_9 object_6)

      ;; Goal B
      (next object_10 object_7)
      (next object_11 object_9)
      (next object_12 object_8)
    )
  )
)