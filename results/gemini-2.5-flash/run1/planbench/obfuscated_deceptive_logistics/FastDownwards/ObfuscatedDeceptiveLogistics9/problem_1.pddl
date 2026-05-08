(define (problem obfuscated_deceptive_logistics_9_problem)
    (:domain obfuscated_deceptive_logistics_9)
    (:objects
        object_0 - item
        object_1 - item
        object_2 - item
        object_3 - item
        object_4 - item
        object_5 - item
        object_6 - item
        object_7 - item
        object_8 - item
        object_9 - item
        object_10 - item
        object_11 - item
    )
    (:init
        (cats object_0)
        (cats object_1)
        (collect object_6 object_2)
        (collect object_7 object_2)
        (collect object_8 object_3)
        (collect object_9 object_3)
        (hand object_10)
        (hand object_11)
        (next object_0 object_8)
        (next object_1 object_6)
        (next object_10 object_6)
        (next object_11 object_9)
        (next object_4 object_6)
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
    )
    (:goal (and
        (next object_10 object_7)
        (next object_11 object_8)
    ))
)