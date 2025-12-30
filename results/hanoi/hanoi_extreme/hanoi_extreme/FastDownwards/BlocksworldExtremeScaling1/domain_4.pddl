(define (domain hanoi-7disk)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types 
        disk
        peg
    )

    (:predicates
        (is-smaller ?d1 - disk ?d2 - disk)
        (on-disk ?d1 - disk ?d2 - disk)
        (on-peg ?d - disk ?p - peg)
        (clear-disk ?d - disk)
        (clear-peg ?p - peg)
    )

    (:functions
        (total-cost)
    )

    (:action move-dd
        :parameters (?d - disk ?df - disk ?dt - disk)
        :precondition (and
            (clear-disk ?d)
            (on-disk ?d ?df)
            (clear-disk ?dt)
            (is-smaller ?d ?dt)
        )
        :effect (and
            (not (on-disk ?d ?df))
            (not (clear-disk ?dt))
            (on-disk ?d ?dt)
            (clear-disk ?df)
            (increase (total-cost) 1)
        )
    )

    (:action move-dp
        :parameters (?d - disk ?df - disk ?pt - peg)
        :precondition (and
            (clear-disk ?d)
            (on-disk ?d ?df)
            (clear-peg ?pt)
        )
        :effect (and
            (not (on-disk ?d ?df))
            (not (clear-peg ?pt))
            (on-peg ?d ?pt)
            (clear-disk ?df)
            (increase (total-cost) 1)
        )
    )

    (:action move-pd
        :parameters (?d - disk ?pf - peg ?dt - disk)
        :precondition (and
            (clear-disk ?d)
            (on-peg ?d ?pf)
            (clear-disk ?dt)
            (is-smaller ?d ?dt)
        )
        :effect (and
            (not (on-peg ?d ?pf))
            (not (clear-disk ?dt))
            (on-disk ?d ?dt)
            (clear-peg ?pf)
            (increase (total-cost) 1)
        )
    )

    (:action move-pp
        :parameters (?d - disk ?pf - peg ?pt - peg)
        :precondition (and
            (clear-disk ?d)
            (on-peg ?d ?pf)
            (clear-peg ?pt)
        )
        :effect (and
            (not (on-peg ?d ?pf))
            (not (clear-peg ?pt))
            (on-peg ?d ?pt)
            (clear-peg ?pf)
            (increase (total-cost) 1)
        )
    )
)