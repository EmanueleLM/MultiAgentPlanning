(define (domain blocksworld)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types
        block
    )
    (:predicates
        (on ?x - block ?y - block)
        (on_table ?x - block)
        (clear ?x - block)
        (hand_empty)
        (holding ?x - block)
    )
    (:functions
        (total-cost)
    )

    (:action pickup
        :parameters (?x - block)
        :precondition (and
            (clear ?x)
            (on_table ?x)
            (hand_empty)
        )
        :effect (and
            (not (clear ?x))
            (not (on_table ?x))
            (not (hand_empty))
            (holding ?x)
            (increase (total-cost) 1)
        )
    )

    (:action putdown
        :parameters (?x - block)
        :precondition (and
            (holding ?x)
        )
        :effect (and
            (clear ?x)
            (on_table ?x)
            (hand_empty)
            (not (holding ?x))
            (increase (total-cost) 1)
        )
    )

    (:action stack
        :parameters (?x - block ?y - block)
        :precondition (and
            (holding ?x)
            (clear ?y)
        )
        :effect (and
            (on ?x ?y)
            (clear ?x)
            (hand_empty)
            (not (holding ?x))
            (not (clear ?y))
            (increase (total-cost) 1)
        )
    )

    (:action unstack
        :parameters (?x - block ?y - block)
        :precondition (and
            (on ?x ?y)
            (clear ?x)
            (hand_empty)
        )
        :effect (and
            (holding ?x)
            (clear ?y)
            (not (on ?x ?y))
            (not (clear ?x))
            (not (hand_empty))
            (increase (total-cost) 1)
        )
    )
)