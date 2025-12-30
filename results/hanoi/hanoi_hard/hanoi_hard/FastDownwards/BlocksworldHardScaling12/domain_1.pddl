(define (domain hanoi-6-disks)
    (:requirements :typing :negative-preconditions :action-costs)
    (:types
        disk
        peg
    )
    (:predicates
        (on ?d1 - disk ?d2 - disk)      ; d1 is directly on d2
        (on-base ?d - disk ?p - peg)    ; d is the lowest disk on peg p
        (at ?d - disk ?p - peg)         ; d is currently located at peg p
        (clear ?d - disk)               ; Nothing is on d (topmost)
        (empty ?p - peg)                ; p has no disks
        (smaller ?d1 - disk ?d2 - disk) ; d1 is strictly smaller than d2 (static)
    )
    (:functions
        (total-cost) - number
    )

    ; --- ACTION 1: Move D (from D_below) onto D_target (on P_to) ---
    ; D must be smaller than D_target.
    (:action move_from_disk_to_disk
        :parameters (?d - disk ?p_from - peg ?p_to - peg ?d_below - disk ?d_target - disk)
        :precondition (and
            (clear ?d)
            (at ?d ?p_from)
            (on ?d ?d_below)
            (clear ?d_target)
            (at ?d_target ?p_to)
            (smaller ?d ?d_target)
            (not (= ?p_from ?p_to))
        )
        :effect (and
            ; Source change
            (not (on ?d ?d_below))
            (clear ?d_below)

            ; Target change
            (not (clear ?d_target))
            (on ?d ?d_target)

            ; Location update 
            (not (at ?d ?p_from))
            (at ?d ?p_to)

            (increase (total-cost) 1)
        )
    )

    ; --- ACTION 2: Move D (from D_below) onto empty P_to ---
    (:action move_from_disk_to_peg
        :parameters (?d - disk ?p_from - peg ?p_to - peg ?d_below - disk)
        :precondition (and
            (clear ?d)
            (at ?d ?p_from)
            (on ?d ?d_below)
            (empty ?p_to)
            (not (= ?p_from ?p_to))
        )
        :effect (and
            ; Source change
            (not (on ?d ?d_below))
            (clear ?d_below)
            
            ; Target change
            (not (empty ?p_to))
            (on-base ?d ?p_to)
            
            ; Location update 
            (not (at ?d ?p_from))
            (at ?d ?p_to)
            
            (increase (total-cost) 1)
        )
    )

    ; --- ACTION 3: Move D (from P_from base) onto D_target (on P_to) ---
    ; D must be smaller than D_target.
    (:action move_from_peg_to_disk
        :parameters (?d - disk ?p_from - peg ?p_to - peg ?d_target - disk)
        :precondition (and
            (clear ?d)
            (at ?d ?p_from)
            (on-base ?d ?p_from)
            (clear ?d_target)
            (at ?d_target ?p_to)
            (smaller ?d ?d_target)
            (not (= ?p_from ?p_to))
        )
        :effect (and
            ; Source change
            (not (on-base ?d ?p_from))
            (empty ?p_from)
            
            ; Target change
            (not (clear ?d_target))
            (on ?d ?d_target)
            
            ; Location update 
            (not (at ?d ?p_from))
            (at ?d ?p_to)
            
            (increase (total-cost) 1)
        )
    )
    
    ; --- ACTION 4: Move D (from P_from base) onto empty P_to ---
    (:action move_from_peg_to_peg
        :parameters (?d - disk ?p_from - peg ?p_to - peg)
        :precondition (and
            (clear ?d)
            (at ?d ?p_from)
            (on-base ?d ?p_from)
            (empty ?p_to)
            (not (= ?p_from ?p_to))
        )
        :effect (and
            ; Source change
            (not (on-base ?d ?p_from))
            (empty ?p_from)
            
            ; Target change
            (not (empty ?p_to))
            (on-base ?d ?p_to)
            
            ; Location update 
            (not (at ?d ?p_from))
            (at ?d ?p_to)

            (increase (total-cost) 1)
        )
    )
)