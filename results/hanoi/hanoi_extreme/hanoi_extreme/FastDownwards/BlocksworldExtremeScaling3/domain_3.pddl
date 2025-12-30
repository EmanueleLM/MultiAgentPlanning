(define (domain hanoi-7-disks)
    (:requirements :strips :typing :negative-preconditions :action-costs)

    (:types
        support - object
        disk peg - support
    )

    (:predicates
        (on ?d - disk ?s - support)
        (clear ?d - disk)
        (smaller ?d1 - disk ?d2 - disk)
        (available ?p - peg) ; True if the peg is currently empty
    )

    (:functions
        (total-cost) - number
    )

    ; 1. Move Disk to Disk (D->D)
    ; Disk ?d moves from disk ?f to disk ?t. ?t must be clear and larger than ?d. ?f becomes clear.
    (:action move-disk-to-disk
        :parameters (?d - disk ?f - disk ?t - disk)
        :precondition (and
            (on ?d ?f)
            (clear ?d)
            (clear ?t)
            (smaller ?d ?t)
        )
        :effect (and
            (not (on ?d ?f))
            (on ?d ?t)
            (clear ?f)
            (not (clear ?t))
            (increase (total-cost) 1)
        )
    )

    ; 2. Move Disk to Peg (D->P)
    ; Disk ?d moves from disk ?f to empty peg ?t. ?f becomes clear. ?t becomes occupied.
    (:action move-disk-to-peg
        :parameters (?d - disk ?f - disk ?t - peg)
        :precondition (and
            (on ?d ?f)
            (clear ?d)
            (available ?t)
        )
        :effect (and
            (not (on ?d ?f))
            (on ?d ?t)
            (clear ?f)
            (not (available ?t))
            (increase (total-cost) 1)
        )
    )

    ; 3. Move Peg to Disk (P->D)
    ; Disk ?d moves from peg ?f (base disk) to disk ?t. ?t must be clear and larger than ?d. ?f becomes available.
    (:action move-peg-to-disk
        :parameters (?d - disk ?f - peg ?t - disk)
        :precondition (and
            (on ?d ?f)
            (clear ?d)
            (clear ?t)
            (smaller ?d ?t)
        )
        :effect (and
            (not (on ?d ?f))
            (on ?d ?t)
            (not (clear ?t))
            (available ?f)
            (increase (total-cost) 1)
        )
    )

    ; 4. Move Peg to Peg (P->P)
    ; Disk ?d moves from peg ?f (base disk) to empty peg ?t. ?f becomes available, ?t becomes occupied.
    (:action move-peg-to-peg
        :parameters (?d - disk ?f - peg ?t - peg)
        :precondition (and
            (on ?d ?f)
            (clear ?d)
            (available ?t)
            (not (= ?f ?t))
        )
        :effect (and
            (not (on ?d ?f))
            (on ?d ?t)
            (available ?f)
            (not (available ?t))
            (increase (total-cost) 1)
        )
    )
)