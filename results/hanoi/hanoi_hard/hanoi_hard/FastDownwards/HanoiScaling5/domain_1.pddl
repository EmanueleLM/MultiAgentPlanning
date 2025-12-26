(define (domain hanoi-5-disks)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        disk peg
    )

    (:predicates
        ; Static size constraints: d1 is smaller than d2
        (smaller ?d1 - disk ?d2 - disk) 

        ; Location and Stacking dynamics
        (at ?d - disk ?p - peg)      ; d is located at peg p
        (on ?d1 - disk ?d2 - disk)   ; d1 is immediately above d2
        (on-peg ?d - disk ?p - peg)  ; d is the bottom disk resting directly on peg p

        ; State indicators
        (clear ?d - disk)            ; d is the top disk on its stack
        (empty ?p - peg)             ; p has no disks
    )

    ; A1: Move D from D_Base (Disk) to D_Target (Disk)
    (:action move-d-d-to-d
        :parameters (?d - disk ?d_base - disk ?d_target - disk ?p_from - peg ?p_to - peg)
        :precondition (and
            ; D is available at source
            (at ?d ?p_from)
            (clear ?d)
            (on ?d ?d_base)
            (at ?d_base ?p_from) ; D_base ensures stack integrity at source
            
            ; Destination D_target is available and larger than D
            (at ?d_target ?p_to)
            (clear ?d_target)
            (smaller ?d ?d_target) ; SIZE RULE
        )
        :effect (and
            ; Source updates (D moves off D_base)
            (not (on ?d ?d_base))
            (clear ?d_base) 
            
            ; Destination updates (D lands on D_target)
            (on ?d ?d_target)
            (not (clear ?d_target))
            
            ; Location updates
            (not (at ?d ?p_from))
            (at ?d ?p_to)
        )
    )

    ; A2: Move D from D_Base (Disk) to P_Target (Empty Peg)
    (:action move-d-d-to-p
        :parameters (?d - disk ?d_base - disk ?p_from - peg ?p_to - peg)
        :precondition (and
            ; D is available at source
            (at ?d ?p_from)
            (clear ?d)
            (on ?d ?d_base)
            (at ?d_base ?p_from)
            
            ; Destination P_to is empty
            (empty ?p_to)
        )
        :effect (and
            ; Source updates
            (not (on ?d ?d_base))
            (clear ?d_base)
            
            ; Destination updates (D lands on P_to)
            (on-peg ?d ?p_to)
            (not (empty ?p_to))
            
            ; Location updates
            (not (at ?d ?p_from))
            (at ?d ?p_to)
            ; D remains clear
        )
    )

    ; A3: Move D from P_Base (Peg, D is bottom disk) to D_Target (Disk)
    (:action move-d-p-to-d
        :parameters (?d - disk ?p_from - peg ?d_target - disk ?p_to - peg)
        :precondition (and
            ; D is available at source, resting on the peg
            (at ?d ?p_from)
            (clear ?d)
            (on-peg ?d ?p_from)
            
            ; Destination D_target is available and larger than D
            (at ?d_target ?p_to)
            (clear ?d_target)
            (smaller ?d ?d_target) ; SIZE RULE
        )
        :effect (and
            ; Source updates (P_from becomes empty)
            (not (on-peg ?d ?p_from))
            (empty ?p_from)
            
            ; Destination updates
            (on ?d ?d_target)
            (not (clear ?d_target))
            
            ; Location updates
            (not (at ?d ?p_from))
            (at ?d ?p_to)
        )
    )

    ; A4: Move D from P_Base (Peg, D is bottom disk) to P_Target (Empty Peg)
    (:action move-d-p-to-p
        :parameters (?d - disk ?p_from - peg ?p_to - peg)
        :precondition (and
            ; D is available at source, resting on the peg
            (at ?d ?p_from)
            (clear ?d)
            (on-peg ?d ?p_from)
            
            ; Destination P_to is empty
            (empty ?p_to)
        )
        :effect (and
            ; Source updates
            (not (on-peg ?d ?p_from))
            (empty ?p_from)
            
            ; Destination updates
            (on-peg ?d ?p_to)
            (not (empty ?p_to))
            
            ; Location updates
            (not (at ?d ?p_from))
            (at ?d ?p_to)
            ; D remains clear
        )
    )
)