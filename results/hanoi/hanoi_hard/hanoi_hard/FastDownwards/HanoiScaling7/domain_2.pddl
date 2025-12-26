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
    ; D is on D_S, moving from P_from to P_to, placing D on D_T
    (:action move-D-D
        :parameters (?d ?ds ?dt - disk ?p_from ?p_to - peg)
        :precondition (and
            (clear ?d)                      ; D is the top disk
            (on ?d ?ds)                     ; D is currently on D_S
            (loc ?d ?p_from)                ; D is at P_from
            (loc ?ds ?p_from)               ; D_S is also at P_from
            (clear ?dt)                     ; D_T must be clear to receive D
            (loc ?dt ?p_to)                 ; D_T is at P_to
            (smaller ?d ?dt)                ; D must be smaller than D_T (Hanoi rule)
            (not (= ?p_from ?p_to))
        )
        :effect (and
            (increase (total-cost) 1)
            (not (on ?d ?ds))               ; D is no longer on D_S
            (clear ?ds)                     ; D_S is now clear
            (on ?d ?dt)                     ; D is now on D_T
            (not (clear ?dt))               ; D_T is no longer clear
            (not (loc ?d ?p_from))          ; D moved off P_from
            (loc ?d ?p_to)                  ; D moved to P_to
        )
    )

    ; 2. Move Disk D from Disk D_S onto Empty Peg P_T
    ; D is on D_S, moving from P_from to P_to, placing D as base disk on P_T
    (:action move-D-P
        :parameters (?d ?ds - disk ?p_from ?p_to - peg)
        :precondition (and
            (clear ?d)                      ; D is the top disk
            (on ?d ?ds)                     ; D is currently on D_S
            (loc ?d ?p_from)
            (loc ?ds ?p_from)
            (peg-empty ?p_to)               ; P_T must be empty
            (not (= ?p_from ?p_to))
        )
        :effect (and
            (increase (total-cost) 1)
            (not (on ?d ?ds))               ; D is no longer on D_S
            (clear ?ds)                     ; D_S is now clear
            (not (peg-empty ?p_to))         ; P_T is no longer empty
            (base-of ?d ?p_to)              ; D is the new base of P_T
            (not (loc ?d ?p_from))
            (loc ?d ?p_to)
        )
    )

    ; 3. Move Disk D from Peg P_S onto Disk D_T (D must be the base of P_S)
    ; D is the base disk on P_S, moving to P_to, placing D on D_T
    (:action move-P-D
        :parameters (?d ?dt - disk ?p_from ?p_to - peg)
        :precondition (and
            (clear ?d)                      ; D is the top disk
            (base-of ?d ?p_from)            ; D is the base of P_from
            (loc ?d ?p_from)
            (clear ?dt)                     ; D_T must be clear
            (loc ?dt ?p_to)
            (smaller ?d ?dt)                ; D must be smaller than D_T (Hanoi rule)
            (not (= ?p_from ?p_to))
        )
        :effect (and
            (increase (total-cost) 1)
            (not (base-of ?d ?p_from))      ; D is no longer the base
            (peg-empty ?p_from)             ; P_from is now empty
            (on ?d ?dt)                     ; D is now on D_T
            (not (clear ?dt))               ; D_T is no longer clear
            (not (loc ?d ?p_from))
            (loc ?d ?p_to)
        )
    )

    ; 4. Move Disk D from Peg P_S onto Empty Peg P_T (D must be the base of P_S)
    ; D is the base disk on P_S, moving to P_to, placing D as base disk on P_T
    (:action move-P-P
        :parameters (?d - disk ?p_from ?p_to - peg)
        :precondition (and
            (clear ?d)                      ; D is the top disk
            (base-of ?d ?p_from)            ; D is the base of P_from
            (loc ?d ?p_from)
            (peg-empty ?p_to)               ; P_T must be empty
            (not (= ?p_from ?p_to))
        )
        :effect (and
            (increase (total-cost) 1)
            (not (base-of ?d ?p_from))      ; D is no longer the base of P_from
            (peg-empty ?p_from)             ; P_from is now empty
            (not (peg-empty ?p_to))         ; P_T is no longer empty
            (base-of ?d ?p_to)              ; D is the new base of P_T
            (not (loc ?d ?p_from))
            (loc ?d ?p_to)
        )
    )
)