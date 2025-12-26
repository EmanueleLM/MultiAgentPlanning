(define (domain hanoi-6disk)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types
        disk peg
    )
    (:predicates
        (on ?d1 - disk ?d2 - disk)
        (clear ?d - disk)
        (smaller ?d1 - disk ?d2 - disk)
        (loc ?d - disk ?p - peg)
        (peg-empty ?p - peg)
        (base-of ?d - disk ?p - peg)
    )
    (:functions
        (total-cost)
    )

    ; 1. Move Disk D from Disk D_S onto Disk D_T
    ; Precondition: D is clear, D is on DS (which must be on P_from), DT is clear (on P_to), D < DT
    (:action move-D-D
        :parameters (?d ?ds ?dt - disk ?p_from ?p_to - peg)
        :precondition (and
            (clear ?d)
            (on ?d ?ds)
            (loc ?d ?p_from)
            (loc ?ds ?p_from)
            (clear ?dt)
            (loc ?dt ?p_to)
            (smaller ?d ?dt)
            (not (= ?p_from ?p_to))
        )
        :effect (and
            (increase (total-cost) 1)
            (not (on ?d ?ds))
            (clear ?ds)
            (on ?d ?dt)
            (not (clear ?dt))
            (not (loc ?d ?p_from))
            (loc ?d ?p_to)
        )
    )

    ; 2. Move Disk D from Disk D_S onto Empty Peg P_T
    ; Precondition: D is clear, D is on DS (which must be on P_from), P_T is empty
    (:action move-D-P
        :parameters (?d ?ds - disk ?p_from ?p_to - peg)
        :precondition (and
            (clear ?d)
            (on ?d ?ds)
            (loc ?d ?p_from)
            (loc ?ds ?p_from)
            (peg-empty ?p_to)
            (not (= ?p_from ?p_to))
        )
        :effect (and
            (increase (total-cost) 1)
            (not (on ?d ?ds))
            (clear ?ds)
            (not (peg-empty ?p_to))
            (base-of ?d ?p_to)
            (not (loc ?d ?p_from))
            (loc ?d ?p_to)
        )
    )

    ; 3. Move Disk D from Peg P_S onto Disk D_T (D must be the base of P_S and clear)
    ; Precondition: D is clear, D is base of P_S, DT is clear (on P_to), D < DT
    (:action move-P-D
        :parameters (?d ?dt - disk ?p_from ?p_to - peg)
        :precondition (and
            (clear ?d)
            (base-of ?d ?p_from)
            (loc ?d ?p_from)
            (clear ?dt)
            (loc ?dt ?p_to)
            (smaller ?d ?dt)
            (not (= ?p_from ?p_to))
        )
        :effect (and
            (increase (total-cost) 1)
            (not (base-of ?d ?p_from))
            (peg-empty ?p_from) ; P_from becomes empty because D was the sole disk (since D was base AND clear)
            (on ?d ?dt)
            (not (clear ?dt))
            (not (loc ?d ?p_from))
            (loc ?d ?p_to)
        )
    )

    ; 4. Move Disk D from Peg P_S onto Empty Peg P_T (D must be the base of P_S and clear)
    ; Precondition: D is clear, D is base of P_S, P_T is empty
    (:action move-P-P
        :parameters (?d - disk ?p_from ?p_to - peg)
        :precondition (and
            (clear ?d)
            (base-of ?d ?p_from)
            (loc ?d ?p_from)
            (peg-empty ?p_to)
            (not (= ?p_from ?p_to))
        )
        :effect (and
            (increase (total-cost) 1)
            (not (base-of ?d ?p_from))
            (peg-empty ?p_from)
            (not (peg-empty ?p_to))
            (base-of ?d ?p_to)
            (not (loc ?d ?p_from))
            (loc ?d ?p_to)
        )
    )