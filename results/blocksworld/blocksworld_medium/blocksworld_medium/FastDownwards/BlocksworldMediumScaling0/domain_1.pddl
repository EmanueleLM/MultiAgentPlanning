(define (domain blocksworld)
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
        (total-cost) - number
    )

    ;; Pick up block X from the table
    (:action pick-up
        :parameters (?x - block)
        :precondition (and 
            (clear ?x)
            (ontable ?x)
            (handempty)
        )
        :effect (and 
            (holding ?x)
            (not (handempty))
            (not (ontable ?x))
            (increase (total-cost) 1)
        )
    )

    ;; Put down block X onto the table
    (:action put-down
        :parameters (?x - block)
        :precondition (holding ?x)
        :effect (and 
            (handempty)
            (not (holding ?x))
            (ontable ?x)
            (clear ?x)
            (increase (total-cost) 1)
        )
    )

    ;; Unstack block X from block Y
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
            (not (handempty))
            (not (on ?x ?y))
            (increase (total-cost) 1)
        )
    )

    ;; Stack block X onto block Y
    (:action stack
        :parameters (?x - block ?y - block)
        :precondition (and 
            (holding ?x)
            (clear ?y)
        )
        :effect (and 
            (on ?x ?y)
            (clear ?x)
            (not (clear ?y))
            (not (holding ?x))
            (handempty)
            (increase (total-cost) 1)
        )
    )
)