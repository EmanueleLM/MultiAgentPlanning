(define (domain blocks)
    (:requirements :strips :typing :negative-preconditions)
    (:types 
        block
    )
    
    (:predicates
        (on ?x - block ?y - block)
        (on-table ?x - block)
        (clear ?x - block)
        (holding ?x - block)
        (hand-empty)
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
            (not (on-table ?x))
            (not (hand-empty))
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
            (not (on ?x ?y)) 
            (not (hand-empty))
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
            (hand-empty) 
            (clear ?x) 
            (not (clear ?y)) 
            (not (holding ?x))
        )
    )
)