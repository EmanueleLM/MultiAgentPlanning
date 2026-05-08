(define (problem sokoban-problem)
    (:domain sokoban)

    (:objects 
        player - agent
        box - item
        l1 l2 l3 l4 l5 - location
    )

    (:init 
        (at_agent player l2)
        (at_item box l3)
        (is_goal l5)

        ; Free locations
        (is_free l1) (is_free l2) (is_free l3) 
        (is_free l4) (is_free l5)

        ; Adjacency relationships
        (adjacent l1 l2) (adjacent l2 l1)
        (adjacent l2 l3) (adjacent l3 l2)
        (adjacent l3 l4) (adjacent l4 l3)
        (adjacent l4 l5) (adjacent l5 l4)
    )

    (:goal 
        (at_item box l5)
    )
)