(define (domain hanoi-4disks)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types disk peg)
    
    (:predicates
        (smaller ?d1 - disk ?d2 - disk) ; d1 is smaller than d2 (static)
        (on-disk ?d1 - disk ?d2 - disk) ; d1 is directly on d2
        (on-peg ?d - disk ?p - peg)     ; d is the base disk on p
        (clear-disk ?d - disk)          ; d has nothing on top of it
        (clear-peg ?p - peg)            ; p has no disks on it (empty)
    )
    
    (:functions
        (total-cost)
    )

    ;; 1. Move D from a disk (D_source) to another disk (D_dest)
    (:action move-disk-to-disk
        :parameters (?d - disk ?d_source - disk ?d_dest - disk)
        :precondition (and
            (clear-disk ?d)
            (on-disk ?d ?d_source)
            (clear-disk ?d_dest)
            (smaller ?d ?d_dest)
        )
        :effect (and
            (not (on-disk ?d ?d_source))
            (on-disk ?d ?d_dest)
            
            (clear-disk ?d_source)
            (not (clear-disk ?d_dest))
            
            (increase (total-cost) 1)
        )
    )
    
    ;; 2. Move D from a disk (D_source) to an empty peg (P_to)
    (:action move-disk-to-peg
        :parameters (?d - disk ?p_to - peg ?d_source - disk)
        :precondition (and
            (clear-disk ?d)
            (on-disk ?d ?d_source)
            (clear-peg ?p_to)
        )
        :effect (and
            (not (on-disk ?d ?d_source))
            (on-peg ?d ?p_to)
            
            (clear-disk ?d_source)
            (not (clear-peg ?p_to))
            
            (increase (total-cost) 1)
        )
    )
    
    ;; 3. Move D from the base of P_from to a disk (D_dest)
    (:action move-base-to-disk
        :parameters (?d - disk ?p_from - peg ?d_dest - disk)
        :precondition (and
            (clear-disk ?d)
            (on-peg ?d ?p_from)
            (clear-disk ?d_dest)
            (smaller ?d ?d_dest)
        )
        :effect (and
            (not (on-peg ?d ?p_from))
            (on-disk ?d ?d_dest)
            
            (clear-peg ?p_from)
            (not (clear-disk ?d_dest))
            
            (increase (total-cost) 1)
        )
    )

    ;; 4. Move D from the base of P_from to an empty peg (P_to)
    (:action move-base-to-peg
        :parameters (?d - disk ?p_from - peg ?p_to - peg)
        :precondition (and
            (clear-disk ?d)
            (on-peg ?d ?p_from)
            (clear-peg ?p_to)
            (not (= ?p_from ?p_to))
        )
        :effect (and
            (not (on-peg ?d ?p_from))
            (on-peg ?d ?p_to)
            
            (clear-peg ?p_from)
            (not (clear-peg ?p_to))
            
            (increase (total-cost) 1)
        )
    )
)