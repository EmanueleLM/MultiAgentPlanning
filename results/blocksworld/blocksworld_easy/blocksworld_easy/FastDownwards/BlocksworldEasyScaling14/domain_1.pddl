(define (domain blocksworld)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types block)
    (:predicates
        (on ?x - block ?y - block)
        (ontable ?x - block)
        (clear ?x - block)
        (handempty)
        (holding ?x - block)
    )
    (:functions
        (total-cost)
    )

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
            (not (clear ?x))
            (not (handempty))
            (increase (total-cost) 1)
        )
    )

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

    (:action stack
        :parameters (?x - block ?y - block)
        :precondition (and 
            (holding ?x) 
            (clear ?y)
            (not (= ?x ?y))
        )
        :effect (and 
            (on ?x ?y) 
            (clear ?x)
            (not (clear ?y))
            (handempty)
            (not (holding ?x))
            (increase (total-cost) 1)
        )
    )
)