(define (domain hanoi-5-disk)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        disk peg - location
    )
    
    (:predicates
        (on ?d - disk ?l - location) ; Disk d is resting on location l (disk or peg)
        (clear ?l - location)        ; Location l has nothing resting on it
        (smaller ?d1 - disk ?d2 - disk) ; d1 is smaller than d2 (static)
    )

    ; Action 1: Move disk D from L1 onto a Peg P2
    (:action move-to-peg
        :parameters (?d - disk ?l1 - location ?p2 - peg)
        :precondition (and
            (on ?d ?l1)   ; D must be resting on L1
            (clear ?d)    ; D must be the topmost disk
            (clear ?p2)   ; P2 must be clear (empty)
        )
        :effect (and
            (not (on ?d ?l1))
            (on ?d ?p2)
            (clear ?l1)
            (not (clear ?p2))
        )
    )

    ; Action 2: Move disk D from L1 onto a Disk D2
    (:action move-to-disk
        :parameters (?d - disk ?l1 - location ?d2 - disk)
        :precondition (and
            (on ?d ?l1)   ; D must be resting on L1
            (clear ?d)    ; D must be the topmost disk
            (clear ?d2)   ; D2 must be clear
            (smaller ?d ?d2) ; D must be smaller than D2
        )
        :effect (and
            (not (on ?d ?l1))
            (on ?d ?d2)
            (clear ?l1)
            (not (clear ?d2))
        )
    )
)