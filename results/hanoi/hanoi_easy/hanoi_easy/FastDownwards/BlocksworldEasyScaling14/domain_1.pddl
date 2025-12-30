(define (domain hanoi-4disk)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types
        disk peg
    )
    (:predicates
        ; d is immediately on x (where x is a disk or a peg)
        (on ?d - disk ?x - (either disk peg)) 
        ; x is the topmost element, nothing is on x
        (clear ?x - (either disk peg))        
        ; d1 is smaller than d2 (static relationship)
        (smaller ?d1 - disk ?d2 - disk)       
    )
    (:functions
        (total-cost) - number
    )

    ;; 1. Move disk D from X_from onto a target PEG P_to
    (:action move-to-peg
        :parameters (?d - disk ?p_to - peg ?x_from - (either disk peg))
        :precondition (and
            (clear ?d)    ; D must be the top disk
            (on ?d ?x_from) ; D must be on X_from
            (clear ?p_to) ; Target peg must be clear
        )
        :effect (and
            (not (on ?d ?x_from))
            (on ?d ?p_to)
            (clear ?x_from)
            (not (clear ?p_to))
            (increase (total-cost) 1)
        )
    )

    ;; 2. Move disk D from X_from onto a target DISK D_to
    (:action move-to-disk
        :parameters (?d - disk ?d_to - disk ?x_from - (either disk peg))
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
            (clear ?x_from)
            (not (clear ?d_to))
            (increase (total-cost) 1)
        )
    )
)