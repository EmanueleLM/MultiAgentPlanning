(define (domain blocksworld)
    (:requirements :strips :typing :negative-preconditions)
    (:types block)
    (:predicates
        (on ?x - block ?y - block)
        (on-table ?x - block)
        ; A block is clear if it has no blocks on top AND is not picked up (held).
        (clear ?x - block) 
        (holding ?x - block)
        (hand-empty)
    )

    ;; A1: Pick up a block from the table
    (:action pick-up
        :parameters (?x - block)
        :precondition (and
            (clear ?x)
            (on-table ?x)
            (hand-empty)
        )
        :effect (and
            (holding ?x)
            (not (clear ?x)) ; No longer clear because it is picked up
            (not (on-table ?x))
            (not (hand-empty))
        )
    )

    ;; A2: Unstack a block from another block
    (:action unstack
        :parameters (?x - block ?y - block)
        :precondition (and
            (on ?x ?y)
            (clear ?x)
            (hand-empty)
        )
        :effect (and
            (holding ?x)
            (clear ?y)
            (not (clear ?x)) ; No longer clear because it is picked up
            (not (on ?x ?y))
            (not (hand-empty))
        )
    )

    ;; A3: Put down a block onto the table
    (:action put-down
        :parameters (?x - block)
        :precondition (holding ?x)
        :effect (and
            (on-table ?x)
            (clear ?x) ; Now it is not held and nothing is on top.
            (hand-empty)
            (not (holding ?x))
        )
    )

    ;; A4: Stack a block onto another block
    (:action stack
        :parameters (?x - block ?y - block)
        :precondition (and
            (holding ?x)
            (clear ?y)
        )
        :effect (and
            (on ?x ?y)
            (clear ?x) ; Now it is not held and nothing is on top.
            (hand-empty)
            (not (holding ?x))
            (not (clear ?y)) ; Y is no longer clear
        )
    )
)