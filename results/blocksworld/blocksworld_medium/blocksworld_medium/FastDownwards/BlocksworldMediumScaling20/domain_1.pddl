(define (domain blocksworld)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types block)
    (:predicates
        (on ?x - block ?y - block)
        (ontable ?x - block)
        (clear ?x - block)
        (holding ?x - block)
        (arm-empty)
    )

    (:functions
        (total-cost)
    )

    ;; Action: pick-up (from table)
    (:action pick-up
        :parameters (?x - block)
        :precondition (and 
            (clear ?x) 
            (ontable ?x) 
            (arm-empty)
        )
        :effect (and 
            (not (ontable ?x)) 
            (not (clear ?x)) 
            (not (arm-empty)) 
            (holding ?x)
            (increase (total-cost) 1)
        )
    )

    ;; Action: put-down (to table)
    (:action put-down
        :parameters (?x - block)
        :precondition (holding ?x)
        :effect (and 
            (not (holding ?x)) 
            (clear ?x) 
            (ontable ?x) 
            (arm-empty)
            (increase (total-cost) 1)
        )
    )

    ;; Action: stack (onto another block)
    (:action stack
        :parameters (?x - block ?y - block)
        :precondition (and 
            (holding ?x) 
            (clear ?y)
        )
        :effect (and 
            (not (holding ?x)) 
            (not (clear ?y)) 
            (clear ?x) 
            (arm-empty) 
            (on ?x ?y)
            (increase (total-cost) 1)
        )
    )

    ;; Action: unstack (from another block)
    (:action unstack
        :parameters (?x - block ?y - block)
        :precondition (and 
            (on ?x ?y) 
            (clear ?x) 
            (arm-empty)
        )
        :effect (and 
            (not (on ?x ?y)) 
            (not (clear ?x)) 
            (not (arm-empty)) 
            (clear ?y) 
            (holding ?x)
            (increase (total-cost) 1)
        )
    )
)