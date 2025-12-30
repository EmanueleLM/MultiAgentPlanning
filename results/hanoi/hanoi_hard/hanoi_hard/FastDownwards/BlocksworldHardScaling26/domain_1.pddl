(define (domain BlocksworldHardScaling26)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types block)
    (:predicates
        (on ?x - block ?y - block)
        (ontable ?x - block)
        (clear ?x - block)
        (holding ?x - block)
        (handempty)
    )
    
    (:functions
        (total-cost)
    )

    ;; Action Pick-up: block X from the table
    (:action pick-up
        :parameters (?x - block)
        :precondition (and 
            (ontable ?x) 
            (clear ?x) 
            (handempty)
        )
        :effect (and 
            (holding ?x)
            (not (ontable ?x))
            (not (clear ?x))
            (not (handempty))
            (increase (total-cost) 1)
        )
    )

    ;; Action Put-down: block X onto the table
    (:action put-down
        :parameters (?x - block)
        :precondition (holding ?x)
        :effect (and 
            (ontable ?x)
            (clear ?x)
            (handempty)
            (not (holding ?x))
            (increase (total-cost) 1)
        )
    )

    ;; Action Unstack: block X from block Y
    (:action unstack
        :parameters (?x - block ?y - block)
        :precondition (and 
            (on ?x ?y) 
            (clear ?x) 
            (handempty)
        )
        :effect (and 
            (holding ?x)
            (clear ?y)
            (not (on ?x ?y))
            (not (clear ?x))
            (not (handempty))
            (increase (total-cost) 1)
        )
    )

    ;; Action Stack: block X onto block Y
    (:action stack
        :parameters (?x - block ?y - block)
        :precondition (and 
            (holding ?x) 
            (clear ?y)
        )
        :effect (and 
            (on ?x ?y)
            (clear ?x)
            (handempty)
            (not (holding ?x))
            (not (clear ?y))
            (increase (total-cost) 1)
        )
    )
)