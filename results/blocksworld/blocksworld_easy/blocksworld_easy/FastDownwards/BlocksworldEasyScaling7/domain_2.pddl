(define (domain tower-of-hanoi)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types
        disk peg
    )
    (:predicates
        (on-peg ?d - disk ?p - peg)
        (on-disk ?d1 - disk ?d2 - disk)
        (clear-peg ?p - peg)
        (clear-disk ?d - disk)
        (smaller ?d1 - disk ?d2 - disk)
    )

    (:functions
        (total-cost) - number
    )

    ; A. Move disk D from a disk B to a clear peg T
    (:action move-disk-to-peg
        :parameters (?d ?b - disk ?t - peg)
        :precondition (and
            (on-disk ?d ?b)
            (clear-disk ?d)
            (clear-peg ?t)
        )
        :effect (and
            (not (on-disk ?d ?b))
            (on-peg ?d ?t)
            (clear-disk ?b)
            (not (clear-peg ?t))
            (increase (total-cost) 1)
        )
    )

    ; B. Move disk D from a peg S (where D is the bottom disk) to a clear peg T
    (:action move-peg-to-peg
        :parameters (?d - disk ?s ?t - peg)
        :precondition (and
            (on-peg ?d ?s)
            (clear-disk ?d)
            (clear-peg ?t)
        )
        :effect (and
            (not (on-peg ?d ?s))
            (on-peg ?d ?t)
            (not (clear-peg ?t))
            (clear-peg ?s)
            (increase (total-cost) 1)
        )
    )

    ; C. Move disk D from a peg S onto a disk B
    (:action move-peg-to-disk
        :parameters (?d - disk ?s - peg ?b - disk)
        :precondition (and
            (on-peg ?d ?s)
            (clear-disk ?d)
            (clear-disk ?b)
            (smaller ?d ?b) ; Enforces Tower of Hanoi size constraint
        )
        :effect (and
            (not (on-peg ?d ?s))
            (on-disk ?d ?b)
            (not (clear-disk ?b))
            (clear-peg ?s)
            (increase (total-cost) 1)
        )
    )

    ; D. Move disk D from disk B onto disk C
    (:action move-disk-to-disk
        :parameters (?d ?b ?c - disk)
        :precondition (and
            (on-disk ?d ?b)
            (clear-disk ?d)
            (clear-disk ?c)
            (smaller ?d ?c) ; Enforces Tower of Hanoi size constraint
        )
        :effect (and
            (not (on-disk ?d ?b))
            (on-disk ?d ?c)
            (clear-disk ?b)
            (not (clear-disk ?c))
            (increase (total-cost) 1)
        )
    )
)