(define (domain blocksworld)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types block)
    (:predicates
        (on ?x - block ?y - block)
        (on-table ?x - block)
        (clear ?x - block)
        (holding ?x - block)
        (hand-empty)
    )
    (:functions
        (total-cost)
    )

    (:action pick-up
        :parameters (?x - block)
        :precondition (and
            (clear ?x)
            (on-table ?x)
            (hand-empty)
        )
        :effect (and
            (holding ?x)
            (not (clear ?x))
            (not (on-table ?x))
            (not (hand-empty))
            (increase (total-cost) 1)
        )
    )

    (:action put-down
        :parameters (?x - block)
        :precondition (holding ?x)
        :effect (and
            (on-table ?x)
            (clear ?x)
            (hand-empty)
            (not (holding ?x))
            (increase (total-cost) 1)
        )
    )

    (:action unstack
        :parameters (?x - block ?y - block)
        :precondition (and
            (on ?x ?y)
            (clear ?x)
            (hand-empty)
        )
        :effect (and
            (holding ?x)
            (clear ?y)
            (not (clear ?x))
            (not (on ?x ?y))
            (not (hand-empty))
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
            (hand-empty)
            (not (holding ?x))
            (not (clear ?y))
            (increase (total-cost) 1)
        )
    )
)