(define (domain hanoi-5disk-optimized)
    (:requirements :typing :negative-preconditions :action-costs)
    (:types
        base 
        disk - base
        peg - base
    )
    (:predicates
        (on ?d - disk ?b - base)        ; disk d is resting on base b (disk or peg)
        (clear ?b - base)               ; base b is clear (disk or peg)
        (smaller ?d1 - disk ?d2 - disk) ; d1 is smaller than d2 (Invariant)
    )
    (:functions
        (total-cost) - number
    )

    ; Action 1: Moving disk D (from disk B_S) onto another disk D_T
    (:action move_d_to_d
        :parameters (?d - disk ?b_s - disk ?b_t - disk) ; Parameter ?b_s explicitly typed as disk
        :precondition (and
            (on ?d ?b_s)
            (clear ?d)
            (clear ?b_t)
            (smaller ?d ?b_t) ; Constraint: cannot place larger on smaller
        )
        :effect (and
            (not (on ?d ?b_s))
            (on ?d ?b_t)
            (clear ?b_s)
            (not (clear ?b_t))
            (increase (total-cost) 1)
        )
    )

    ; Action 2: Moving disk D (from disk B_S) onto an empty peg P_T
    (:action move_d_to_peg
        :parameters (?d - disk ?b_s - disk ?p_t - peg) 
        :precondition (and
            (on ?d ?b_s)
            (clear ?d)
            (clear ?p_t)
        )
        :effect (and
            (not (on ?d ?b_s))
            (on ?d ?p_t)
            (clear ?b_s)
            (not (clear ?p_t))
            (increase (total-cost) 1)
        )
    )
    
    ; Action 3: Moving disk D (from peg P_S) onto disk D_T
    (:action move_peg_to_d
        :parameters (?d - disk ?p_s - peg ?b_t - disk)
        :precondition (and
            (on ?d ?p_s)
            (clear ?d)
            (clear ?b_t)
            (smaller ?d ?b_t) ; Constraint
        )
        :effect (and
            (not (on ?d ?p_s))
            (on ?d ?b_t)
            (clear ?p_s)
            (not (clear ?b_t))
            (increase (total-cost) 1)
        )
    )

    ; Action 4: Moving disk D from peg P_S onto peg P_T
    (:action move_peg_to_peg
        :parameters (?d - disk ?p_s - peg ?p_t - peg) ; Parameter ?p_s explicitly typed as peg
        :precondition (and
            (on ?d ?p_s)
            (clear ?d)
            (clear ?p_t)
        )
        :effect (and
            (not (on ?d ?p_s))
            (on ?d ?p_t)
            (clear ?p_s)
            (not (clear ?p_t))
            (increase (total-cost) 1)
        )
    )
)