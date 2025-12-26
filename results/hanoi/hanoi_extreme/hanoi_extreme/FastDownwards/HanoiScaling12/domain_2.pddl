(define (domain hanoi-scaling-12)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types
        disk peg - object
    )
    (:predicates
        (on ?d - disk ?s - object) ; s can be disk or peg
        (clear ?s - object)        ; s can be disk or peg
        (smaller ?d1 - disk ?d2 - disk)
    )
    
    (:functions
        (total-cost)
    )

    ;; Action 1: Move disk D onto Peg P 
    (:action move-d-to-p
        :parameters (?d - disk ?src - object ?p - peg)
        :precondition (and
            (on ?d ?src)
            (clear ?d)
            (clear ?p)
        )
        :effect (and
            (not (on ?d ?src))
            (on ?d ?p)
            (clear ?src)
            (not (clear ?p))
            (increase (total-cost) 1)
        )
    )

    ;; Action 2: Move disk D onto Disk Dst (Requires size constraint check)
    (:action move-d-to-d
        :parameters (?d - disk ?src - object ?dst - disk)
        :precondition (and
            (on ?d ?src)
            (clear ?d)
            (clear ?dst)
            (smaller ?d ?dst)
        )
        :effect (and
            (not (on ?d ?src))
            (on ?d ?dst)
            (clear ?src)
            (not (clear ?dst))
            (increase (total-cost) 1)
        )
    )