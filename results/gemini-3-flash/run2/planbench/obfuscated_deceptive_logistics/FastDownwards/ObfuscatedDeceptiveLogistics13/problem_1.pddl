(define (problem obfuscated_deceptive_logistics_13_problem)
    (:domain obfuscated_logistics)
    (:objects
        object_0 object_1 - cats
        object_2 object_3 - stupendous
        object_4 object_5 - sneeze
        object_6 object_8 - spring
        object_7 object_9 - texture
        object_10 object_11 object_12 - hand
    )

    (:init
        (cats object_0)
        (cats object_1)
        (stupendous object_2)
        (stupendous object_3)
        (sneeze object_4)
        (sneeze object_5)
        (spring object_6)
        (spring object_8)
        (texture object_6)
        (texture object_7)
        (texture object_8)
        (texture object_9)
        (hand object_10)
        (hand object_11)
        (hand object_12)
        (collect object_6 object_2)
        (collect object_7 object_2)
        (collect object_8 object_3)
        (collect object_9 object_3)
        (next object_0 object_8)
        (next object_1 object_6)
        (next object_4 object_6)
        (next object_5 object_9)
        (next object_10 object_8)
        (next object_11 object_9)
        (next object_12 object_6)
    )

    (:goal
        (and
            (next object_10 object_7)
            (next object_11 object_7)
            (next object_12 object_7)
        )
    )
)