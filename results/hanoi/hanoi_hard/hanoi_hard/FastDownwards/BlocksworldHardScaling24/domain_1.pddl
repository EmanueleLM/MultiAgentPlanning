(define (domain blocksworld)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types block)
    (:predicates
        (on ?b1 - block ?b2 - block)
        (ontable ?b - block)
        (clear ?b - block)
        (holding ?b - block)
        (hand_empty)
    )
    
    (:functions
        (total-cost)
    )

    (:action pick-up
        :parameters (?b - block)
        :precondition (and 
            (clear ?b) 
            (ontable ?b) 
            (hand_empty)
        )
        :effect (and 
            (not (ontable ?b)) 
            (not (hand_empty)) 
            (holding ?b)
            (increase (total-cost) 1)
        )
    )

    (:action put-down
        :parameters (?b - block)
        :precondition (holding ?b)
        :effect (and 
            (not (holding ?b)) 
            (ontable ?b) 
            (clear ?b) 
            (hand_empty)
            (increase (total-cost) 1)
        )
    )

    (:action stack
        :parameters (?b1 - block ?b2 - block)
        :precondition (and 
            (holding ?b1) 
            (clear ?b2)
        )
        :effect (and 
            (not (holding ?b1)) 
            (not (clear ?b2)) 
            (on ?b1 ?b2) 
            (clear ?b1) 
            (hand_empty)
            (increase (total-cost) 1)
        )
    )

    (:action unstack
        :parameters (?b1 - block ?b2 - block)
        :precondition (and 
            (on ?b1 ?b2) 
            (clear ?b1) 
            (hand_empty)
        )
        :effect (and 
            (not (on ?b1 ?b2)) 
            (not (hand_empty)) 
            (holding ?b1) 
            (clear ?b2)
            (increase (total-cost) 1)
        )
    )
)