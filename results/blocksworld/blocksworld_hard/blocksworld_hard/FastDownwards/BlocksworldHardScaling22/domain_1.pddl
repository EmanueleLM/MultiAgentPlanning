(define (domain blocksworld)
    (:requirements :strips :typing :negative-preconditions)
    (:types block)
    (:predicates
        (on ?b1 - block ?b2 - block)
        (on-table ?b - block)
        (clear ?b - block)
        (holding ?b - block)
        (hand-empty)
    )

    ;; Action 1: Pick up a block from the table
    (:action pick-up
        :parameters (?b - block)
        :precondition (and
            (hand-empty)
            (on-table ?b)
            (clear ?b)
        )
        :effect (and
            (not (hand-empty))
            (holding ?b)
            (not (on-table ?b))
            (not (clear ?b)) ; Must become NOT clear when held (Constraint 2)
        )
    )

    ;; Action 2: Unstack a block from another block
    (:action unstack
        :parameters (?b1 - block ?b2 - block)
        :precondition (and
            (hand-empty)
            (on ?b1 ?b2)
            (clear ?b1)
        )
        :effect (and
            (not (hand-empty))
            (holding ?b1)
            (not (on ?b1 ?b2))
            (clear ?b2) ; B2 becomes clear
            (not (clear ?b1)) ; B1 must become NOT clear when held (Constraint 2)
        )
    )

    ;; Action 3: Put down a block onto the table
    (:action put-down
        :parameters (?b - block)
        :precondition (holding ?b)
        :effect (and
            (hand-empty)
            (not (holding ?b))
            (on-table ?b)
            (clear ?b) ; B is now clear (not held, nothing on top)
        )
    )

    ;; Action 4: Stack a block onto another block
    (:action stack
        :parameters (?b1 - block ?b2 - block)
        :precondition (and
            (holding ?b1)
            (clear ?b2)
            (not (= ?b1 ?b2))
        )
        :effect (and
            (hand-empty)
            (not (holding ?b1))
            (on ?b1 ?b2)
            (not (clear ?b2)) ; B2 loses clarity (Constraint 9)
            (clear ?b1) ; B1 gains clarity (not held, nothing on top)
        )
    )
)