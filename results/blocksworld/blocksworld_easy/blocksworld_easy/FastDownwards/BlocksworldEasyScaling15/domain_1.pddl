(define (domain blocksworld-bw)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types 
        block
    )
    (:predicates
        (on ?x - block ?y - block)
        (ontable ?x - block)
        (clear ?x - block)
        (handempty)
        (holding ?x - block)
    )
    (:functions
        (total-cost) - number
    )

    ;; Pick up a block from the table
    (:action pickup
        :parameters (?x - block)
        :precondition (and 
            (clear ?x) 
            (ontable ?x) 
            (handempty)
        )
        :effect (and 
            (not (ontable ?x)) 
            (not (handempty)) 
            (not (clear ?x))
            (holding ?x)
            (increase (total-cost) 1)
        )
    )

    ;; Unstack a block from another block
    (:action unstack
        :parameters (?x - block ?y - block)
        :precondition (and 
            (on ?x ?y) 
            (clear ?x) 
            (handempty)
        )
        :effect (and 
            (not (on ?x ?y)) 
            (not (handempty)) 
            (not (clear ?x))
            (clear ?y)
            (holding ?x)
            (increase (total-cost) 1)
        )
    )

    ;; Put down a block onto the table
    (:action putdown
        :parameters (?x - block)
        :precondition (holding ?x)
        :effect (and 
            (not (holding ?x)) 
            (clear ?x) 
            (ontable ?x) 
            (handempty)
            (increase (total-cost) 1)
        )
    )

    ;; Stack a held block onto another clear block
    (:action stack
        :parameters (?x - block ?y - block)
        :precondition (and 
            (holding ?x) 
            (clear ?y)
        )
        :effect (and 
            (not (holding ?x)) 
            (not (clear ?y)) 
            (on ?x ?y) 
            (clear ?x) 
            (handempty)
            (increase (total-cost) 1)
        )
    )
)