(define (domain tower-of-hanoi-6)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types
        disk peg - object
    )
    (:predicates
        (on ?d - disk ?l - object) ; ?l is a disk or a peg
        (clear ?l - object)        ; ?l is the topmost entity (disk or peg)
        (smaller ?d1 - disk ?d2 - disk) ; d1 size < d2 size
    )
    (:functions
        (total-cost) - number
    )

    ;; Action 1: Move D1 from a location L_from (Peg or Disk) to an empty Peg P_to
    (:action move-d-to-p
        :parameters (?d - disk ?l_from - object ?p_to - peg)
        :precondition (and
            (on ?d ?l_from)
            (clear ?d)
            (clear ?p_to)
        )
        :effect (and
            (not (on ?d ?l_from))
            (on ?d ?p_to)
            (clear ?l_from)
            (not (clear ?p_to))
            (increase (total-cost) 1)
        )
    )

    ;; Action 2: Move D1 from a location L_from (Peg or Disk) onto a larger Disk D2
    (:action move-d-to-d
        :parameters (?d1 - disk ?l_from - object ?d2 - disk)
        :precondition (and
            (on ?d1 ?l_from)
            (clear ?d1)
            (clear ?d2) ; D2 must be clear (topmost)
            (smaller ?d1 ?d2) ; D1 must be smaller than D2 (Hanoi rule enforcement)
        )
        :effect (and
            (not (on ?d1 ?l_from))
            (on ?d1 ?d2)
            (clear ?l_from)
            (not (clear ?d2))
            (increase (total-cost) 1)
        )
    )
)