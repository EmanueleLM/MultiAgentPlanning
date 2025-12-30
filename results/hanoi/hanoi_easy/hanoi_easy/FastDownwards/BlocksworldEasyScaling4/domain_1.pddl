(define (domain hanoi-4-disks)
    (:requirements :typing :negative-preconditions :action-costs)
    (:types
        disk - object
        peg - object
    )

    (:predicates
        (on ?d - disk ?loc - (either disk peg)) ; d is immediately on loc
        (clear ?loc - (either disk peg))        ; loc has nothing on it (is available/empty)
        (smaller ?d1 - disk ?d2 - disk)         ; d1 is smaller than d2 (static)
    )
    
    (:functions
        (total-cost) - number
    )

    ; Action 1: Move disk D from L_S (disk/peg) to Peg P_T (empty target)
    (:action move-d-to-empty-peg
        :parameters (?d - disk ?l_s - (either disk peg) ?p_t - peg)
        :precondition (and
            (on ?d ?l_s)
            (clear ?d)
            (clear ?p_t) 
        )
        :effect (and
            (not (on ?d ?l_s))
            (on ?d ?p_t)
            (clear ?l_s) 
            (not (clear ?p_t)) 
            (increase (total-cost) 1)
        )
    )

    ; Action 2: Move disk D from L_S (disk/peg) onto D_T (target disk)
    (:action move-d-to-disk
        :parameters (?d ?d_t - disk ?l_s - (either disk peg))
        :precondition (and
            (on ?d ?l_s)
            (clear ?d)
            (clear ?d_t) 
            (smaller ?d ?d_t) ; Constraint: larger disk cannot be placed on a smaller one
        )
        :effect (and
            (not (on ?d ?l_s))
            (on ?d ?d_t)
            (clear ?l_s) 
            (not (clear ?d_t)) 
            (increase (total-cost) 1)
        )
    )
)