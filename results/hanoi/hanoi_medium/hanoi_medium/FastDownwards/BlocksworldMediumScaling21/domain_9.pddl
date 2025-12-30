(define (domain blocksworld)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types block)
    (:predicates
        (on ?x - block ?y - block)
        (on_table ?x - block)
        (clear ?x - block)
        (holding ?x - block)
        (hand_empty)
    )

    (:functions
        (total-cost)
    )

    ; Action 1: Pick up a block X from the table
    (:action pick-up
        :parameters (?x - block)
        :precondition (and
            (clear ?x)
            (on_table ?x)
            (hand_empty)
        )
        :effect (and
            (not (on_table ?x))
            (not (clear ?x))
            (not (hand_empty))
            (holding ?x)
            (increase (total-cost) 1)
        )
    )

    ; Action 2: Put down a block X onto the table
    (:action put-down
        :parameters (?x - block)
        :precondition (holding ?x)
        :effect (and
            (not (holding ?x))
            (on_table ?x)
            (clear ?x)
            (hand_empty)
            (increase (total-cost) 1)
        )
    )

    ; Action 3: Stack block X onto block Y
    (:action stack
        :parameters (?x - block ?y - block)
        :precondition (and
            (holding ?x)
            (clear ?y)
        )
        :effect (and
            (not (holding ?x))
            (not (clear ?y))
            (on ?x ?y)
            (clear ?x)
            (hand_empty)
            (increase (total-cost) 1)
        )
    )

    ; Action 4: Unstack block X from block Y
    (:action unstack
        :parameters (?x - block ?y - block)
        :precondition (and
            (on ?x ?y)
            (clear ?x)
            (hand_empty)
        )
        :effect (and
            (not (on ?x ?y))
            (not (clear ?x))
            (not (hand_empty))
            (holding ?x)
            (clear ?y)
            (increase (total-cost) 1)
        )
    )
)