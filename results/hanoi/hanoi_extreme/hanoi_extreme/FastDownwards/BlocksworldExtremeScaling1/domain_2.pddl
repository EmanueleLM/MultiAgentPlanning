(define (domain hanoi-7disk)
    (:requirements :strips :typing :negative-preconditions)
    (:types 
        disk
        peg
    )

    (:predicates
        ; Static size ordering: d1 is strictly smaller than d2
        (is-smaller ?d1 - disk ?d2 - disk)
        
        ; Positioning predicates
        (on-disk ?d1 - disk ?d2 - disk) ; d1 is immediately on d2
        (on-peg ?d - disk ?p - peg)     ; d is immediately on peg p
        
        ; Clearance predicates
        (clear-disk ?d - disk)          ; Disk d is the top disk
        (clear-peg ?p - peg)            ; Peg p is empty
    )

    ; 1. Move Disk D from Disk D_from to Disk D_to
    (:action move-dd
        :parameters (?d - disk ?df - disk ?dt - disk)
        :precondition (and
            (clear-disk ?d)
            (on-disk ?d ?df)
            (clear-disk ?dt)
            (is-smaller ?d ?dt) ; Size constraint: disk must be smaller than the destination disk
        )
        :effect (and
            (not (on-disk ?d ?df))
            (not (clear-disk ?dt))
            (on-disk ?d ?dt)
            (clear-disk ?df)
        )
    )

    ; 2. Move Disk D from Disk D_from to Peg P_to
    (:action move-dp
        :parameters (?d - disk ?df - disk ?pt - peg)
        :precondition (and
            (clear-disk ?d)
            (on-disk ?d ?df)
            (clear-peg ?pt)
        )
        :effect (and
            (not (on-disk ?d ?df))
            (not (clear-peg ?pt))
            (on-peg ?d ?pt)
            (clear-disk ?df)
        )
    )

    ; 3. Move Disk D from Peg P_from to Disk D_to
    (:action move-pd
        :parameters (?d - disk ?pf - peg ?dt - disk)
        :precondition (and
            (clear-disk ?d)
            (on-peg ?d ?pf)
            (clear-disk ?dt)
            (is-smaller ?d ?dt) ; Size constraint: disk must be smaller than the destination disk
        )
        :effect (and
            (not (on-peg ?d ?pf))
            (not (clear-disk ?dt))
            (on-disk ?d ?dt)
            (clear-peg ?pf)
        )
    )

    ; 4. Move Disk D from Peg P_from to Peg P_to
    (:action move-pp
        :parameters (?d - disk ?pf - peg ?pt - peg)
        :precondition (and
            (clear-disk ?d)
            (on-peg ?d ?pf)
            (clear-peg ?pt)
        )
        :effect (and
            (not (on-peg ?d ?pf))
            (not (clear-peg ?pt))
            (on-peg ?d ?pt)
            (clear-peg ?pf)
        )
    )