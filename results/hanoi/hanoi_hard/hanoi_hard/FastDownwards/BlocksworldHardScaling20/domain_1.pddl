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
        (total-cost) - number
    )

    (:action pick-up
        :parameters (?x - block)
        :precondition (and 
            (clear ?x) 
            (on-table ?x) 
            (hand-empty)
        )
        :effect (and 
            (not (on-table ?x)) 
            (not (hand-empty)) 
            (holding ?x)
            (increase (total-cost) 1)
        )
    )

    (:action put-down
        :parameters (?x - block)
        :precondition (holding ?x)
        :effect (and 
            (not (holding ?x)) 
            (hand-empty) 
            (on-table ?x) 
            (clear ?x) 
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
            (not (on ?x ?y)) 
            (not (hand-empty)) 
            (holding ?x) 
            (clear ?y)
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
            (not (holding ?x)) 
            (hand-empty) 
            (on ?x ?y) 
            (clear ?x) 
            (not (clear ?y))
            (increase (total-cost) 1)
        )
    )
)