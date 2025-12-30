(define (domain hanoi-5-disks)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types disk peg - location)
    
    (:predicates
        (on ?d - disk ?l - location) ; d is supported by l (disk or peg)
        (clear ?l - location)       ; l has nothing on it
        (smaller ?d1 - disk ?d2 - disk) ; d1 is strictly smaller than d2 (Static)
    )
    
    (:functions ((total-cost)) - number)
    
    ; Action 1: Move disk D from F onto empty peg P
    (:action move-to-peg
        :parameters (?d - disk ?from - location ?p - peg)
        :precondition (and
            ; 1. Must be the top disk
            (on ?d ?from)
            (clear ?d)
            
            ; 2. Target peg must be empty (clear)
            (clear ?p)
        )
        :effect (and
            (not (on ?d ?from))
            (on ?d ?p)
            
            ; Update clearance status
            (not (clear ?p))
            (clear ?from)
            
            ; Cost
            (increase (total-cost) 1)
        )
    )
    
    ; Action 2: Move disk D from F onto disk D2
    (:action move-to-disk
        :parameters (?d - disk ?from - location ?d2 - disk)
        :precondition (and
            ; 1. Must be the top disk
            (on ?d ?from)
            (clear ?d)
            
            ; 2. Target disk D2 must be clear
            (clear ?d2)
            
            ; 3. Size constraint: D must be smaller than D2
            (smaller ?d ?d2)
        )
        :effect (and
            (not (on ?d ?from))
            (on ?d ?d2)
            
            ; Update clearance status
            (not (clear ?d2))
            (clear ?from)
            
            ; Cost
            (increase (total-cost) 1)
        )
    )
)