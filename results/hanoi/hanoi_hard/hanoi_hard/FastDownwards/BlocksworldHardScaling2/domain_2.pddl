(define (domain tower-of-hanoi)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        disk peg
    )
    (:predicates
        (on ?d1 - disk ?d2 - disk)     ; d1 is directly on d2
        (on-peg ?d - disk ?p - peg)    ; d is the base disk on peg p
        (clear ?d - disk)              ; d is available to move (nothing on top)
        (peg-clear ?p - peg)           ; p has no disks
        (smaller ?d1 - disk ?d2 - disk) ; Static size relation: d1 is smaller than d2
        (holding ?d - disk)
        (handempty)
    )

    ; 1A. Lift disk D from disk D_under
    (:action lift-from-disk
        :parameters (?d - disk ?d_under - disk)
        :precondition (and
            (on ?d ?d_under)
            (clear ?d)
            (handempty)
        )
        :effect (and
            (holding ?d)
            (clear ?d_under)
            (not (on ?d ?d_under))
            (not (clear ?d))
            (not (handempty))
        )
    )

    ; 1B. Lift disk D from peg base P
    (:action lift-from-peg
        :parameters (?d - disk ?p - peg)
        :precondition (and
            (on-peg ?d ?p)
            (clear ?d)
            (handempty)
        )
        :effect (and
            (holding ?d)
            (peg-clear ?p)
            (not (on-peg ?d ?p))
            (not (clear ?d))
            (not (handempty))
        )
    )
    
    ; 2A. Place disk D onto another disk D_top
    (:action place-on-disk
        :parameters (?d - disk ?d_top - disk)
        :precondition (and
            (holding ?d)
            (clear ?d_top)
            (smaller ?d ?d_top) ; Constraint: D must be smaller than D_top
        )
        :effect (and
            (on ?d ?d_top)
            (clear ?d)
            (handempty)
            (not (holding ?d))
            (not (clear ?d_top))
        )
    )

    ; 2B. Place disk D onto empty peg P
    (:action place-on-peg
        :parameters (?d - disk ?p - peg)
        :precondition (and
            (holding ?d)
            (peg-clear ?p)
        )
        :effect (and
            (on-peg ?d ?p)
            (clear ?d)
            (handempty)
            (not (holding ?d))
            (not (peg-clear ?p))
        )
    )