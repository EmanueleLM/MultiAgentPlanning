(define (domain tower-of-hanoi)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        disk
        peg
    )
    (:predicates
        (on ?d - disk ?h - (either disk peg)) ; d is immediately on h
        (clear ?h - (either disk peg))       ; h has nothing on it
        (smaller ?d1 - disk ?d2 - disk)      ; d1 < d2 (Static)
    )

    ;; Action 1: Move disk D from H_from (disk or peg) to empty peg P_to
    (:action move-d-to-peg
        :parameters (?d - disk ?h_from - (either disk peg) ?p_to - peg)
        :precondition (and
            ; Rules 1 & 2: Disk must be clear (top disk) and on its source location
            (on ?d ?h_from)
            (clear ?d)
            ; Target must be clear/empty
            (clear ?p_to)
        )
        :effect (and
            ; Remove old position
            (not (on ?d ?h_from))
            (clear ?h_from)
            ; Set new position
            (on ?d ?p_to)
            (not (clear ?p_to))
        )
    )

    ;; Action 2: Move disk D from H_from (disk or peg) onto disk D_to
    (:action move-d-to-disk
        :parameters (?d - disk ?h_from - (either disk peg) ?d_to - disk)
        :precondition (and
            ; Rules 1 & 2: Disk must be clear (top disk) and on its source location
            (on ?d ?h_from)
            (clear ?d)
            ; Target disk must be clear
            (clear ?d_to)
            ; Rule 3: Never place a larger disk on a smaller disk
            (smaller ?d ?d_to)
        )
        :effect (and
            ; Remove old position
            (not (on ?d ?h_from))
            (clear ?h_from)
            ; Set new position
            (on ?d ?d_to)
            (not (clear ?d_to))
        )
    )
)