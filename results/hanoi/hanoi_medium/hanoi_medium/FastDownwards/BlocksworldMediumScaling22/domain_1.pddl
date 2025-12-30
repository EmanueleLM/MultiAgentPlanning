(define (domain blocksworld)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types 
        block
    )
    (:predicates
        (on ?x - block ?y - block)
        (on_table ?x - block)
        (clear ?x - block)
        (holding ?x - block)
        (hand_empty)
    )
    (:functions
        (total-cost) - number
    )

    (:action unstack
        :parameters (?x - block ?y - block)
        :precondition (and 
            (on ?x ?y) 
            (clear ?x) 
            (hand_empty)
        )
        :effect (and 
            (not (on ?x ?y)) 
            (clear ?y)
            (holding ?x)
            (not (clear ?x)) ; Often implicit, but explicit negation for completeness
            (not (hand_empty))
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
            (not (holding ?x))
            (not (clear ?y))
            (hand_empty)
            (increase (total-cost) 1)
        )
    )

    (:action pickup
        :parameters (?x - block)
        :precondition (and 
            (on_table ?x) 
            (clear ?x) 
            (hand_empty)
        )
        :effect (and 
            (not (on_table ?x)) 
            (holding ?x)
            (not (clear ?x)) ; Block is no longer clear when held
            (not (hand_empty))
            (increase (total-cost) 1)
        )
    )

    (:action putdown
        :parameters (?x - block)
        :precondition (and 
            (holding ?x)
        )
        :effect (and 
            (on_table ?x) 
            (clear ?x)
            (not (holding ?x))
            (hand_empty)
            (increase (total-cost) 1)
        )
    )
)