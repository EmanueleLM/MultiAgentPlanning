(define (domain hanoi-4disk)
    (:requirements :typing :negative-preconditions :action-costs)
    (:types
        disk peg - object
    )

    (:predicates
        (on ?d - disk ?x - (either disk peg)) ; d is immediately on x
        (clear ?x - (either disk peg))        ; x has nothing on it (top surface is available)
        (smaller ?d1 - disk ?d2 - disk)       ; d1 is smaller than d2 (static constraint)
    )
    
    (:functions
        (total-cost) - number
    )

    (:action move
        :parameters (?d - disk ?from - (either disk peg) ?to - (either disk peg))
        :precondition (and
            ; 1. D must be the top disk and must be on FROM
            (clear ?d) 
            (on ?d ?from)
            
            ; 2. TO must be available
            (clear ?to)
            
            ; 3. Size constraint: D must be smaller than TO, OR TO must be a peg.
            (or (peg ?to) (smaller ?d ?to))
        )
        :effect (and
            ; Move D
            (not (on ?d ?from))
            (on ?d ?to)
            
            ; Update clear status
            (not (clear ?to)) ; TO is now covered
            (clear ?from)     ; FROM is now exposed
            
            ; Action cost
            (increase (total-cost) 1)
        )
    )
)