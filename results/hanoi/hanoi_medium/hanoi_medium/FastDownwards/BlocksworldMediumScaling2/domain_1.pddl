(define (domain TOWER-OF-HANOI)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        disk peg
    )

    (:predicates
        ; Disk d is immediately on location l (disk or peg)
        (on ?d - disk ?l - (either disk peg)) 
        
        ; Nothing is on location x (disk or peg)
        (clear ?x - (either disk peg))        
        
        ; d1 is smaller than d2 (Static knowledge base)
        (smaller ?d1 - disk ?d2 - disk) 
    )
    
    ; Action 1: Move Disk D from Source L_FROM onto a PEG P_TO (must be clear/empty)
    (:action move-to-peg
        :parameters (?d - disk ?l_from - (either disk peg) ?p_to - peg)
        :precondition (and
            ; D must be the top disk
            (clear ?d)
            
            ; D must be currently on L_from
            (on ?d ?l_from)
            
            ; P_to must be empty
            (clear ?p_to) 
        )
        :effect (and
            ; Move D
            (not (on ?d ?l_from))
            (on ?d ?p_to)
            
            ; Update clear status
            (clear ?l_from)
            (not (clear ?p_to)) ; Peg is no longer clear if it has a disk
        )
    )

    ; Action 2: Move Disk D from Source L_FROM onto a DISK D_TO (must be clear, size check)
    (:action move-to-disk
        :parameters (?d - disk ?l_from - (either disk peg) ?d_to - disk)
        :precondition (and
            ; D must be the top disk
            (clear ?d)
            
            ; D must be currently on L_from
            (on ?d ?l_from)
            
            ; D_to must be the top of its stack
            (clear ?d_to)
            
            ; Size constraint: D must be smaller than D_to
            (smaller ?d ?d_to) 
        )
        :effect (and
            ; Move D
            (not (on ?d ?l_from))
            (on ?d ?d_to)
            
            ; Update clear status
            (clear ?l_from)
            (not (clear ?d_to)) ; D_to is no longer clear
        )
    )
)