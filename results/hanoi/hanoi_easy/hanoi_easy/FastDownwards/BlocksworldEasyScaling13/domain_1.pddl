(define (domain hanoi)
    (:requirements :typing :negative-preconditions :action-costs)
    (:types
        disk peg - object
    )
    (:predicates
        (on ?x - disk ?y - object)  ; X is immediately on Y. Y is either a disk or a peg.
        (clear ?x - object)         ; X is clear (no disk on top)
        (smaller ?d1 - disk ?d2 - disk) ; d1 is smaller than d2
    )
    (:functions
        (total-cost) - number
    )

    ;; Action 1: Move D from Y_from onto Disk D_to
    ;; Size constraint enforced: D must be smaller than D_to
    (:action move-d-to-d
        :parameters (?d - disk ?y_from - object ?d_to - disk)
        :precondition (and
            (clear ?d)
            (on ?d ?y_from)
            (clear ?d_to)
            (smaller ?d ?d_to)
        )
        :effect (and
            (not (on ?d ?y_from))
            (not (clear ?d_to))
            (on ?d ?d_to)
            (clear ?y_from)
            (increase (total-cost) 1)
        )
    )

    ;; Action 2: Move D from Y_from onto Peg P_to (Peg is currently clear/empty)
    (:action move-d-to-p
        :parameters (?d - disk ?y_from - object ?p_to - peg)
        :precondition (and
            (clear ?d)
            (on ?d ?y_from)
            (clear ?p_to)
        )
        :effect (and
            (not (on ?d ?y_from))
            (not (clear ?p_to))
            (on ?d ?p_to)
            (clear ?y_from)
            (increase (total-cost) 1)
        )
    )
)