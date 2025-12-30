(define (domain hanoi-4disk)
    (:requirements :strips :typing :action-costs)
    (:types
        disk peg
    )
    (:predicates
        (on ?d - disk ?x - (either disk peg)) ; Disk D is on X
        (clear ?x - (either disk peg))        ; Nothing is on X (X is available)
        (smaller ?d1 - disk ?d2 - disk)       ; D1 is strictly smaller than D2 (static)
    )

    (:functions
        (total-cost)
    )

    ; 1. Move Disk D from some stack X onto an empty/top Peg P
    (:action move_d_to_peg
        :parameters (?d - disk ?x - (either disk peg) ?p - peg)
        :precondition (and
            (on ?d ?x)
            (clear ?d) ; D must be the topmost disk to move
            (clear ?p) ; Peg P must be clear (empty)
        )
        :effect (and
            (not (on ?d ?x))
            (on ?d ?p)
            (clear ?x)      ; X becomes clear (source object is now accessible)
            (not (clear ?p)) ; P is now covered by D
            (increase (total-cost) 1)
        )
    )

    ; 2. Move Disk D from some stack X onto Disk Y
    (:action move_d_to_disk
        :parameters (?d - disk ?x - (either disk peg) ?y - disk)
        :precondition (and
            (on ?d ?x)
            (clear ?d) ; D must be the topmost disk to move
            (clear ?y) ; Disk Y must be clear (available to receive D)
            (smaller ?d ?y) ; Constraint: D must be smaller than Y
        )
        :effect (and
            (not (on ?d ?x))
            (on ?d ?y)
            (clear ?x)      ; X becomes clear
            (not (clear ?y)) ; Y is now covered by D
            (increase (total-cost) 1)
        )
    )
)