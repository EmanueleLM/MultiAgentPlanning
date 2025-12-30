(define (domain BlocksworldHardScaling5)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types
        block
    )
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

    ;; Pick up a block from the table
    (action pickup
        :parameters (?b - block)
        :precondition (and
            (clear ?b)
            (ontable ?b)
            (handempty)
        )
        :effect (and
            (holding ?b)
            (not (clear ?b))
            (not (ontable ?b))
            (not (handempty))
            (increase (total-cost) 1)
        )
    )

    ;; Unstack a block from another block
    (action unstack
        :parameters (?b1 - block ?b2 - block)
        :precondition (and
            (on ?b1 ?b2)
            (clear ?b1)
            (handempty)
        )
        :effect (and
            (holding ?b1)
            (clear ?b2)
            (not (clear ?b1))
            (not (on ?b1 ?b2))
            (not (handempty))
            (increase (total-cost) 1)
        )
    )
    
    ;; Put down a block onto the table
    (action putdown
        :parameters (?b - block)
        :precondition (and
            (holding ?b)
        )
        :effect (and
            (ontable ?b)
            (clear ?b)
            (handempty)
            (not (holding ?b))
            (increase (total-cost) 1)
        )
    )

    ;; Stack a block onto another clear block
    (action stack
        :parameters (?b1 - block ?b2 - block) ; b1 is held, b2 is destination
        :precondition (and
            (holding ?b1)
            (clear ?b2)
        )
        :effect (and
            (on ?b1 ?b2)
            (clear ?b1)
            (not (clear ?b2))
            (handempty)
            (not (holding ?b1))
            (increase (total-cost) 1)
        )
    )
)