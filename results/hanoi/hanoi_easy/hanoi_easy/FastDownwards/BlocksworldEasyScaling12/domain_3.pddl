(define (domain hanoi-4disk)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types
        location - object
        disk peg - location
    )
    (:predicates
        (on ?d - disk ?l - location)
        (clear ?l - location) ; L is clear if nothing is resting on it
        (smaller ?d1 - disk ?d2 - disk) ; d1 is smaller than d2
    )
    
    (:functions
        (total-cost) - number
    )

    (:action move-to-peg
        :parameters (?d - disk ?l1 - location ?p - peg)
        :precondition (and
            (on ?d ?l1)           ; D is on L1
            (clear ?d)            ; D must be the top disk being moved
            (clear ?p)            ; P must be clear to receive D
            (not (= ?l1 ?p))      ; Cannot move to the same location
        )
        :effect (and
            (not (on ?d ?l1))
            (on ?d ?p)
            
            (clear ?l1)           ; L1 (what D was resting on) is now clear
            (not (clear ?p))      ; P (where D rests) is now covered/not clear
            
            (increase (total-cost) 1)
        )
    )

    (:action move-to-disk
        :parameters (?d - disk ?l1 - location ?d2 - disk)
        :precondition (and
            (on ?d ?l1)           ; D is on L1
            (clear ?d)            ; D must be the top disk being moved
            (clear ?d2)           ; D2 must be clear to receive D
            (not (= ?l1 ?d2))     ; Cannot move to the same location
            
            ; Size constraint: D must be smaller than D2
            (smaller ?d ?d2)
        )
        :effect (and
            (not (on ?d ?l1))
            (on ?d ?d2)
            
            (clear ?l1)           ; L1 (what D was resting on) is now clear
            (not (clear ?d2))     ; D2 (where D rests) is now covered/not clear
            
            (increase (total-cost) 1)
        )
    )
)