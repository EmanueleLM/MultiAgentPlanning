(define (domain hanoi-5disk)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types
        place
        disk - place
        peg - place
    )
    (:predicates
        ; Static knowledge: D1 is smaller than D2
        (smaller ?d1 - disk ?d2 - disk) 
        
        ; State tracking: D is resting on L
        (on ?d - disk ?l - place) 
        
        ; State tracking: L has nothing resting on it (L can be a disk or a peg)
        (clear ?l - place)        
    )
    
    (:functions
        (total-cost) - number
    )

    ;; 1. Move disk D onto empty Peg P
    (:action move-to-empty-peg
        :parameters (?d - disk ?f - place ?p - peg)
        :precondition (and
            (on ?d ?f)
            (clear ?d) ; D must be the top disk
            (clear ?p) ; P must be empty/clear base
        )
        :effect (and
            (not (on ?d ?f))
            (on ?d ?p)
            (not (clear ?p)) ; P is no longer clear
            (clear ?f)       ; F becomes clear
            (increase (total-cost) 1)
        )
    )

    ;; 2. Move disk D onto Disk T (D must be smaller than T)
    (:action move-onto-disk
        :parameters (?d - disk ?f - place ?t - disk)
        :precondition (and
            (on ?d ?f)
            (clear ?d)     ; D must be the top disk
            (clear ?t)     ; T must be the disk currently on top of its peg/stack
            (smaller ?d ?t) ; D must be smaller than T
        )
        :effect (and
            (not (on ?d ?f))
            (on ?d ?t)
            (not (clear ?t)) ; T is no longer clear
            (clear ?f)       ; F becomes clear
            (increase (total-cost) 1)
        )
    )
)