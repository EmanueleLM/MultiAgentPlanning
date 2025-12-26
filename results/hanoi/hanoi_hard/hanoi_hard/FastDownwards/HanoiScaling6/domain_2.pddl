(define (domain hanoi-6)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types 
        disk 
        peg
    )

    (:predicates
        (smaller ?d1 - disk ?d2 - disk) ; d1 is smaller than d2 (static)
        
        (on-disk ?d1 - disk ?d2 - disk) ; d1 is immediately on d2
        (on-peg ?d - disk ?p - peg)     ; d is the bottom disk resting on peg p
        
        (clear ?d - disk)               ; d has nothing on top (is movable)
        (peg-clear ?p - peg)            ; p is empty (base is usable)
    )
    
    (:functions
        (total-cost)
    )

    ;; 1. Move Disk D from resting on Disk D_from onto Disk D_to
    ;; Source: D_from (disk); Destination: D_to (disk)
    (:action move_d_d_to_d
        :parameters (?d - disk ?d_from - disk ?d_to - disk)
        :precondition (and
            (clear ?d)
            (on-disk ?d ?d_from)
            (clear ?d_to)
            (smaller ?d ?d_to)
        )
        :effect (and
            (not (on-disk ?d ?d_from))
            (not (clear ?d_to))
            (on-disk ?d ?d_to)
            (clear ?d_from)
            (increase (total-cost) 1)
        )
    )

    ;; 2. Move Disk D from resting on Disk D_from onto Peg P_to
    ;; Source: D_from (disk); Destination: P_to (peg base)
    (:action move_d_d_to_p
        :parameters (?d - disk ?d_from - disk ?p_to - peg)
        :precondition (and
            (clear ?d)
            (on-disk ?d ?d_from)
            (peg-clear ?p_to)
        )
        :effect (and
            (not (on-disk ?d ?d_from))
            (not (peg-clear ?p_to))
            (on-peg ?d ?p_to)
            (clear ?d_from)
            (increase (total-cost) 1)
        )
    )

    ;; 3. Move Disk D from resting on Peg P_from onto Disk D_to
    ;; Source: P_from (peg base); Destination: D_to (disk)
    (:action move_d_p_to_d
        :parameters (?d - disk ?p_from - peg ?d_to - disk)
        :precondition (and
            (clear ?d)
            (on-peg ?d ?p_from)
            (clear ?d_to)
            (smaller ?d ?d_to)
        )
        :effect (and
            (not (on-peg ?d ?p_from))
            (not (clear ?d_to))
            (on-disk ?d ?d_to)
            (peg-clear ?p_from)
            (increase (total-cost) 1)
        )
    )
    
    ;; 4. Move Disk D from resting on Peg P_from onto Peg P_to
    ;; Source: P_from (peg base); Destination: P_to (peg base)
    (:action move_d_p_to_p
        :parameters (?d - disk ?p_from - peg ?p_to - peg)
        :precondition (and
            (clear ?d)
            (on-peg ?d ?p_from)
            (peg-clear ?p_to)
            (not (= ?p_from ?p_to))
        )
        :effect (and
            (not (on-peg ?d ?p_from))
            (not (peg-clear ?p_to))
            (on-peg ?d ?p_to)
            (peg-clear ?p_from)
            (increase (total-cost) 1)
        )
    )
)