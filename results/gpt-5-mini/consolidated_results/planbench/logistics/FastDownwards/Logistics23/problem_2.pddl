(define (problem Logistics23_problem_fragment1_minimized)
  (:domain Logistics23)

  (:objects
    object_1 object_2 object_3 object_4 object_6 object_7 object_8 object_10 object_11 object_12 - obj
  )

  (:init
    ; Minimal initial facts required to support the provided plan for fragment 1.
    (hand object_11)
    (hand object_12)

    (sneeze object_3)
    (sneeze object_4)

    (texture object_6)
    (texture object_7)
    (texture object_8)
    (texture object_10)

    (stupendous object_1)
    (stupendous object_2)

    (collect object_10 object_2)
    (collect object_8 object_2)
    (collect object_7 object_1)
    (collect object_6 object_1)

    (next object_12 object_10)
    (next object_4 object_10)
    (next object_11 object_6)
    (next object_3 object_7)
  )

  (:goal
    (and
      (next object_11 object_7)
      (next object_12 object_8)
    )
  )
)