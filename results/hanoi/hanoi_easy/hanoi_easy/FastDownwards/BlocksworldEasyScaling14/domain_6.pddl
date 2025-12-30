(define (domain hanoi-4disk)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types
        disk 
        peg
    )
    (:predicates
        (on-disk ?d1 - disk ?d2 - disk) ; d1 is immediately on d2
        (on-peg ?d - disk ?p - peg)     ; d is immediately on p
        (smaller ?d1 - disk ?d2 - disk) ; d1 is smaller than d2
        (clear-disk ?d - disk)          ; d has nothing on top of it
        (clear-peg ?p - peg)            ; p is empty
    )
    (:functions 
        (total-cost) - number
    )
    
    (:action move-p-to-p
        :parameters (?d - disk ?p1 - peg ?p2 - peg)
        :precondition (and
            (on-peg ?d ?p1)
            (clear-disk ?d)
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

    (:action move-p-to-d
        :parameters (?d - disk ?p1 - peg ?d_target - disk)
        :precondition (and
            (on-peg ?d ?p1)
            (clear-disk ?d)
            (clear-disk ?d_target)
            (smaller ?d ?d_target)
        )
        :effect (and
            (not (on-peg ?d ?p1))
            (on-disk ?d ?d_target)
            (clear-peg ?p1)
            (not (clear-disk ?d_target))
            (increase (total-cost) 1)
        )
    )
    
    (:action move-d-to-p
        :parameters (?d - disk ?d1 - disk ?p2 - peg)
        :precondition (and
            (on-disk ?d ?d1)
            (clear-disk ?d)
            (clear-peg ?p2)
        )
        :effect (and
            (not (on-disk ?d ?d1))
            (on-peg ?d ?p2)
            (clear-disk ?d1)
            (not (clear-peg ?p2))
            (increase (total-cost) 1)
        )
    )

    (:action move-d-to-d
        :parameters (?d - disk ?d1 - disk ?d_target - disk)
        :precondition (and
            (on-disk ?d ?d1)
            (clear-disk ?d)
            (clear-disk ?d_target)
            (smaller ?d ?d_target)
        )
        :effect (and
            (not (on-disk ?d ?d1))
            (on-disk ?d ?d_target)
            (clear-disk ?d1)
            (not (clear-disk ?d_target))
            (increase (total-cost) 1)
        )
    )
)