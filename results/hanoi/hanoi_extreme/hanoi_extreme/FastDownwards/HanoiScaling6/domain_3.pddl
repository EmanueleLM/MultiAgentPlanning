(define (domain hanoi-6-disks)
    (:requirements :typing :action-costs)
    (:types
        disk
        peg
    )
    (:predicates
        (on ?d1 - disk ?b - (either disk peg)) ; d1 is on base b
        (clear ?b - (either disk peg)) ; b has nothing on it
        (smaller ?d1 - disk ?d2 - disk) ; d1 is smaller than d2 (static)
    )

    (:functions
        (total-cost) - number
    )

    ; Action 1: Move Disk D onto Peg P_TO (P_TO must be clear/empty)
    (:action move-to-peg
        :parameters (?d - disk ?p_to - peg ?b_from - (either disk peg))
        :precondition (and
            (on ?d ?b_from)    
            (clear ?d)         
            (clear ?p_to)      
        )
        :effect (and
            (not (on ?d ?b_from))
            (on ?d ?p_to)
            (clear ?b_from)     
            (not (clear ?p_to)) 
            (increase (total-cost) 1)
        )
    )

    ; Action 2: Move Disk D onto Disk D_TO (D must be smaller than D_TO, D_TO must be clear)
    (:action move-to-disk
        :parameters (?d - disk ?d_to - disk ?b_from - (either disk peg))
        :precondition (and
            (on ?d ?b_from)    
            (clear ?d)         
            (clear ?d_to)      
            
            ; Size constraint: D must be strictly smaller than D_TO.
            (smaller ?d ?d_to) 
        )
        :effect (and
            (not (on ?d ?b_from))
            (on ?d ?d_to)
            (clear ?b_from)     
            (not (clear ?d_to)) 
            (increase (total-cost) 1)
        )
    )
)