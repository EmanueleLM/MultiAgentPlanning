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

    ;; Pick up a block from the table
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

    ;; Put down a block onto the table
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

    ;; Unstack a block from on top of another block
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
    
    ;; Stack a block on top of another block
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