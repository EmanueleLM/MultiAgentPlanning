(define (domain hanoi-7-disks-strips)
    (:requirements :strips :typing :negative-preconditions :equality :action-costs)
    (:types
        disk
        peg
    )
    (:functions
        (total-cost)
    )
    (:predicates
        (on ?d1 - disk ?d2 - disk)
        (on-peg ?d - disk ?p - peg)
        (clear-disk ?d - disk)
        (clear-peg ?p - peg)
        (smaller ?d1 - disk ?d2 - disk)
        (is-on ?d - disk ?p - peg)
    )

    (:action move-disk-disk
        :parameters (?d - disk
                     ?b - disk
                     ?t - disk
                     ?from - peg
                     ?to - peg
        )
        :precondition (and
            (not (= ?from ?to))
            (clear-disk ?d)
            (clear-disk ?t)
            (on ?d ?b)
            (is-on ?b ?from)
            (is-on ?t ?to)
            (smaller ?d ?t)
        )
        :effect (and
            (not (on ?d ?b))
            (clear-disk ?b)
            (not (is-on ?d ?from))

            (on ?d ?t)
            (not (clear-disk ?t))
            (is-on ?d ?to)
            (increase (total-cost) 1)
        )
    )
    
    (:action move-disk-peg
        :parameters (?d - disk
                     ?b - disk
                     ?from - peg
                     ?to - peg
        )
        :precondition (and
            (not (= ?from ?to))
            (clear-disk ?d)
            (on ?d ?b)
            (is-on ?b ?from)
            (clear-peg ?to)
        )
        :effect (and
            (not (on ?d ?b))
            (clear-disk ?b)
            (not (is-on ?d ?from))

            (on-peg ?d ?to)
            (not (clear-peg ?to))
            (is-on ?d ?to)
            (increase (total-cost) 1)
        )
    )
    
    (:action move-peg-disk
        :parameters (?d - disk
                     ?from - peg
                     ?t - disk
                     ?to - peg
        )
        :precondition (and
            (not (= ?from ?to))
            (clear-disk ?d)
            (on-peg ?d ?from)
            (is-on ?t ?to)
            (clear-disk ?t)
            (smaller ?d ?t)
        )
        :effect (and
            (not (on-peg ?d ?from))
            (clear-peg ?from)
            (not (is-on ?d ?from))

            (on ?d ?t)
            (not (clear-disk ?t))
            (is-on ?d ?to)
            (increase (total-cost) 1)
        )
    )
    
    (:action move-peg-peg
        :parameters (?d - disk
                     ?from - peg
                     ?to - peg
        )
        :precondition (and
            (not (= ?from ?to))
            (clear-disk ?d)
            (on-peg ?d ?from)
            (is-on ?d ?from)
            (clear-peg ?to)
        )
        :effect (and
            (not (on-peg ?d ?from))
            (clear-peg ?from)
            (not (is-on ?d ?from))
            
            (on-peg ?d ?to)
            (not (clear-peg ?to))
            (is-on ?d ?to)
            (increase (total-cost) 1)
        )
    )
)