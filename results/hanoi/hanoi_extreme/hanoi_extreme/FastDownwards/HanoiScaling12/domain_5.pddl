(define (domain hanoi-scaling-12)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types
        disk
        peg
    )
    
    (:predicates
        (on ?d - disk ?l - object) ; L can be disk or peg
        (clear ?l - object) ; L can be disk or peg
        (smaller ?d1 - disk ?d2 - disk) ; Static size comparison
    )
    
    (:functions
        (total-cost)
    )
    
    ;; Action 1: Move D onto a PEG P_to (no size constraint needed, as peg has infinite capacity)
    (:action move-d-to-peg
        :parameters (?d - disk 
                     ?s_from - object ; Support disk D is currently on (disk or peg)
                     ?p_to - peg      ; Target must be a PEG
        )
        :precondition (and
            ; 1. D is the top disk (nothing is on D)
            (clear ?d)
            
            ; 2. D is resting on S_from
            (on ?d ?s_from)
            
            ; 3. The target peg P_to must be clear/empty
            (clear ?p_to)
            
            ; 4. Cannot move onto the support it is already on
            (not (= ?s_from ?p_to)) 
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

    ;; Action 2: Move D onto a DISK D_base (size constraint required)
    (:action move-d-to-disk
        :parameters (?d - disk 
                     ?s_from - object ; Support disk D is currently on (disk or peg)
                     ?d_base - disk   ; Target must be a DISK
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
            
            ; 5. Cannot move onto the disk it is already on (if S_from is D_base, which implies D_base = S_from)
            (not (= ?s_from ?d_base))
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