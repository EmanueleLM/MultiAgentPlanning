(define (domain hanoi-7-disk)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types
        location
        disk - location
        peg - location
    )

    (:predicates
        (on ?d - disk ?loc - location) ; Disk d is immediately on location loc
        (clear ?loc - location)        ; Nothing is immediately on location loc
        (smaller ?d1 - disk ?d2 - disk) ; d1 is smaller than d2 (static size order)
    )

    (:functions
        (total-cost)
    )

    (:action move-to-peg
        :parameters (?d - disk ?l_from - location ?p_to - peg)
        :precondition (and
            (on ?d ?l_from)
            (clear ?d)
            (clear ?p_to)
            (not (= ?l_from ?p_to))
        )
        :effect (and
            (not (on ?d ?l_from))
            (on ?d ?p_to)
            
            (clear ?l_from)
            (not (clear ?p_to))
            
            (increase (total-cost) 1)
        )
    )

    (:action move-to-disk
        :parameters (?d - disk ?l_from - location ?d_to - disk)
        :precondition (and
            (on ?d ?l_from)
            (clear ?d)
            (clear ?d_to)
            (smaller ?d ?d_to) ; Must obey the size constraint
        )
        :effect (and
            (not (on ?d ?l_from))
            (on ?d ?d_to)
            
            (clear ?l_from)
            (not (clear ?d_to))
            
            (increase (total-cost) 1)
        )
    )
)