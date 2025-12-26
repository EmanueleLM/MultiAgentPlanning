(define (domain hanoi-6-disks)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types
        disk peg
    )
    
    (:predicates
        (is-on ?d - disk ?h - object)   ; ?d is immediately on ?h (where ?h is disk or peg)
        (is-clear ?h - object)          ; ?h (disk or peg) has nothing stacked on it
        (smaller ?d1 - disk ?d2 - disk) ; Static relation: D1 is strictly smaller than D2
    )
    
    (:functions 
        (total-cost) - number
    )

    ; Action to move disk D from base F to base T
    (:action move
        :parameters (?d - disk ?f - object ?t - object)
        :precondition (and
            (is-on ?d ?f)   ; D must be on F
            (is-clear ?d)   ; D must be the top disk
            (is-clear ?t)   ; T must be available to receive a disk
            
            ; Hanoi Rule Constraint: D must be smaller than T if T is a disk.
            ; We forbid the inverse: It is NOT allowed that T is smaller than D.
            ; If T is a peg, (smaller ?t ?d) is false, so (not (smaller ?t ?d)) is true.
            ; If T is a disk, this checks that T is not smaller than D (i.e., D is smaller than T).
            (not (smaller ?t ?d)) 
        )
        :effect (and
            ; Update placement
            (not (is-on ?d ?f))
            (is-on ?d ?t)
            
            ; Update clear status
            (not (is-clear ?t)) ; T is now covered by D
            (is-clear ?f)       ; F is now uncovered
            
            ; Increase cost
            (increase (total-cost) 1)
        )
    )
)