(define (domain hanoi-5-disks)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types
        disk object
        peg
    )
    
    (:predicates
        ; Connectivity & Location
        (on-disk ?d1 - disk ?d2 - disk) ; d1 is immediately on d2
        (on-peg ?d - disk ?p - peg)     ; d is immediately on peg p base
        (is-at ?d - disk ?p - peg)      ; d is currently on peg p
        
        ; Status
        (clear ?d - disk)               ; d has nothing on top (Rule 2 condition)
        (empty ?p - peg)                ; p has no disks
        
        ; Size constraints (Rule 3: Smaller must be placed on Larger/Peg)
        (smaller ?d1 - disk ?d2 - disk) ; d1 is smaller than d2 (static)
    )
    
    (:functions 
        (total-cost)
    )

    ; Action 1: D moves from Disk D_FROM onto Disk D_TO
    (:action move-D-to-D
        :parameters (?d - disk ?d_from - disk ?d_to - disk ?p_from - peg ?p_to - peg)
        :precondition (and
            ; D must be the top disk on P_FROM (Rule 2)
            (clear ?d)
            (on-disk ?d ?d_from)
            (is-at ?d ?p_from)
            
            ; D_TO must be available on P_TO
            (clear ?d_to)
            (is-at ?d_to ?p_to)
            
            ; Size constraint (Rule 3)
            (smaller ?d ?d_to)
            (not (= ?p_from ?p_to))
        )
        :effect (and
            ; Structural changes
            (not (on-disk ?d ?d_from))
            (on-disk ?d ?d_to)
            
            ; Clear status updates
            (clear ?d_from)
            (not (clear ?d_to))
            
            ; Location update
            (not (is-at ?d ?p_from))
            (is-at ?d ?p_to)
            (increase (total-cost) 1)
        )
    )
    
    ; Action 2: D moves from Disk D_FROM onto Peg P_TO (empty destination)
    (:action move-D-to-P
        :parameters (?d - disk ?d_from - disk ?p_from - peg ?p_to - peg)
        :precondition (and
            ; D must be the top disk on P_FROM (Rule 2)
            (clear ?d)
            (on-disk ?d ?d_from)
            (is-at ?d ?p_from)

            ; P_TO must be empty
            (empty ?p_to)
            (not (= ?p_from ?p_to))
        )
        :effect (and
            ; Structural changes
            (not (on-disk ?d ?d_from))
            (on-peg ?d ?p_to)
            
            ; Status updates
            (clear ?d_from)
            (not (empty ?p_to))
            
            ; Location update
            (not (is-at ?d ?p_from))
            (is-at ?d ?p_to)
            (increase (total-cost) 1)
        )
    )
    
    ; Action 3: D moves from Peg P_FROM base onto Disk D_TO
    (:action move-P-to-D
        :parameters (?d - disk ?d_to - disk ?p_from - peg ?p_to - peg)
        :precondition (and
            ; D must be the top disk on P_FROM (Rule 2)
            (clear ?d)
            (on-peg ?d ?p_from)
            (is-at ?d ?p_from)
            
            ; D_TO must be available on P_TO
            (clear ?d_to)
            (is-at ?d_to ?p_to)
            
            ; Size constraint (Rule 3)
            (smaller ?d ?d_to)
            (not (= ?p_from ?p_to))
        )
        :effect (and
            ; Structural changes
            (not (on-peg ?d ?p_from))
            (on-disk ?d ?d_to)
            
            ; Status updates
            (not (clear ?d_to))
            (empty ?p_from)
            
            ; Location update
            (not (is-at ?d ?p_from))
            (is-at ?d ?p_to)
            (increase (total-cost) 1)
        )
    )
    
    ; Action 4: D moves from Peg P_FROM base onto Peg P_TO base (P_FROM and P_TO must be empty/full)
    (:action move-P-to-P
        :parameters (?d - disk ?p_from - peg ?p_to - peg)
        :precondition (and
            ; D must be the top disk on P_FROM (Rule 2)
            (clear ?d)
            (on-peg ?d ?p_from)
            (is-at ?d ?p_from)
            
            ; P_TO must be empty (Size constraint implicitly satisfied)
            (empty ?p_to)
            (not (= ?p_from ?p_to))
        )
        :effect (and
            ; Structural changes
            (not (on-peg ?d ?p_from))
            (on-peg ?d ?p_to)
            
            ; Status updates
            (empty ?p_from)
            (not (empty ?p_to))
            
            ; Location update
            (not (is-at ?d ?p_from))
            (is-at ?d ?p_to)
            (increase (total-cost) 1)
        )
    )
)