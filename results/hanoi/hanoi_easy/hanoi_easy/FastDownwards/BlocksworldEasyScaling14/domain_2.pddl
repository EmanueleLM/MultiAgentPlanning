(define (domain hanoi-4disk)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types
        hanoi-object
        disk peg - hanoi-object
    )
    (:predicates
        ; d is immediately on x (where x is a disk or a peg)
        (on ?d - disk ?x - hanoi-object) 
        ; x is the topmost element, nothing is on x
        (clear ?x - hanoi-object)        
        ; d1 is smaller than d2 (static relationship)
        (smaller ?d1 - disk ?d2 - disk)       
    )
    (:functions
        (total-cost) - number
    )

    ;; Action 1: Move disk D off X onto a target PEG P_to
    (:action move-onto-peg
        :parameters (?d - disk ?p_to - peg ?x_from - hanoi-object)
        :precondition (and
            (clear ?d)    ; D must be the top disk
            (on ?d ?x_from) ; D must be on X_from
            (clear ?p_to) ; Target peg must be clear/empty
        )
        :effect (and
            (not (on ?d ?x_from))
            (on ?d ?p_to)
            (clear ?x_from) ; X_from becomes clear
            (not (clear ?p_to))
            (increase (total-cost) 1)
        )
    )

    ;; Action 2: Move disk D off X onto a target DISK D_to
    (:action move-onto-disk
        :parameters (?d - disk ?d_to - disk ?x_from - hanoi-object)
        :precondition (and
            (clear ?d)    ; D must be the top disk
            (on ?d ?x_from) ; D must be on X_from
            (clear ?d_to) ; Target disk must be clear
            ; Size constraint: D must be strictly smaller than D_to
            (smaller ?d ?d_to)
        )
        :effect (and
            (not (on ?d ?x_from))
            (on ?d ?d_to)
            (clear ?x_from) ; X_from becomes clear
            (not (clear ?d_to))
            (increase (total-cost) 1)
        )
    )