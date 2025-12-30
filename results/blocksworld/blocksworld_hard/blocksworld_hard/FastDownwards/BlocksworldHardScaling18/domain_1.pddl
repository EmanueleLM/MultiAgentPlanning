(define (domain blocksworld-hard)
    (:requirements :strips :typing :negative-preconditions)
    (:types block)
    (:predicates
        (on ?x - block ?y - block)
        (on-table ?x - block)
        (clear ?x - block)
        (holding ?x - block)
        (hand-empty)
    )

    ;; Action A: Pick up X from table
    ;; Preconditions: hand_empty, clear(X), on_table(X).
    ;; Effects: holding(X), X is not clear, hand not empty, X not on table.
    (:action pick-up
        :parameters (?x - block)
        :precondition (and 
            (clear ?x) 
            (on-table ?x) 
            (hand-empty)
        )
        :effect (and 
            (not (on-table ?x)) 
            (not (clear ?x)) 
            (not (hand-empty)) 
            (holding ?x)
        )
    )

    ;; Action B: Unstack X from Y
    ;; Preconditions: hand_empty, clear(X), on(X, Y).
    ;; Effects: holding(X), X is not clear, hand not empty, Y becomes clear, X not on Y.
    (:action unstack
        :parameters (?x - block ?y - block)
        :precondition (and 
            (on ?x ?y) 
            (clear ?x) 
            (hand-empty)
        )
        :effect (and 
            (not (on ?x ?y)) 
            (not (clear ?x)) 
            (not (hand-empty)) 
            (holding ?x) 
            (clear ?y)
        )
    )

    ;; Action C: Put down X onto table
    ;; Preconditions: holding(X).
    ;; Effects: X on table, X is clear, hand empty, not holding X.
    (:action put-down
        :parameters (?x - block)
        :precondition (holding ?x)
        :effect (and 
            (not (holding ?x)) 
            (on-table ?x) 
            (clear ?x) 
            (hand-empty)
        )
    )

    ;; Action D: Stack X onto Y
    ;; Preconditions: holding(X), clear(Y).
    ;; Effects: X on Y, Y is not clear, X is clear, hand empty, not holding X.
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
            (hand-empty)
        )
    )
)