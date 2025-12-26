(define (domain hanoi-6disk)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    
    (:types
        disk - object
        peg - object
    )
    
    (:predicates
        (on ?d - disk ?l - object) ; ?l can be a disk or a peg
        (clear ?d - disk) ; ?d has nothing on top of it (movable)
        (empty ?p - peg) ; ?p has no disks
        (smaller ?d1 - disk ?d2 - disk) ; d1 is smaller than d2
    )

    (:functions
        (total-cost)
    )

    ;; 1. Move D from D_below (stacked) to D_top_to (stacked)
    (define (action move-stack-to-stack)
        :parameters (?d - disk ?d_below_from - disk ?d_top_to - disk)
        :precondition (and
            (on ?d ?d_below_from)
            (clear ?d)
            (clear ?d_top_to)
            (smaller ?d ?d_top_to) ; D must be smaller than the disk it lands on
        )
        :effect (and
            (not (on ?d ?d_below_from))
            (on ?d ?d_top_to)
            
            (clear ?d_below_from)
            (not (clear ?d_top_to))
            
            (increase (total-cost) 1)
        )
    )

    ;; 2. Move D from P_from (base) to D_top_to (stacked)
    (define (action move-base-to-stack)
        :parameters (?d - disk ?p_from - peg ?d_top_to - disk)
        :precondition (and
            (on ?d ?p_from)
            (clear ?d)
            (clear ?d_top_to)
            (smaller ?d ?d_top_to) ; D must be smaller than the disk it lands on
        )
        :effect (and
            (not (on ?d ?p_from))
            (on ?d ?d_top_to)
            
            (not (clear ?d_top_to))
            (empty ?p_from)         ; Peg becomes empty
            
            (increase (total-cost) 1)
        )
    )

    ;; 3. Move D from D_below (stacked) to P_to (empty peg)
    (define (action move-stack-to-empty)
        :parameters (?d - disk ?d_below_from - disk ?p_to - peg)
        :precondition (and
            (on ?d ?d_below_from)
            (clear ?d)
            (empty ?p_to)
        )
        :effect (and
            (not (on ?d ?d_below_from))
            (on ?d ?p_to)
            
            (clear ?d_below_from)
            (not (empty ?p_to))
            
            (increase (total-cost) 1)
        )
    )
    
    ;; 4. Move disk D from P_from (base) to P_to (empty peg)
    (define (action move-base-to-empty)
        :parameters (?d - disk ?p_from - peg ?p_to - peg)
        :precondition (and
            (on ?d ?p_from)
            (clear ?d)
            (empty ?p_to)
        )
        :effect (and
            (not (on ?d ?p_from))
            (on ?d ?p_to)
            
            (empty ?p_from)
            (not (empty ?p_to))
            
            (increase (total-cost) 1)
        )
    )
)