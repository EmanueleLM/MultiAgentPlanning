(define (domain blocksworld-hard-28)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    
    (:types block - object)
    (:constants table - object)

    (:predicates
        (on ?x - block ?y - object)
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
            (on ?x table)
            (hand-empty)
        )
        :effect (and 
            (not (on ?x table)) 
            (not (clear ?x))
            (not (hand-empty)) 
            (holding ?x)
            (increase (total-cost) 1)
        )
    )

    (:action put-down
        :parameters (?x - block)
        :precondition (holding ?x)
        :effect (and 
            (on ?x table) 
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
            (not (on ?x ?y)) 
            (not (clear ?x))
            (clear ?y)
            (not (hand-empty)) 
            (holding ?x)
            (increase (total-cost) 1)
        )
    )

    (:action stack
        :parameters (?x - block ?y - block)
        :precondition (and 
            (clear ?y) 
            (holding ?x)
        )
        :effect (and 
            (not (clear ?y)) 
            (not (holding ?x))
            (clear ?x) 
            (hand-empty)
            (on ?x ?y)
            (increase (total-cost) 1)
        )
    )
)