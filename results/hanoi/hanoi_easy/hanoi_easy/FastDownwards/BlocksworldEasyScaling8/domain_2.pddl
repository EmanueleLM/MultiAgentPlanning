(define (domain hanoi-4disk)
    (:requirements :strips :typing :action-costs)
    (:types
        disk peg
    )
    (:predicates
        (on-disk ?d1 - disk ?d2 - disk) ; D1 is on D2
        (on-peg ?d - disk ?p - peg)     ; D is on Peg P (D is the base of the stack)
        (clear-disk ?d - disk)          ; Nothing is on D
        (clear-peg ?p - peg)            ; Peg P is empty
        (smaller ?d1 - disk ?d2 - disk) ; D1 is strictly smaller than D2 (static)
    )

    (:functions
        (total-cost)
    )

    ; 1. Move Disk D from Disk X onto an empty Peg P
    (:action move_from_disk_to_empty_peg
        :parameters (?d - disk ?x - disk ?p - peg)
        :precondition (and
            (on-disk ?d ?x)
            (clear-disk ?d) ; D must be the topmost disk to move
            (clear-peg ?p)  ; Peg P must be empty
        )
        :effect (and
            (not (on-disk ?d ?x))
            (on-peg ?d ?p)
            (clear-disk ?x)      ; X becomes clear
            (not (clear-peg ?p)) ; P is now occupied by D
            (increase (total-cost) 1)
        )
    )

    ; 2. Move Disk D from Disk X onto Disk Y (Stacking move)
    (:action move_from_disk_to_disk
        :parameters (?d - disk ?x - disk ?y - disk)
        :precondition (and
            (on-disk ?d ?x)
            (clear-disk ?d)
            (clear-disk ?y)
            (smaller ?d ?y) ; Constraint: D must be smaller than Y
        )
        :effect (and
            (not (on-disk ?d ?x))
            (on-disk ?d ?y)
            (clear-disk ?x)
            (not (clear-disk ?y))
            (increase (total-cost) 1)
        )
    )
    
    ; 3. Move Disk D from Peg X onto an empty Peg P (Moving the stack base when it is only D)
    (:action move_from_peg_to_empty_peg
        :parameters (?d - disk ?x - peg ?p - peg)
        :precondition (and
            (on-peg ?d ?x)
            (clear-disk ?d) ; D must be the only disk on X
            (clear-peg ?p)
        )
        :effect (and
            (not (on-peg ?d ?x))
            (on-peg ?d ?p)
            (clear-peg ?x)
            (not (clear-peg ?p))
            (increase (total-cost) 1)
        )
    )

    ; 4. Move Disk D from Peg X onto Disk Y (Moving a base disk onto a larger disk)
    (:action move_from_peg_to_disk
        :parameters (?d - disk ?x - peg ?y - disk)
        :precondition (and
            (on-peg ?d ?x)
            (clear-disk ?d)
            (clear-disk ?y)
            (smaller ?d ?y)
        )
        :effect (and
            (not (on-peg ?d ?x))
            (on-disk ?d ?y)
            (clear-peg ?x)
            (not (clear-disk ?y))
            (increase (total-cost) 1)
        )
    )
)