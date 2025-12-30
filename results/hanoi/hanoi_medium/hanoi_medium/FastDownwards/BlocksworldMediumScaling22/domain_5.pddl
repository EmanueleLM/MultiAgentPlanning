(define (domain hanoi-5-disks)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        disk peg
    )
    (:predicates
        (on ?d1 - disk ?d2 - disk)     ; d1 is on d2
        (on ?d - disk ?p - peg)        ; d is the base disk on peg p
        (clear ?d - disk)              ; d is the top disk
        (peg-clear ?p - peg)           ; peg p is empty
        (smaller ?d1 - disk ?d2 - disk) ; d1 is smaller than d2
    )

    ; Action 1: Move D from Disk L1 to Disk L2
    ; Preconditions: D is clear, D is on L1, L2 is clear, D is smaller than L2.
    (:action move-D-from-D-to-D
        :parameters (?d - disk ?l1 - disk ?l2 - disk)
        :precondition (and
            (clear ?d)
            (on ?d ?l1)
            (clear ?l2)
            (smaller ?d ?l2)
        )
        :effect (and
            (not (on ?d ?l1))
            (not (clear ?l2))
            (on ?d ?l2)
            (clear ?l1)
        )
    )

    ; Action 2: Move D from Disk L1 to Peg P2 (P2 must be empty)
    (:action move-D-from-D-to-P
        :parameters (?d - disk ?l1 - disk ?p2 - peg)
        :precondition (and
            (clear ?d)
            (on ?d ?l1)
            (peg-clear ?p2)
        )
        :effect (and
            (not (on ?d ?l1))
            (on ?d ?p2)
            (clear ?l1)
            (not (peg-clear ?p2))
        )
    )

    ; Action 3: Move D from Peg P1 to Disk L2
    ; Preconditions: D is clear, D is on P1, L2 is clear, D is smaller than L2.
    (:action move-D-from-P-to-D
        :parameters (?d - disk ?p1 - peg ?l2 - disk)
        :precondition (and
            (clear ?d)
            (on ?d ?p1)
            (clear ?l2)
            (smaller ?d ?l2)
        )
        :effect (and
            (not (on ?d ?p1))
            (not (clear ?l2))
            (on ?d ?l2)
            (peg-clear ?p1)
        )
    )

    ; Action 4: Move D from Peg P1 to Peg P2 (P2 must be empty)
    (:action move-D-from-P-to-P
        :parameters (?d - disk ?p1 - peg ?p2 - peg)
        :precondition (and
            (clear ?d)
            (on ?d ?p1)
            (peg-clear ?p2)
        )
        :effect (and
            (not (on ?d ?p1))
            (on ?d ?p2)
            (peg-clear ?p1)
            (not (peg-clear ?p2))
        )
    )
)