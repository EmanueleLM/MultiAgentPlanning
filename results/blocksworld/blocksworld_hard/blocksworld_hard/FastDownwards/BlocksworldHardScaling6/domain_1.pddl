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
            (holding ?x)
            (not (handempty))
            (not (ontable ?x))
            (not (clear ?x)) ; Custom: Block loses clear status because it is picked up
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
            (not (handempty))
            (not (on ?x ?y))
            (not (clear ?x)) ; Custom: Block loses clear status because it is picked up
        )
    )

    (:action put-down
        :parameters (?x - block)
        :precondition (holding ?x)
        :effect (and 
            (ontable ?x)
            (handempty)
            (clear ?x) ; Custom: Block gains clear status because it is no longer held
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
            (on ?x ?y)
            (handempty)
            (clear ?x) ; Custom: Block gains clear status because it is no longer held
            (not (holding ?x))
            (not (clear ?y))
        )
    )
)