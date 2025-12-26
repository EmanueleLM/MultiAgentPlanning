(define (domain hanoi-7-disks)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types
        disk peg - object
    )
    (:predicates
        (on ?d1 - disk ?d2 - disk) ; d1 is on top of d2
        (at ?d - disk ?p - peg)   ; d is the base disk on peg p
        (clear ?d - disk)         ; d is the top disk (can be moved)
        (is-empty ?p - peg)       ; peg p has no disks
        (smaller ?d1 - disk ?d2 - disk) ; d1 is smaller than d2
    )

    (:functions
        (total-cost)
    )

    ; 1. Move a non-base disk (?d) onto another disk (?d_to)
    (:action move-disk-to-disk
        :parameters (?d - disk ?d_under - disk ?d_to - disk)
        :precondition (and
            (clear ?d)
            (on ?d ?d_under) 
            (clear ?d_to)    
            (smaller ?d ?d_to) ; Rule: Never place a larger disk on a smaller disk
        )
        :effect (and
            (not (on ?d ?d_under))
            (on ?d ?d_to)
            (clear ?d_under) 
            (not (clear ?d_to)) 
            (increase (total-cost) 1)
        )
    )
    
    ; 2. Move a non-base disk (?d) onto an empty peg (?p_to)
    (:action move-disk-to-peg
        :parameters (?d - disk ?d_under - disk ?p_to - peg)
        :precondition (and
            (clear ?d)
            (on ?d ?d_under) 
            (is-empty ?p_to) 
        )
        :effect (and
            (not (on ?d ?d_under))
            (at ?d ?p_to)    
            (clear ?d_under) 
            (not (is-empty ?p_to))
            (increase (total-cost) 1)
        )
    )

    ; 3. Move a base disk (?d) onto another disk (?d_to)
    (:action move-base-disk-to-disk
        :parameters (?d - disk ?p_from - peg ?d_to - disk)
        :precondition (and
            (clear ?d)
            (at ?d ?p_from)   
            (clear ?d_to)
            (smaller ?d ?d_to) ; Rule: Never place a larger disk on a smaller disk
        )
        :effect (and
            (not (at ?d ?p_from))
            (on ?d ?d_to)
            (is-empty ?p_from) 
            (not (clear ?d_to))
            (increase (total-cost) 1)
        )
    )
    
    ; 4. Move a base disk (?d) onto an empty peg (?p_to).
    (:action move-base-disk-to-peg
        :parameters (?d - disk ?p_from - peg ?p_to - peg)
        :precondition (and
            (clear ?d)
            (at ?d ?p_from)
            (is-empty ?p_to)
        )
        :effect (and
            (not (at ?d ?p_from))
            (at ?d ?p_to)
            (is-empty ?p_from) 
            (not (is-empty ?p_to))
            (increase (total-cost) 1)
        )
    )
)