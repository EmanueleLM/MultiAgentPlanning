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
    ; Disk ?d moves from disk ?f to peg ?t. ?f becomes clear.
    (:action move-disk-to-peg
        :parameters (?d - disk ?f - disk ?t - peg)
        :precondition (and
            (on ?d ?f)
            (clear ?d)
        )
        :effect (and
            (not (on ?d ?f))
            (on ?d ?t)
            (clear ?f)
            (increase (total-cost) 1)
        )
    )

    ; 3. Move Peg to Disk (P->D)
    ; Disk ?d moves from peg ?f to disk ?t. ?t must be clear and larger than ?d. ?t becomes covered.
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
            (increase (total-cost) 1)
        )
    )

    ; 4. Move Peg to Peg (P->P)
    ; Disk ?d moves from peg ?f to peg ?t.
    (:action move-peg-to-peg
        :parameters (?d - disk ?f - peg ?t - peg)
        :precondition (and
            (on ?d ?f)
            (clear ?d)
            (not (= ?f ?t))
        )
        :effect (and
            (not (on ?d ?f))
            (on ?d ?t)
            (increase (total-cost) 1)
        )
    )
)