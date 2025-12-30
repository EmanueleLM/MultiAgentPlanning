(define (domain hanoi-5-disks)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    
    (:types
        location - object
        disk - location
        peg - location
    )
    
    (:predicates
        (on ?d - disk ?l - location) 
        (clear ?l - location) 
        (smaller ?d1 - disk ?d2 - disk)
    )

    (:functions
        (total-cost)
    )

    (:action move-disk-to-disk
        :parameters (?d - disk        ; The disk to move
                    ?l_from - location ; The location D is currently sitting on
                    ?d_to - disk       ; The disk D will sit on (target)
        )
        :precondition (and
            (on ?d ?l_from)
            (clear ?d)        ; D must be the top disk (movable)
            (clear ?d_to)     ; D_to must be clear (available slot on top)
            
            ; Size constraint: D_to must NOT be smaller than D
            (not (smaller ?d_to ?d)) 
        )
        :effect (and
            (not (on ?d ?l_from))
            (on ?d ?d_to)
            
            (clear ?l_from)     ; L_from is now clear
            (not (clear ?d_to)) ; D_to is now covered
            
            (increase (total-cost) 1)
        )
    )

    (:action move-disk-to-peg
        :parameters (?d - disk        ; The disk to move
                    ?l_from - location ; The location D is currently sitting on
                    ?p_to - peg        ; The peg D will sit on (target)
        )
        :precondition (and
            (on ?d ?l_from)
            (clear ?d)        ; D must be the top disk (movable)
            (clear ?p_to)     ; P_to must be empty
        )
        :effect (and
            (not (on ?d ?l_from))
            (on ?d ?p_to)
            
            (clear ?l_from)   ; L_from is now clear
            (not (clear ?p_to)) ; P_to is now covered by D
            
            (increase (total-cost) 1)
        )
    )
)