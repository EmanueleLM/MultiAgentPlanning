(define (domain TOWER-OF-HANOI-5)
    (:requirements :typing :negative-preconditions :action-costs)
    (:types
        disk
        peg
    )
    (:predicates
        (on-disk ?d1 - disk ?d2 - disk) ; d1 is immediately on d2
        (on-peg ?d - disk ?p - peg)     ; d is resting directly on peg p (at the bottom)
        (clear ?d - disk)               ; d has nothing stacked on it
        (peg-empty ?p - peg)            ; peg p is completely empty
        (smaller ?d1 - disk ?d2 - disk) ; d1 is smaller than d2 (Static)
    )
    (:functions
        (total-cost)
    )

    ; Move Disk D from Disk F to Peg T
    (:action move_D_fromDisk_toPeg
        :parameters (?d - disk ?f - disk ?t - peg)
        :precondition (and
            (clear ?d)
            (on-disk ?d ?f)
            (peg-empty ?t)
        )
        :effect (and
            (not (on-disk ?d ?f))
            (on-peg ?d ?t)
            (clear ?f)
            (not (peg-empty ?t))
            (increase (total-cost) 1)
        )
    )

    ; Move Disk D from Disk F to Disk T (D must be smaller than T)
    (:action move_D_fromDisk_toDisk
        :parameters (?d - disk ?f - disk ?t - disk)
        :precondition (and
            (clear ?d)
            (on-disk ?d ?f)
            (clear ?t)
            (smaller ?d ?t)
        )
        :effect (and
            (not (on-disk ?d ?f))
            (on-disk ?d ?t)
            (clear ?f)
            (not (clear ?t))
            (increase (total-cost) 1)
        )
    )

    ; Move Disk D from Peg F to Disk T (D must be smaller than T)
    (:action move_D_fromPeg_toDisk
        :parameters (?d - disk ?f - peg ?t - disk)
        :precondition (and
            (clear ?d)
            (on-peg ?d ?f)
            (clear ?t)
            (smaller ?d ?t)
        )
        :effect (and
            (not (on-peg ?d ?f))
            (on-disk ?d ?t)
            (peg-empty ?f)
            (not (clear ?t))
            (increase (total-cost) 1)
        )
    )

    ; Move Disk D from Peg F to Peg T
    (:action move_D_fromPeg_toPeg
        :parameters (?d - disk ?f - peg ?t - peg)
        :precondition (and
            (clear ?d)
            (on-peg ?d ?f)
            (peg-empty ?t)
        )
        :effect (and
            (not (on-peg ?d ?f))
            (on-peg ?d ?t)
            (peg-empty ?f)
            (not (peg-empty ?t))
            (increase (total-cost) 1)
        )
    )
)