(define (domain hanoi-6-disks)
    (:requirements :typing :action-costs)
    (:types
        base ; Abstract base type for pegs and disks
        peg - base
        disk - base
    )
    (:predicates
        (on ?d - disk ?b - base) ; d is on base b (disk or peg)
        (clear ?b - base) ; b is exposed (top disk) or empty (peg)
        (smaller ?d1 - disk ?d2 - disk) ; d1 is smaller than d2 (static)
    )

    (:functions
        (total-cost) - number
    )

    ; Action 1: Move Disk D onto Peg P_TO (P_TO must be clear/empty)
    (:action move-to-peg
        :parameters (?d - disk ?b_from - base ?p_to - peg)
        :precondition (and
            (on ?d ?b_from)    ; D must be on its source base B_FROM
            (clear ?d)         ; D must be the top disk
            (clear ?p_to)      ; P_TO must be empty
        )
        :effect (and
            (not (on ?d ?b_from))
            (on ?d ?p_to)
            (clear ?b_from)     ; B_FROM is now exposed/empty
            (not (clear ?p_to)) ; P_TO is now occupied
            (increase (total-cost) 1)
        )
    )

    ; Action 2: Move Disk D onto Disk D_TO (D must be smaller than D_TO, D_TO must be clear)
    (:action move-to-disk
        :parameters (?d - disk ?b_from - base ?d_to - disk)
        :precondition (and
            (on ?d ?b_from)    ; D must be on its source base B_FROM
            (clear ?d)         ; D must be the top disk
            (clear ?d_to)      ; D_TO must be exposed
            ; Size constraint: D must be strictly smaller than D_TO.
            (smaller ?d ?d_to) 
        )
        :effect (and
            (not (on ?d ?b_from))
            (on ?d ?d_to)
            (clear ?b_from)     ; B_FROM is now exposed/empty
            (not (clear ?d_to)) ; D_TO is now covered
            (increase (total-cost) 1)
        )
    )
)