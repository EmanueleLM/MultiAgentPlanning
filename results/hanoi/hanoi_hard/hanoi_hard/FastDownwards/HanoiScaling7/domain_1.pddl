(define (domain hanoi-6disk)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types
        disk peg
    )
    (:predicates
        (on ?d1 - disk ?d2 - disk)          ; d1 is immediately on d2
        (clear ?d - disk)                   ; d has nothing on top
        (smaller ?d1 - disk ?d2 - disk)     ; d1 is smaller than d2 (static)
        (loc ?d - disk ?p - peg)            ; d is located at peg p
        (peg-empty ?p - peg)                ; p has no disks
        (base-of ?d - disk ?p - peg)        ; d is the lowest disk resting on peg p
    )
    (:functions
        (total-cost)
    )

    ; 1. Move Disk D from Disk D_S onto Disk D_T
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

    ; 3. Move Disk D from Peg P_S onto Disk D_T (D must be the base of P_S)
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
            (peg-empty ?p_from)
            (on ?d ?dt)
            (not (clear ?dt))
            (not (loc ?d ?p_from))
            (loc ?d ?p_to)
        )
    )

    ; 4. Move Disk D from Peg P_S onto Empty Peg P_T (D must be the base of P_S)
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
)