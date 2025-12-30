(define (domain hanoi-4-disk)
    (:requirements :strips :typing :negative-preconditions)
    
    (:types
        disk peg
    )
    
    (:predicates
        (on ?d - disk ?x - (either disk peg)) ; d is immediately on x
        (clear ?x - (either disk peg))      ; x has nothing on top of it
        (smaller ?d1 - disk ?d2 - disk)     ; d1 is strictly smaller than d2
    )
    
    ; Action 1: Move disk D from X (disk or peg) onto an empty Peg P_to
    ; Precondition: D must be the top disk (?clear D is implicit as only the top disk is moved, but we enforce it on the source X), and P_to must be empty.
    (:action move-to-peg
        :parameters (?d - disk ?x - (either disk peg) ?p_to - peg)
        :precondition (and
            (on ?d ?x)
            (clear ?d)
            (clear ?p_to)
        )
        :effect (and
            (not (on ?d ?x))
            (not (clear ?p_to))
            (clear ?x)
            (on ?d ?p_to)
        )
    )
    
    ; Action 2: Move disk D from X (disk or peg) onto a Disk T
    ; Precondition: D must be the top disk, T must be clear, and D must be smaller than T.
    (:action move-to-disk
        :parameters (?d - disk ?x - (either disk peg) ?t - disk)
        :precondition (and
            (on ?d ?x)
            (clear ?d)
            (clear ?t)
            (smaller ?d ?t) ; CORE RULE: D must be smaller than T
        )
        :effect (and
            (not (on ?d ?x))
            (not (clear ?t))
            (clear ?x)
            (on ?d ?t)
        )
    )
)