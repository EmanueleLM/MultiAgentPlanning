(define (domain hanoi-5disk)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types
        disk peg
    )
    (:predicates
        ; Disk arrangement
        (on ?d1 - disk ?d2 - disk)  ; d1 is immediately on d2
        (on-base ?d - disk ?p - peg) ; d is immediately on the peg base p
        
        ; Availability for movement/placement
        (clear ?d - disk) ; d has nothing on top of it
        (clear-peg ?p - peg) ; Peg p is entirely empty (base is available)
        
        ; Size constraints (static)
        (smaller ?d1 - disk ?d2 - disk) ; d1 is smaller than d2
    )

    (:functions
        (total-cost) - number
    )

    ;; 1. Move D from source support Ds (disk) to target support Dt (disk)
    (:action move_D_from_Ds_to_Dt
        :parameters (?d - disk ?p1 - peg ?p2 - peg ?ds - disk ?dt - disk)
        :precondition (and
            (not (= ?p1 ?p2))
            (clear ?d)
            (clear ?dt) ; Target disk must be the top of its stack

            ; Size constraint: D must be smaller than Dt
            (smaller ?d ?dt)

            ; Source attachment (D on Ds)
            (on ?d ?ds)
        )
        :effect (and
            ; Move D
            (not (on ?d ?ds))
            (on ?d ?dt)

            ; Source support Ds becomes clear
            (clear ?ds)
            
            ; Target support Dt is no longer clear
            (not (clear ?dt))
            
            (increase (total-cost) 1)
        )
    )

    ;; 2. Move D from source support Ds (disk) to target peg P2 base (empty stack)
    (:action move_D_from_Ds_to_P2_base
        :parameters (?d - disk ?p1 - peg ?p2 - peg ?ds - disk)
        :precondition (and
            (not (= ?p1 ?p2))
            (clear ?d)
            
            ; Target must be an empty peg
            (clear-peg ?p2) 
            
            ; Source attachment (D on Ds)
            (on ?d ?ds)
        )
        :effect (and
            ; Move D
            (not (on ?d ?ds))
            (on-base ?d ?p2)
            
            ; Source support Ds becomes clear
            (clear ?ds)
            
            ; Target peg P2 is no longer empty
            (not (clear-peg ?p2))
            
            (increase (total-cost) 1)
        )
    )
    
    ;; 3. Move D from source peg P1 base to target disk Dt (disk)
    (:action move_D_from_P1_base_to_Dt
        :parameters (?d - disk ?p1 - peg ?p2 - peg ?dt - disk)
        :precondition (and
            (not (= ?p1 ?p2))
            (clear ?d)
            
            ; Target disk Dt must be clear
            (clear ?dt) 
            
            ; Size constraint: D must be smaller than Dt
            (smaller ?d ?dt)

            ; Source attachment (D on P1 base)
            (on-base ?d ?p1)
        )
        :effect (and
            ; Move D
            (not (on-base ?d ?p1))
            (on ?d ?dt)
            
            ; P1 base becomes clear / empty
            (clear-peg ?p1)
            
            ; Target disk Dt is no longer clear
            (not (clear ?dt))
            
            (increase (total-cost) 1)
        )
    )
    
    ;; 4. Move D from source peg P1 base to target peg P2 base (empty stack)
    (:action move_D_from_P1_base_to_P2_base
        :parameters (?d - disk ?p1 - peg ?p2 - peg)
        :precondition (and
            (not (= ?p1 ?p2))
            (clear ?d)
            
            ; Target peg P2 must be empty
            (clear-peg ?p2) 
            
            ; Source attachment (D on P1 base)
            (on-base ?d ?p1)
        )
        :effect (and
            ; Move D
            (not (on-base ?d ?p1))
            (on-base ?d ?p2)
            
            ; P1 base becomes clear / empty
            (clear-peg ?p1)
            
            ; Target peg P2 is no longer empty
            (not (clear-peg ?p2))
            
            (increase (total-cost) 1)
        )
    )
)