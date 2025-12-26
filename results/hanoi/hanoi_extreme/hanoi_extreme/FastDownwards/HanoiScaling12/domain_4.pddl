(define (domain hanoi-scaling-12)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types
        disk
        peg
    )
    
    (:predicates
        (on ?d - disk ?l - (either disk peg))
        (clear ?l - (either disk peg)) ; True if nothing is on top of L
        (smaller ?d1 - disk ?d2 - disk) ; Static size comparison
    )
    
    (:functions
        (total-cost)
    )
    
    ;; 1. Move D onto an empty peg P_to
    (:action move-to-peg
        :parameters (?d - disk 
                     ?p_from - peg 
                     ?p_to - peg 
                     ?s_from - (either disk peg) ; Support disk D is currently on
        )
        :precondition (and
            ; 1. D is the top disk (nothing is on D)
            (clear ?d)
            
            ; 2. D is resting on S_from
            (on ?d ?s_from)
            
            ; 3. The target peg P_to must be empty/clear
            (clear ?p_to)
            
            ; 4. Must be moving between different pegs
            (not (= ?p_from ?p_to))
        )
        :effect (and
            ; Update D's position
            (not (on ?d ?s_from))
            (on ?d ?p_to)
            
            ; Update clear status of supports
            (clear ?s_from) ; S_from is now exposed
            (not (clear ?p_to)) ; P_to is now covered by D
            
            (increase (total-cost) 1)
        )
    )

    ;; 2. Move D onto a clear disk D_base
    (:action move-to-disk
        :parameters (?d - disk 
                     ?p_from - peg 
                     ?p_to - peg 
                     ?s_from - (either disk peg) ; Support disk D is currently on
                     ?d_base - disk              ; Disk D lands on
        )
        :precondition (and
            ; 1. D is the top disk
            (clear ?d)
            
            ; 2. D is resting on S_from
            (on ?d ?s_from)
            
            ; 3. The target disk D_base must be clear
            (clear ?d_base)
            
            ; 4. Size constraint: D must be strictly smaller than D_base
            (smaller ?d ?d_base)
            
            ; 5. Must be moving between different pegs 
            (not (= ?p_from ?p_to))
        )
        :effect (and
            ; Update D's position
            (not (on ?d ?s_from))
            (on ?d ?d_base)
            
            ; Update clear status of supports
            (clear ?s_from) ; S_from is now exposed
            (not (clear ?d_base)) ; D_base is now covered by D
            
            (increase (total-cost) 1)
        )
    )
)