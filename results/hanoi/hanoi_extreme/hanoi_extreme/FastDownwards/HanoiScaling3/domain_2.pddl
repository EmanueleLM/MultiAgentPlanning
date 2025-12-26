(define (domain tower-of-hanoi)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types
        disk - object
        peg - object
    )
    (:predicates
        (on ?d1 - disk ?o2 - object)
        (clear ?o - object)
        (smaller ?d1 - disk ?d2 - disk)
    )
    (:functions
        (total-cost) - number
    )

    ;; Move disk D from base F to empty Peg T
    (:action move_disk_to_peg
        :parameters (?d - disk ?f - object ?t - peg)
        :precondition (and
            (clear ?d)
            (on ?d ?f)
            (clear ?t)
            (not (= ?f ?t))
        )
        :effect (and
            (not (on ?d ?f))
            (clear ?f) 
            (not (clear ?t))
            (on ?d ?t)
            (increase (total-cost) 1)
        )
    )
    
    ;; Move disk D from base F onto disk D_below
    (:action move_disk_to_disk
        :parameters (?d - disk ?f - object ?d_below - disk)
        :precondition (and
            (clear ?d)
            (on ?d ?f)
            (clear ?d_below)
            (smaller ?d ?d_below) ; Size constraint enforcement
            (not (= ?f ?d_below))
        )
        :effect (and
            (not (on ?d ?f))
            (clear ?f) 
            (not (clear ?d_below))
            (on ?d ?d_below)
            (increase (total-cost) 1)
        )
    )
)