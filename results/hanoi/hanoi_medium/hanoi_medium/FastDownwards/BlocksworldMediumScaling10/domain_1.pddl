(define (domain hanoi-5-disks)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types
        disk peg
    )
    (:predicates
        ; Connectivity & State
        (on ?d1 - disk ?d2 - disk)          ; d1 is directly on d2
        (on-peg ?d - disk ?p - peg)         ; d is directly on peg p base
        (clear ?x - (either disk peg))      ; nothing is on x
        
        ; Static Size Ordering (d1 must be smaller than d2)
        (smaller ?d1 - disk ?d2 - disk)
    )

    (:functions
        (total-cost) ; Metric tracking
    )

    ; --- 1. Move Disk from Disk (D_FROM) to Disk (D_TO) ---
    (:action move-d-d
        :parameters (?d - disk ?d_from - disk ?d_to - disk)
        :precondition (and
            (clear ?d)
            (on ?d ?d_from)
            (clear ?d_to)
            (smaller ?d ?d_to) ; Rule 3: Size constraint
        )
        :effect (and
            (not (on ?d ?d_from))
            (on ?d ?d_to)
            
            (clear ?d_from)
            (not (clear ?d_to))
            
            (increase (total-cost) 1)
        )
    )

    ; --- 2. Move Disk from Disk (D_FROM) to Peg base (P_TO) ---
    (:action move-d-p
        :parameters (?d - disk ?d_from - disk ?p_to - peg)
        :precondition (and
            (clear ?d)
            (on ?d ?d_from)
            (clear ?p_to) ; Peg base is clear
        )
        :effect (and
            (not (on ?d ?d_from))
            (on-peg ?d ?p_to)
            
            (clear ?d_from)
            (not (clear ?p_to))
            
            (increase (total-cost) 1)
        )
    )

    ; --- 3. Move Disk from Peg base (P_FROM) to Disk (D_TO) ---
    (:action move-p-d
        :parameters (?d - disk ?p_from - peg ?d_to - disk)
        :precondition (and
            (clear ?d)
            (on-peg ?d ?p_from)
            (clear ?d_to)
            (smaller ?d ?d_to) ; Rule 3: Size constraint
        )
        :effect (and
            (not (on-peg ?d ?p_from))
            (on ?d ?d_to)
            
            (clear ?p_from)
            (not (clear ?d_to))
            
            (increase (total-cost) 1)
        )
    )

    ; --- 4. Move Disk from Peg base (P_FROM) to Peg base (P_TO) ---
    (:action move-p-p
        :parameters (?d - disk ?p_from - peg ?p_to - peg)
        :precondition (and
            (clear ?d)
            (on-peg ?d ?p_from)
            (clear ?p_to)
            (not (= ?p_from ?p_to)) ; Ensure pegs are different
        )
        :effect (and
            (not (on-peg ?d ?p_from))
            (on-peg ?d ?p_to)
            
            (clear ?p_from)
            (not (clear ?p_to))
            
            (increase (total-cost) 1)
        )
    )
)