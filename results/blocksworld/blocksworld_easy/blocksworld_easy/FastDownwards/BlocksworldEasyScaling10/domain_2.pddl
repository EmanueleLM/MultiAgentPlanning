(define (domain blocksworld)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        block
    )
    (:predicates
        (on ?x - block ?y - block)
        (on-table ?x - block)
        (clear ?x - block) ; Defined strictly as: Nothing on top AND not being held
        (holding ?x - block)
        (hand-empty)
    )

    ;; Action: pick-up (from table)
    (:action pick-up
        :parameters (?x - block)
        :precondition (and
            (clear ?x)
            (on-table ?x)
            (hand-empty)
        )
        :effect (and
            (holding ?x)
            (not (on-table ?x))
            (not (hand-empty))
            (not (clear ?x)) ; Required effect: No longer clear because it is now held
        )
    )

    ;; Action: put-down (onto table)
    (:action put-down
        :parameters (?x - block)
        :precondition (holding ?x)
        :effect (and
            (on-table ?x)
            (hand-empty)
            (not (holding ?x))
            (clear ?x) ; Required effect: Now clear because it is on the table and not held
        )
    )

    ;; Action: unstack (from block y)
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
            (not (on ?x ?y))
            (not (hand-empty))
            (not (clear ?x)) ; Required effect: No longer clear because it is now held
        )
    )

    ;; Action: stack (onto block y)
    (:action stack
        :parameters (?x - block ?y - block)
        :precondition (and
            (holding ?x)
            (clear ?y)
        )
        :effect (and
            (on ?x ?y)
            (hand-empty)
            (not (holding ?x))
            (not (clear ?y)) ; Y is no longer clear (X is on it)
            (clear ?x)       ; Required effect: X is now clear (nothing on it, not held)
        )
    )