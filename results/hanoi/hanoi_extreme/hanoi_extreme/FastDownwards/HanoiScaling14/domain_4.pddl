(define (domain hanoi-7-disks)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types
        disk peg - location
        location - object
    )
    (:predicates
        ; Disk d is directly on top of location loc (peg or disk)
        (on ?d - disk ?loc - location)
        ; Location loc has nothing resting on it
        (clear ?loc - location)
        ; d1 is strictly larger than d2 (Static fact)
        (larger ?d1 - disk ?d2 - disk)
    )
    (:functions
        (total-cost) - number
    )

    (:action move-to-peg
        :parameters (?d - disk ?from - location ?p - peg)
        :precondition (and
            ; 1. Disk D must be resting on FROM location
            (on ?d ?from)
            ; 2. D must be the top disk (nothing on D)
            (clear ?d) 
            ; 3. Target peg P must be free
            (clear ?p)
        )
        :effect (and
            ; Update location of D
            (not (on ?d ?from))
            (on ?d ?p)
            
            ; Update clear status
            (clear ?from)
            (not (clear ?p))
            
            ; Increment move count
            (increase (total-cost) 1)
        )
    )

    (:action move-to-disk
        :parameters (?d1 - disk ?from - location ?d2 - disk)
        :precondition (and
            ; 1. Disk D1 must be resting on FROM location
            (on ?d1 ?from)
            ; 2. D1 must be the top disk
            (clear ?d1) 
            ; 3. Target disk D2 must be free
            (clear ?d2)
            
            ; 4. Size constraint: D1 must not be larger than D2
            (not (larger ?d1 ?d2))
        )
        :effect (and
            ; Update location of D1
            (not (on ?d1 ?from))
            (on ?d1 ?d2)
            
            ; Update clear status
            (clear ?from)
            (not (clear ?d2)) 
            
            ; Increment move count
            (increase (total-cost) 1)
        )
    )
)