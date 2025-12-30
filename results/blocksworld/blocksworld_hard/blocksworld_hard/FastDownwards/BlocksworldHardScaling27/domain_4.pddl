(define (domain blocksworld)
    (:requirements :strips :typing :negative-preconditions)
    (:types block)
    (:predicates
        (on ?x - block ?y - block)
        (ontable ?x - block)
        (clear ?x - block)
        (holding ?x - block)
        (handempty)
    )

    (:action pick-up
        :parameters (?x - block)
        :precondition (and 
            (clear ?x)
            (ontable ?x)
            (handempty)
        )
        :effect (and 
            (not (ontable ?x))
            (not (handempty))
            (holding ?x)
        )
    )

    (:action put-down
        :parameters (?x - block)
        :precondition (holding ?x)
        :effect (and 
            (ontable ?x)
            (handempty)
            (clear ?x)
            (not (holding ?x))
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
            (not (on ?x ?y))
            (clear ?y)
            (not (handempty))
            (holding ?x)
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
            (not (clear ?y))
            (clear ?x)
            (not (holding ?x))
            (handempty)
        )
    )
)