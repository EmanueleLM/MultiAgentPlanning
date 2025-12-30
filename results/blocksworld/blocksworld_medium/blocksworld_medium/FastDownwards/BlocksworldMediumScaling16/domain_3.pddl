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
        (smaller ?d1 - disk ?d2 - disk)
        (on ?d1 - disk ?d2 - disk)
        (on-peg ?d - disk ?p - peg)
        (top-disk ?d - disk)
        (clear-peg ?p - peg)
    )
    (:functions
        (total-cost)
    )

    (:action move-disk-to-disk
        :parameters (?d - disk ?d1 - disk ?d2 - disk)
        :precondition (and
            (top-disk ?d)
            (on ?d ?d1)
            (top-disk ?d2)
            (smaller ?d ?d2)
        )
        :effect (and
            (not (on ?d ?d1))
            (on ?d ?d2)
            (top-disk ?d1)
            (not (top-disk ?d2))
            (increase (total-cost) 1)
        )
    )

    (:action move-disk-to-peg
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

    (:action move-peg-to-disk
        :parameters (?d - disk ?p1 - peg ?d2 - disk)
        :precondition (and
            (top-disk ?d)
            (on-peg ?d ?p1)
            (top-disk ?d2)
            (smaller ?d ?d2)
        )
        :effect (and
            (not (on-peg ?d ?p1))
            (on ?d ?d2)
            (clear-peg ?p1)
            (not (top-disk ?d2))
            (increase (total-cost) 1)
        )
    )

    (:action move-peg-to-peg
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