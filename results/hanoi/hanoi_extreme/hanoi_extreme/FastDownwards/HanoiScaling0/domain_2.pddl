(define (domain hanoi-4-disks)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types
        disk peg - object
    )
    (:predicates
        (on ?d1 - disk ?d2 - disk)
        (on-peg ?d - disk ?p - peg)
        (clear ?x - object)
        (smaller ?d1 - disk ?d2 - disk)
    )
    (:functions
        (total-cost)
    )

    ;; Move disk ?d from source ?s_f onto target disk ?d_t
    (:action move-to-disk
        :parameters (?d - disk ?s_f - object ?d_t - disk)
        :precondition (and
            (clear ?d) ; ?d must be the top disk
            (or 
                (on ?d ?s_f) ; ?d is on a disk ?s_f
                (on-peg ?d ?s_f) ; ?d is on a peg ?s_f
            )
            (clear ?d_t) ; Target disk ?d_t must be clear (top of its stack)
            (not (smaller ?d_t ?d)) ; Rule: Cannot place a larger disk ?d on a smaller disk ?d_t
        )
        :effect (and
            (increase (total-cost) 1)
            
            ; Update clear status
            (clear ?s_f) 
            (not (clear ?d_t))
            
            ; Remove old connections
            (when (on ?d ?s_f) (not (on ?d ?s_f)))
            (when (on-peg ?d ?s_f) (not (on-peg ?d ?s_f)))
            
            ; Establish new connection
            (on ?d ?d_t)
        )
    )
    
    ;; Move disk ?d from source ?s_f onto target peg ?p_t
    (:action move-to-peg
        :parameters (?d - disk ?s_f - object ?p_t - peg)
        :precondition (and
            (clear ?d) ; ?d must be the top disk
            (or 
                (on ?d ?s_f) ; ?d is on a disk ?s_f
                (on-peg ?d ?s_f) ; ?d is on a peg ?s_f
            )
            (clear ?p_t) ; Target peg ?p_t must be clear (empty)
        )
        :effect (and
            (increase (total-cost) 1)
            
            ; Update clear status
            (clear ?s_f) 
            (not (clear ?p_t))
            
            ; Remove old connections
            (when (on ?d ?s_f) (not (on ?d ?s_f)))
            (when (on-peg ?d ?s_f) (not (on-peg ?d ?s_f)))
            
            ; Establish new connection
            (on-peg ?d ?p_t)
        )
    )
)