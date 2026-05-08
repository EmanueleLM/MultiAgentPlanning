(define (problem obfuscated_deceptive_logistics_problem)
    (:domain obfuscated_deceptive_logistics)
    (:objects
        object_0 - obj
        object_1 - obj
        object_2 - obj
        object_3 - obj
        object_4 - obj
        object_5 - obj
        object_6 - obj
        object_7 - obj
        object_8 - obj
        object_9 - obj
        object_10 - obj
        object_11 - obj
        object_12 - obj
        object_13 - obj
        object_14 - obj
    )
    (:init
        (cats object_0)
        (collect object_10 object_2)
        (collect object_5 object_1)
        (collect object_6 object_1)
        (collect object_7 object_1)
        (collect object_8 object_2)
        (collect object_9 object_2)
        (hand object_11)
        (hand object_12)
        (hand object_13)
        (hand object_14)
        (next object_0 object_8)
        (next object_11 object_10)
        (next object_12 object_5)
        (next object_13 object_7)
        (next object_14 object_9)
        (next object_3 object_6)
        (next object_4 object_9)
        (sneeze object_3)
        (sneeze object_4)
        (spring object_5)
        (spring object_8)
        (stupendous object_1)
        (stupendous object_2)
        (texture object_10)
        (texture object_5)
        (texture object_6)
        (texture object_7)
        (texture object_8)
        (texture object_9)
    )
    (:goal (and
        (next object_11 object_9)
        (next object_12 object_8)
        (next object_13 object_5)
        (next object_14 object_7)
    ))
)