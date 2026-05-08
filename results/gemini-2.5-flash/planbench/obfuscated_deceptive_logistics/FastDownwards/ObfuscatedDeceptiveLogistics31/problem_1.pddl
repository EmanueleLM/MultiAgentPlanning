(define (problem obfuscated_deceptive_logistics_31)
    (:domain obfuscated_deceptive_logistics_31)
    (:objects
        object_0 object_1 object_2 object_3 object_4 object_5 object_6 object_7 object_8 object_9 object_10 object_11 object_12 object_13 object_14 object_15 - obj
    )
    (:init
        ; Property Predicates
        (is_cats object_0)
        (is_cats object_1)
        (is_hand object_12)
        (is_hand object_13)
        (is_hand object_14)
        (is_hand object_15)
        (is_sneeze object_4)
        (is_sneeze object_5)
        (is_spring object_6)
        (is_spring object_9)
        (is_stupendous object_2)
        (is_stupendous object_3)
        (is_texture object_10)
        (is_texture object_11)
        (is_texture object_6)
        (is_texture object_7)
        (is_texture object_8)
        (is_texture object_9)

        ; Binary Relationships
        (is_collected object_10 object_3)
        (is_collected object_11 object_3)
        (is_collected object_6 object_2)
        (is_collected object_7 object_2)
        (is_collected object_8 object_2)
        (is_collected object_9 object_3)

        ; Initial 'is_next' locations for carrier objects
        (is_next object_0 object_9)
        (is_next object_1 object_6)
        (is_next object_12 object_9)
        (is_next object_13 object_6)
        (is_next object_14 object_7)
        (is_next object_15 object_6)
        (is_next object_4 object_7)
        (is_next object_5 object_9)

        ; All carrier objects are initially located, so none are unlocated.
        ; The (unlocated ?carrier - obj) predicate is implicitly false for all relevant objects
        ; because they have an (is_next ...) fact.
    )
    (:goal (and
        (is_next object_12 object_11)
        (is_next object_13 object_8)
        (is_next object_14 object_10)
        (is_next object_15 object_9)
    ))
)