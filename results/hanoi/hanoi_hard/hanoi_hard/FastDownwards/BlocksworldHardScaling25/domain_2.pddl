(define (domain hanoi)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types 
        disk peg
    )
    (:predicates
        (on ?d1 - disk ?d2 - disk)      ; d1 is stacked on d2
        (on-peg ?d - disk ?p - peg)     ; d is the base disk on peg p
        (clear ?d - disk)               ; d is the topmost disk
        (peg-clear ?p - peg)            ; peg p has no disks
        (smaller ?d1 - disk ?d2 - disk) ; d1 is strictly smaller than d2
    )
    
    (:functions
        (total-cost)
    )

    ;; 1. Move disk D from a disk D_from onto a disk D_to (D must be smaller than D_to)
    (:action move-disk-to-disk
        :parameters (?d ?d_from ?d_to - disk)
        :precondition (and 
            (on ?d ?d_from) 
            (clear ?d) 
            (clear ?d_to) 
            (smaller ?d ?d_to)
        )
        :effect (and 
            (on ?d ?d_to) 
            (clear ?d_from) 
            (not (on ?d ?d_from)) 
            (not (clear ?d_to)) 
            (increase (total-cost) 1)
        )
    )

    ;; 2. Move disk D from a disk D_from onto an empty peg P_to
    (:action move-disk-to-peg
        :parameters (?d ?d_from - disk ?p_to - peg)
        :precondition (and 
            (on ?d ?d_from) 
            (clear ?d) 
            (peg-clear ?p_to)
        )
        :effect (and 
            (on-peg ?d ?p_to) 
            (clear ?d_from) 
            (not (on ?d ?d_from)) 
            (not (peg-clear ?p_to)) 
            (increase (total-cost) 1)
        )
    )
    
    ;; 3. Move disk D from peg P_from onto a disk D_to (D must be smaller than D_to)
    (:action move-peg-to-disk
        :parameters (?d ?d_to - disk ?p_from - peg)
        :precondition (and 
            (on-peg ?d ?p_from) 
            (clear ?d) 
            (clear ?d_to) 
            (smaller ?d ?d_to)
        )
        :effect (and 
            (on ?d ?d_to) 
            (peg-clear ?p_from) 
            (not (on-peg ?d ?p_from)) 
            (not (clear ?d_to)) 
            (increase (total-cost) 1)
        )
    )
    
    ;; 4. Move disk D from peg P_from onto an empty peg P_to
    (:action move-peg-to-peg
        :parameters (?d - disk ?p_from ?p_to - peg)
        :precondition (and 
            (on-peg ?d ?p_from) 
            (clear ?d) 
            (peg-clear ?p_to)
        )
        :effect (and 
            (on-peg ?d ?p_to) 
            (peg-clear ?p_from) 
            (not (on-peg ?d ?p_from)) 
            (not (peg-clear ?p_to)) 
            (increase (total-cost) 1)
        )
    )
)