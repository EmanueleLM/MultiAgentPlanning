(define (domain blocksworld)
    (:requirements :strips :typing :negative-preconditions)
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

    ;; Pick up a block from the table
    (:action pick-up
        :parameters (?b - block)
        :precondition (and
            (ontable ?b)
            (clear ?b)
            (handempty)
        )
        :effect (and
            (holding ?b)
            (not (ontable ?b))
            (not (clear ?b))
            (not (handempty))
        )
    )

    ;; Put down a block onto the table
    (:action put-down
        :parameters (?b - block)
        :precondition (holding ?b)
        :effect (and
            (ontable ?b)
            (clear ?b)
            (handempty)
            (not (holding ?b))
        )
    )

    ;; Unstack a block from another block
    (:action unstack
        :parameters (?b1 - block ?b2 - block)
        :precondition (and
            (on ?b1 ?b2)
            (clear ?b1)
            (handempty)
        )
        :effect (and
            (holding ?b1)
            (clear ?b2)
            (not (on ?b1 ?b2))
            (not (clear ?b1))
            (not (handempty))
        )
    )

    ;; Stack a block onto another block
    (:action stack
        :parameters (?b1 - block ?b2 - block)
        :precondition (and
            (holding ?b1)
            (clear ?b2)
        )
        :effect (and
            (on ?b1 ?b2)
            (clear ?b1)
            (handempty)
            (not (holding ?b1))
            (not (clear ?b2))
        )
    )
)