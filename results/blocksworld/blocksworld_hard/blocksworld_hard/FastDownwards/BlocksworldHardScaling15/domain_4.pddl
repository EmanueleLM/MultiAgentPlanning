(define (domain blocks-world)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        block
    )
    (:predicates
        (on ?b1 - block ?b2 - block)
        (on-table ?b - block)
        (clear ?b - block)
        (holding ?b - block)
        (handempty)
    )

    ;; Pick up a block from the table
    (:action pick-up
        :parameters (?b - block)
        :precondition (and 
            (handempty)
            (on-table ?b)
            (clear ?b)
        )
        :effect (and
            (not (handempty))
            (holding ?b)
            (not (on-table ?b))
            (not (clear ?b))
        )
    )

    ;; Put down a block onto the table
    (:action put-down
        :parameters (?b - block)
        :precondition (holding ?b)
        :effect (and
            (handempty)
            (not (holding ?b))
            (on-table ?b)
            (clear ?b)
        )
    )

    ;; Stack B1 on B2
    (:action stack
        :parameters (?b1 - block ?b2 - block)
        :precondition (and
            (holding ?b1)
            (clear ?b2)
        )
        :effect (and
            (handempty)
            (not (holding ?b1))
            (on ?b1 ?b2)
            (not (clear ?b2))
            (clear ?b1)
        )
    )

    ;; Unstack B1 from B2
    (:action unstack
        :parameters (?b1 - block ?b2 - block)
        :precondition (and
            (handempty)
            (on ?b1 ?b2)
            (clear ?b1)
        )
        :effect (and
            (not (handempty))
            (holding ?b1)
            (clear ?b2)
            (not (on ?b1 ?b2))
            (not (clear ?b1))
        )
    )
)