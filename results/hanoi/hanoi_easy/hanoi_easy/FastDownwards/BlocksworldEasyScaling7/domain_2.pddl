(define (domain hanoi-4-disk)
    (:requirements :strips :typing :negative-preconditions)
    
    (:types
        base ; Common supertype for anything a disk can rest upon or that can be clear
        disk - base
        peg - base
    )
    
    (:predicates
        (on ?d - disk ?x - base) 
        (clear ?x - base)      
        (smaller ?d1 - disk ?d2 - disk)
    )
    
    ; Action 1: Move disk D from X (base) onto an empty Peg P_to
    (:action move-d-to-peg
        :parameters (?d - disk ?x - base ?p_to - peg)
        :precondition (and
            (on ?d ?x)
            (clear ?d)
            (clear ?p_to)
        )
        :effect (and
            (not (on ?d ?x))
            (not (clear ?p_to))
            (clear ?x) ; X (disk or peg) becomes clear
            (on ?d ?p_to)
        )
    )
    
    ; Action 2: Move disk D from X (base) onto a Disk T
    ; Constraints: D must be smaller than T
    (:action move-d-to-disk
        :parameters (?d - disk ?x - base ?t - disk)
        :precondition (and
            (on ?d ?x)
            (clear ?d)
            (clear ?t)
            (smaller ?d ?t) 
        )
        :effect (and
            (not (on ?d ?x))
            (not (clear ?t))
            (clear ?x) ; X (disk or peg) becomes clear
            (on ?d ?t)
        )
    )
)