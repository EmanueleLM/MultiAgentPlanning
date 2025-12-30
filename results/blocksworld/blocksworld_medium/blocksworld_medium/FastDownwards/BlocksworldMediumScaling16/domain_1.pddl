(define (domain hanoi-5-disks)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types
        disk peg
    )
    (:constants
        peg_L peg_M peg_R - peg
        A B C D E - disk
    )
    (:predicates
        (smaller ?d1 - disk ?d2 - disk) ; d1 < d2 (Static relation)
        (on ?d1 - disk ?d2 - disk) ; d1 is directly on d2
        (on-peg ?d - disk ?p - peg) ; d is the disk resting on peg p surface
        (top-disk ?d - disk) ; d has nothing on top of it
        (clear-peg ?p - peg) ; p has no disks on it
    )
    (:functions
        (total-cost)
    )

    ; Action 1: Move D from disk D1 to disk D2
    (action move-disk-to-disk
        :parameters (?d - disk ?d1 - disk ?d2 - disk)
        :precondition (and
            (top-disk ?d)
            (on ?d ?d1)
            (top-disk ?d2)
            (smaller ?d ?d2) ; Constraint: D must be smaller than D2
        )
        :effect (and
            (not (on ?d ?d1))
            (on ?d ?d2)
            (top-disk ?d1)
            (not (top-disk ?d2))
            (increase (total-cost) 1)
        )
    )

    ; Action 2: Move D from disk D1 to Peg P2 (P2 must be empty)
    (action move-disk-to-peg
        :parameters (?d - disk ?d1 - disk ?p2 - peg)
        :precondition (and
            (top-disk ?d)
            (on ?d ?d1)
            (clear-peg ?p2)
        )
        :effect (and
            (not (on ?d ?d1))
            (on-peg ?d ?p2)
            (top-disk ?d1)
            (not (clear-peg ?p2))
            (increase (total-cost) 1)
        )
    )

    ; Action 3: Move D from Peg P1 to disk D2
    (action move-peg-to-disk
        :parameters (?d - disk ?p1 - peg ?d2 - disk)
        :precondition (and
            (top-disk ?d)
            (on-peg ?d ?p1)
            (top-disk ?d2)
            (smaller ?d ?d2) ; Constraint: D must be smaller than D2
        )
        :effect (and
            (not (on-peg ?d ?p1))
            (on ?d ?d2)
            (clear-peg ?p1)
            (not (top-disk ?d2))
            (increase (total-cost) 1)
        )
    )

    ; Action 4: Move D from Peg P1 to Peg P2 (P2 must be empty)
    (action move-peg-to-peg
        :parameters (?d - disk ?p1 - peg ?p2 - peg)
        :precondition (and
            (top-disk ?d)
            (on-peg ?d ?p1)
            (clear-peg ?p2)
            (not (= ?p1 ?p2))
        )
        :effect (and
            (not (on-peg ?d ?p1))
            (on-peg ?d ?p2)
            (clear-peg ?p1)
            (not (clear-peg ?p2))
            (increase (total-cost) 1)
        )
    )
)