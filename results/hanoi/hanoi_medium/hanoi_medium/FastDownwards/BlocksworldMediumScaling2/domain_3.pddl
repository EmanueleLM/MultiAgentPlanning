(define (domain BlocksworldMediumScaling2)
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
            (holding ?x)
            (not (ontable ?x))
            (not (handempty))
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
            (not (handempty))
        )
    )

    (:action put-down
        :parameters (?x - block)
        :precondition (holding ?x)
        :effect (and
            (handempty)
            (ontable ?x)
            (clear ?x)
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
            (handempty)
            (on ?x ?y)
            (clear ?x)
            (not (holding ?x))
            (not (clear ?y))
        )
    )
)