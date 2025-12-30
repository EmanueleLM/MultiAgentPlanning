(define (domain hanoi-7-disk)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types
        disk
        peg
    )

    (:predicates
        (on ?d - disk ?loc - (either disk peg)) ; Disk d is immediately on location loc (disk or peg)
        (clear ?loc - (either disk peg))        ; Nothing is immediately on location loc
        (smaller ?d1 - disk ?d2 - disk) ; d1 is smaller than d2 (static size order)
    )

    (:functions
        (total-cost)
    )

    (:action move
        :parameters (?d - disk ?l_from - (either disk peg) ?l_to - (either disk peg))
        :precondition (and
            (on ?d ?l_from)
            (clear ?d)
            (clear ?l_to)
            (not (= ?l_from ?l_to))
            
            ; Size constraint: D must be smaller than L_to if L_to is a disk.
            (or
                (peg ?l_to)
                (and 
                    (disk ?l_to)
                    (smaller ?d ?l_to)
                )
            )
        )
        :effect (and
            (not (on ?d ?l_from))
            (on ?d ?l_to)
            
            (clear ?l_from)
            (not (clear ?l_to))
            
            (increase (total-cost) 1)
        )
    )
)