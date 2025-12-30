(define (domain blocksworld)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types 
        block - object
    )
    (:predicates
        (on ?x - block ?y - block)
        (ontable ?x - block)
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
            (ontable ?x) 
            (hand-empty)
        )
        :effect (and 
            (not (ontable ?x)) 
            (not (clear ?x)) ; Block is no longer clear when picked up
            (not (hand-empty)) 
            (holding ?x)
            (increase (total-cost) 1)
        )
    )

    (:action put-down
        :parameters (?x - block)
        :precondition (holding ?x)
        :effect (and 
            (ontable ?x) 
            (clear ?x) ; Block is now on table and clear
            (hand-empty) 
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
            (not (holding ?x)) 
            (not (clear ?y)) ; Y is no longer clear
            (clear ?x) ; X is now on top and clear
            (hand-empty) 
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
            (clear ?y) ; Y becomes clear
            (not (on ?x ?y)) 
            (not (clear ?x)) ; X is now picked up, thus not clear
            (not (hand-empty))
            (increase (total-cost) 1)
        )
    )
)