(define (domain blocksworld)
    (:requirements :strips :typing :negative-preconditions)
    (:types block)
    (:predicates
        (on ?b1 - block ?b2 - block)
        (on-table ?b - block)
        (clear ?b - block) ; ?b has nothing stacked on it
        (holding ?b - block) ; hand is holding ?b
        (hand-empty)
    )

    ;; Pick up a block from the table
    (A_PICKUP
        :parameters (?b - block)
        :precondition (and
            (on-table ?b)
            (clear ?b)
            (hand-empty)
        )
        :effect (and
            (holding ?b)
            (not (on-table ?b))
            (not (clear ?b))
            (not (hand-empty))
        )
    )

    ;; Unstack a block b1 from b2
    (A_UNSTACK
        :parameters (?b1 - block ?b2 - block)
        :precondition (and
            (on ?b1 ?b2)
            (clear ?b1)
            (hand-empty)
        )
        :effect (and
            (holding ?b1)
            (clear ?b2)
            (not (on ?b1 ?b2))
            (not (clear ?b1))
            (not (hand-empty))
        )
    )

    ;; Put down a block onto the table
    (A_PUTDOWN
        :parameters (?b - block)
        :precondition (holding ?b)
        :effect (and
            (on-table ?b)
            (clear ?b)
            (hand-empty)
            (not (holding ?b))
        )
    )

    ;; Stack a block b1 onto b2
    (A_STACK
        :parameters (?b1 - block ?b2 - block)
        :precondition (and
            (holding ?b1)
            (clear ?b2)
        )
        :effect (and
            (on ?b1 ?b2)
            (clear ?b1) ; The stacked block is now clear
            (hand-empty)
            (not (holding ?b1))
            (not (clear ?b2)) ; The block underneath is no longer clear
        )
    )
)