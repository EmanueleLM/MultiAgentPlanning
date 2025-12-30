(define (domain hanoi-6disk-bwhs13)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types
        disk peg - object
    )

    (:predicates
        (on ?x - disk ?y - (either disk peg))
        (clear ?x - (either disk peg))
        (smaller ?d1 - disk ?d2 - disk)
    )

    (:functions
        (total-cost) - number
    )

    (:action move-to-peg
        :parameters (?d - disk ?from_loc - (either disk peg) ?p_to - peg)
        :precondition (and
            (on ?d ?from_loc)
            (clear ?d)
            (clear ?p_to)
        )
        :effect (and
            (not (on ?d ?from_loc))
            (on ?d ?p_to)
            (clear ?from_loc)
            (not (clear ?p_to))
            (increase (total-cost) 1)
        )
    )

    (:action move-to-disk
        :parameters (?d - disk ?from_loc - (either disk peg) ?d_to - disk)
        :precondition (and
            (on ?d ?from_loc)
            (clear ?d)
            (clear ?d_to)
            (smaller ?d ?d_to)
        )
        :effect (and
            (not (on ?d ?from_loc))
            (on ?d ?d_to)
            (clear ?from_loc)
            (not (clear ?d_to))
            (increase (total-cost) 1)
        )
    )
)