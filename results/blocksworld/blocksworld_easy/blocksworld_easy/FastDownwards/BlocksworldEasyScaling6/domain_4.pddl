(define (domain blocksworld-4-blocks)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        block - object
    )
    (:predicates
        (on ?b1 - block ?b2 - block)
        (on-table ?b - block)
        (clear ?b - block)
        (holding ?b - block)
        (hand-empty)
    )

    ; Pick up a block (from table)
    ; Pre: on table, clear (nothing on it), hand empty.
    ; Effect: holding, not on table, not clear (because it is held).
    (:action pick-up
        :parameters (?b - block)
        :precondition (and
            (clear ?b)
            (on-table ?b)
            (hand-empty)
        )
        :effect (and
            (holding ?b)
            (not (clear ?b))
            (not (on-table ?b))
            (not (hand-empty))
        )
    )

    ; Unstack a block (from another block)
    ; Pre: on top of ?b2, clear ?b1, hand empty.
    ; Effect: holding, not on ?b2, ?b2 becomes clear, ?b1 is no longer clear (because it is held).
    (:action unstack
        :parameters (?b1 - block ?b2 - block)
        :precondition (and
            (on ?b1 ?b2)
            (clear ?b1)
            (hand-empty)
        )
        :effect (and
            (holding ?b1)
            (not (clear ?b1))
            (clear ?b2)
            (not (on ?b1 ?b2))
            (not (hand-empty))
        )
    )

    ; Put down a block (to table)
    ; Pre: holding ?b.
    ; Effect: on table, clear (since it's on the table and not held), hand empty.
    (:action put-down
        :parameters (?b - block)
        :precondition (holding ?b)
        :effect (and
            (on-table ?b)
            (clear ?b)
            (not (holding ?b))
            (hand-empty)
        )
    )

    ; Stack a block (on another block)
    ; Pre: holding ?b1, ?b2 must be clear.
    ; Effect: ?b1 on ?b2, ?b2 is no longer clear, ?b1 is clear (topmost), hand empty.
    (:action stack
        :parameters (?b1 - block ?b2 - block)
        :precondition (and
            (holding ?b1)
            (clear ?b2)
        )
        :effect (and
            (on ?b1 ?b2)
            (clear ?b1)
            (not (clear ?b2))
            (not (holding ?b1))
            (hand-empty)
        )
    )
)