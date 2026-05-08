(define (problem obfuscated_deceptive_logistics_47_problem)
    (:domain obfuscated_deceptive_logistics_47)
    (:objects
        object_0 - agent
        object_4 - agent
        object_5 - agent
        object_6 - agent
        object_10 - agent
        object_11 - agent
        object_7 - location
        object_8 - location
        object_9 - location
        object_1 - resource
        object_2 - resource
        object_3 - resource
    )
    (:init
        (is_cats object_0)
        (collect object_7 object_1)
        (collect object_8 object_2)
        (collect object_9 object_3)
        (is_hand object_10)
        (is_hand object_11)
        (next object_0 object_8)
        (next object_10 object_8)
        (next object_11 object_9)
        (next object_4 object_7)
        (next object_5 object_8)
        (next object_6 object_9)
        (is_sneeze object_4)
        (is_sneeze object_5)
        (is_sneeze object_6)
        (is_spring object_7)
        (is_spring object_8)
        (is_spring object_9)
        (is_stupendous object_1)
        (is_stupendous object_2)
        (is_stupendous object_3)
        (is_texture object_7)
        (is_texture object_8)
        (is_texture object_9)
    )
    (:goal (and
        (next object_10 object_9)
        (next object_11 object_7)
    ))
)