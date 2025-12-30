(define (domain hanoi_4disks)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types
        locatable
        disk - locatable
        peg - locatable
    )
    (:predicates
        (on ?d - disk ?l - locatable) ; d is directly on l
        (clear ?l - locatable)        ; l has nothing on top
        (smaller ?d1 - disk ?d2 - disk) ; d1 is smaller than d2 (static)
    )
    (:functions
        (total-cost)
    )

    (:action move-to-peg
        :parameters (?d - disk ?from - locatable ?to - peg)
        :precondition (and
            (on ?d ?from)
            (clear ?d)
            (clear ?to) ; Peg must be empty
        )
        :effect (and
            (not (on ?d ?from))
            (on ?d ?to)
            (not (clear ?to))
            (clear ?from)
            (increase (total-cost) 1)
        )
    )

    (:action move-to-disk
        :parameters (?d - disk ?from - locatable ?to - disk)
        :precondition (and
            (on ?d ?from)
            (clear ?d)
            (clear ?to)
            (smaller ?d ?to) ; Hanoi Rule: smaller disk on larger disk
        )
        :effect (and
            (not (on ?d ?from))
            (on ?d ?to)
            (not (clear ?to))
            (clear ?from)
            (increase (total-cost) 1)
        )
    )
)