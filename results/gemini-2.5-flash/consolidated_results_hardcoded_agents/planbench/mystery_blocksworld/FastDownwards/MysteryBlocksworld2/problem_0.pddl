(define (problem abstract_relationship_puzzle)
    (:domain abstract_relationships)
    (:objects
        A B C D - entity
    )
    (:init
        ; Initial Craving Relationships
        (craves A C)
        (craves C B)
        (craves D A)

        ; Global state
        (harmony)

        ; Entity states
        (planet B)
        (province D)
        ; A, C are neither province, planet, nor in pain initially.
    )
    (:goal
        (and
            (craves A D)
            (craves D B)
        )
    )
)