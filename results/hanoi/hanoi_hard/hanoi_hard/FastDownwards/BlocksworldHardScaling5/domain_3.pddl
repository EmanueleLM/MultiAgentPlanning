(define (domain hanoi)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types
        disk
        peg
    )
    (:predicates
        (smaller ?d1 - disk ?d2 - disk) ; d1 is strictly smaller than d2 (Static)
        (on ?d1 - disk ?d2 - disk)      ; d1 is immediately on d2
        (on_peg ?d - disk ?p - peg)     ; d is the lowest disk, resting on peg p surface
        (clear ?d - disk)               ; d has nothing on it (is available to move)
        (peg_empty ?p - peg)            ; p has no disks
    )
    (:functions
        (total-cost) - number
    )

    ;; 1. Move Disk D from supporting disk DF to supporting disk DT
    (action move_disk_to_disk
        :parameters (?d - disk ?df - disk ?dt - disk)
        :precondition (and
            (on ?d ?df)
            (clear ?d)
            (clear ?dt)
            (smaller ?d ?dt) ; Size constraint: D must be smaller than DT
        )
        :effect (and
            (not (on ?d ?df))
            (on ?d ?dt)
            (clear ?df)
            (not (clear ?dt))
            (increase (total-cost) 1)
        )
    )

    ;; 2. Move Disk D from supporting disk DF onto an empty peg P
    (action move_disk_to_peg_surface
        :parameters (?d - disk ?df - disk ?p - peg)
        :precondition (and
            (on ?d ?df)
            (clear ?d)
            (peg_empty ?p)
        )
        :effect (and
            (not (on ?d ?df))
            (on_peg ?d ?p)
            (clear ?df)
            (not (peg_empty ?p))
            (increase (total-cost) 1)
        )
    )

    ;; 3. Move Disk D (bottom of P stack) onto supporting disk DT
    (action move_bottom_disk_to_disk
        :parameters (?d - disk ?dt - disk ?p - peg)
        :precondition (and
            (on_peg ?d ?p)
            (clear ?d)
            (clear ?dt)
            (smaller ?d ?dt) ; Size constraint: D must be smaller than DT
        )
        :effect (and
            (not (on_peg ?d ?p))
            (on ?d ?dt)
            
            (peg_empty ?p) ; Since D was the bottom disk and clear, the peg becomes empty
            (not (clear ?dt))
            (increase (total-cost) 1)
        )
    )
    
    ;; 4. Move Disk D (bottom of P1 stack) onto empty Peg P2
    (action move_bottom_disk_to_empty_peg
        :parameters (?d - disk ?p1 - peg ?p2 - peg)
        :precondition (and
            (on_peg ?d ?p1)
            (clear ?d)
            (peg_empty ?p2)
        )
        :effect (and
            (not (on_peg ?d ?p1))
            (on_peg ?d ?p2)
            
            (peg_empty ?p1)
            (not (peg_empty ?p2))
            (increase (total-cost) 1)
        )
    )