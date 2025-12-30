(define (domain hanoi-4disk)
    (:requirements :strips :typing :action-costs)
    (:types
        disk peg object
    )
    (:predicates
        (on ?d1 - disk ?x2 - (either disk peg)) ; d1 is immediately on x2
        (clear ?x - (either disk peg))          ; x has nothing on top of it
        (smaller ?d1 - disk ?d2 - disk)         ; d1 < d2 (static constraint)
    )
    (:functions
        (total-cost)
    )

    ;; Action 1: Move disk D from its current base (?x_from) onto an empty PEGGED base (?p_to)
    (:action move-to-peg
        :parameters (?d - disk ?x_from - (either disk peg) ?p_to - peg)
        :precondition (and
            (clear ?d)
            (on ?d ?x_from)
            (clear ?p_to) ; Target peg must be empty
        )
        :effect (and
            (not (on ?d ?x_from))
            (not (clear ?p_to)) ; Peg is no longer clear
            (on ?d ?p_to)
            (clear ?x_from)     ; Source base becomes clear
            (increase (total-cost) 1)
        )
    )

    ;; Action 2: Move disk D from its current base (?x_from) onto another DISK base (?d_to)
    (:action move-to-disk
        :parameters (?d - disk ?x_from - (either disk peg) ?d_to - disk)
        :precondition (and
            (clear ?d)
            (on ?d ?x_from)
            (clear ?d_to)       ; Target disk must be the top disk on its stack
            (smaller ?d ?d_to)  ; Size constraint: smaller disk must be placed on larger disk
        )
        :effect (and
            (not (on ?d ?x_from))
            (not (clear ?d_to)) ; Target disk is no longer clear
            (on ?d ?d_to)
            (clear ?x_from)     ; Source base becomes clear
            (increase (total-cost) 1)
        )
    )
)