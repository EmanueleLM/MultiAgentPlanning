(define (domain hanoi-5-disks)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    
    (:types
        location - object
        disk - location
        peg - location
    )
    
    (:predicates
        ; Disk d is on location l (which is a disk or a peg)
        (on ?d - disk ?l - location) 
        ; Nothing is placed on location l. (Movable disk or empty peg)
        (clear ?l - location) 
        ; Static property: d1 is smaller than d2
        (smaller ?d1 - disk ?d2 - disk)
    )

    (:functions
        (total-cost)
    )

    (:action move
        :parameters (?d - disk        ; The disk to move
                    ?l_from - location ; The location D is currently sitting on
                    ?l_to - location   ; The location D will sit on
        )
        :precondition (and
            ; 1. D must be sitting on L_from
            (on ?d ?l_from)
            
            ; 2. D must be the top disk (movable)
            (clear ?d)
            
            ; 3. L_to must be clear (available slot)
            (clear ?l_to)
            
            ; 4. Size constraint check: D must not be placed on a smaller disk L_to.
            (or
                (peg ?l_to) ; If L_to is a peg, the move is always valid size-wise
                (and 
                    (disk ?l_to) 
                    (not (smaller ?l_to ?d)) ; L_to disk must NOT be smaller than D
                )
            )
        )
        :effect (and
            ; Update position
            (not (on ?d ?l_from))
            (on ?d ?l_to)
            
            ; Update clearness
            (clear ?l_from) 
            (not (clear ?l_to)) 
            
            ; Cost definition
            (increase (total-cost) 1)
        )
    )
)