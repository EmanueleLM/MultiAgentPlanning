(define (domain Blocksworld)
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

    ;; 1. Pick up X from the table
    (:action pick-up
        :parameters (?x - block)
        :precondition (and 
            (clear ?x) 
            (ontable ?x) 
            (handempty)
        )
        :effect (and 
            (holding ?x)
            (not (ontable ?x))
            (not (handempty))
            (increase (total-cost) 1)
        )
    )

    ;; 2. Put down X onto the table
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

    ;; 3. Stack X onto Y
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

    ;; 4. Unstack X from Y
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
            (not (handempty))
            (increase (total-cost) 1)
        )
    )
)