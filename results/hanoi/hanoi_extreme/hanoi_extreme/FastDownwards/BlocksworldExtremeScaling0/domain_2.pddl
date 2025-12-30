(define (domain hanoi-7disk)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types
        disk 
        peg
    )
    
    (:predicates
        (on-disk ?d1 - disk ?d2 - disk)  ; d1 is on d2
        (on-peg ?d - disk ?p - peg)      ; d is the bottom disk on peg p
        
        (clear-disk ?d - disk)           ; d has nothing on it (is available to move OR receive a smaller disk)
        (clear-peg ?p - peg)             ; p has nothing on it (is empty/top available)
        
        (smaller ?d1 - disk ?d2 - disk)
        
        ; Location tracking (only needed for disks)
        (at-peg ?d - disk ?p - peg)
    )

    (:functions
        (total-cost)
    )
    
    ; --- 1. Move disk D from B1 (Disk) to B2 (Disk) ---
    ; D is taken off the stack and placed on a different disk B2.
    (:action move-disk-to-disk
        :parameters (?d - disk ?p1 - peg ?p2 - peg ?b1 - disk ?b2 - disk)
        :precondition (and
            (not (= ?p1 ?p2)) 
            
            ; Source checks
            (on-disk ?d ?b1)
            (clear-disk ?d)
            (at-peg ?d ?p1)
            (at-peg ?b1 ?p1)

            ; Destination checks
            (clear-disk ?b2)
            (at-peg ?b2 ?p2)
            
            ; Size constraint
            (smaller ?d ?b2)
        )
        :effect (and
            (not (on-disk ?d ?b1))
            (on-disk ?d ?b2)
            
            (clear-disk ?b1)
            (not (clear-disk ?b2))
            
            ; Location update
            (not (at-peg ?d ?p1))
            (at-peg ?d ?p2)

            (increase (total-cost) 1)
        )
    )

    ; --- 2. Move disk D from B1 (Disk) to P2 (Peg base) ---
    ; D is taken off the stack and placed on an empty peg P2.
    (:action move-disk-to-peg
        :parameters (?d - disk ?p1 - peg ?p2 - peg ?b1 - disk)
        :precondition (and
            (not (= ?p1 ?p2)) 
            
            ; Source checks
            (on-disk ?d ?b1)
            (clear-disk ?d)
            (at-peg ?d ?p1)
            (at-peg ?b1 ?p1)

            ; Destination checks
            (clear-peg ?p2)
        )
        :effect (and
            (not (on-disk ?d ?b1))
            (on-peg ?d ?p2)
            
            (clear-disk ?b1)
            (not (clear-peg ?p2))
            
            ; Location update
            (not (at-peg ?d ?p1))
            (at-peg ?d ?p2)

            (increase (total-cost) 1)
        )
    )

    ; --- 3. Move bottom disk D from P1 (Peg base) to B2 (Disk) ---
    ; D is the bottom disk (on P1) and is moved onto an existing stack (B2).
    (:action move-peg-to-disk
        :parameters (?d - disk ?p1 - peg ?p2 - peg ?b2 - disk)
        :precondition (and
            (not (= ?p1 ?p2)) 
            
            ; Source checks
            (on-peg ?d ?p1)
            (clear-disk ?d)
            (at-peg ?d ?p1)
            
            ; Destination checks
            (clear-disk ?b2)
            (at-peg ?b2 ?p2)
            
            ; Size constraint
            (smaller ?d ?b2)
        )
        :effect (and
            (not (on-peg ?d ?p1))
            (on-disk ?d ?b2)
            
            (clear-peg ?p1) ; P1 is now empty
            (not (clear-disk ?b2)) 
            
            ; Location update
            (not (at-peg ?d ?p1))
            (at-peg ?d ?p2)

            (increase (total-cost) 1)
        )
    )

    ; --- 4. Move bottom disk D from P1 (Peg base) to P2 (Peg base) ---
    ; D is the bottom disk (on P1) and is moved onto an empty peg P2.
    (:action move-peg-to-peg
        :parameters (?d - disk ?p1 - peg ?p2 - peg)
        :precondition (and
            (not (= ?p1 ?p2)) 
            (on-peg ?d ?p1)
            (clear-disk ?d)
            (clear-peg ?p2)
            (at-peg ?d ?p1)
        )
        :effect (and
            (not (on-peg ?d ?p1))
            (on-peg ?d ?p2)
            
            (clear-peg ?p1)
            (not (clear-peg ?p2))
            
            ; Location update
            (not (at-peg ?d ?p1))
            (at-peg ?d ?p2)

            (increase (total-cost) 1)
        )
    )
)