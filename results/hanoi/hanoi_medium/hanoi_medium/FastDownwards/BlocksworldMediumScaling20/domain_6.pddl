(define (domain hanoi-5-disks)
    (:requirements :strips :typing :negative-preconditions)
    (:types 
        disk 
        peg
    )
    (:predicates
        (smaller ?d1 - disk ?d2 - disk) ; Static size relationship (d1 is smaller than d2)
        (on ?d1 - disk ?d2 - disk)      ; d1 is directly on d2
        (on-peg ?d - disk ?p - peg)     ; d is resting on the base of peg p
        (clear ?d - disk)               ; No disk is on d
        (peg-empty ?p - peg)            ; Peg p has no disks
    )

    ;; 1. Move D from D_FROM onto EMPTY Peg P_TO (D was on top of a stack)
    (:action move-disk-to-empty-peg
        :parameters (?d - disk ?df - disk ?pt - peg)
        :precondition (and
            (clear ?d)
            (on ?d ?df)
            (peg-empty ?pt)
        )
        :effect (and
            (not (on ?d ?df))
            (clear ?df)
            (on-peg ?d ?pt)
            (not (peg-empty ?pt))
        )
    )

    ;; 2. Move D from D_FROM onto Disk D_TO (D was on top of a stack, D_TO is clear)
    (:action move-disk-to-disk
        :parameters (?d - disk ?df - disk ?dt - disk)
        :precondition (and
            (clear ?d)
            (on ?d ?df)
            (clear ?dt)
            (smaller ?d ?dt) ; Size constraint: D must be smaller than DT
        )
        :effect (and
            (not (on ?d ?df))
            (on ?d ?dt)
            (clear ?df)
            (not (clear ?dt)) 
        )
    )

    ;; 3. Move D from Peg P_FROM onto EMPTY Peg P_TO (D was the bottom disk on P_FROM)
    (:action move-bottom-disk-to-empty-peg
        :parameters (?d - disk ?pf - peg ?pt - peg)
        :precondition (and
            (clear ?d)
            (on-peg ?d ?pf)
            (peg-empty ?pt)
        )
        :effect (and
            (not (on-peg ?d ?pf))
            (peg-empty ?pf)
            (on-peg ?d ?pt)
            (not (peg-empty ?pt))
        )
    )

    ;; 4. Move D from Peg P_FROM onto Disk D_TO (D was the bottom disk on P_FROM, D_TO is clear)
    (:action move-bottom-disk-to-disk
        :parameters (?d - disk ?pf - peg ?dt - disk)
        :precondition (and
            (clear ?d)
            (on-peg ?d ?pf)
            (clear ?dt)
            (smaller ?d ?dt) ; Size constraint
        )
        :effect (and
            (not (on-peg ?d ?pf))
            (peg-empty ?pf)
            (on ?d ?dt)
            (not (clear ?dt))
        )
    )
)