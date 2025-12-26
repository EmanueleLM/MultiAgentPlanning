(define (domain hanoi-4disks)
    (:requirements :typing :negative-preconditions :action-costs)
    (:types
        disk
        peg
        item - (either disk peg)
    )
    (:predicates
        (on ?d - disk ?i - item)
        (clear ?i - item)
        ; Static predicates for size ordering: d1 is smaller than d2
        (smaller ?d1 - disk ?d2 - disk)
    )
    (:functions
        (total-cost) - number
    )

    (:action move-to-peg
        :parameters (?d - disk ?f - item ?p - peg)
        :precondition
            (and
                (on ?d ?f)
                (clear ?d)
                (clear ?p)
            )
        :effect
            (and
                (not (on ?d ?f))
                (on ?d ?p)
                (clear ?f)
                (not (clear ?p))
                (increase (total-cost) 1)
            )
    )

    (:action move-to-disk
        :parameters (?d1 - disk ?f - item ?d2 - disk)
        :precondition
            (and
                (on ?d1 ?f)
                (clear ?d1)
                (clear ?d2)
                (smaller ?d1 ?d2) ; The moved disk must be smaller than the disk it lands on
            )
        :effect
            (and
                (not (on ?d1 ?f))
                (on ?d1 ?d2)
                (clear ?f)
                (not (clear ?d2))
                (increase (total-cost) 1)
            )
    )
)