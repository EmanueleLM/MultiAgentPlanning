(define (domain hanoi-7-disks)
    (:requirements :typing :negative-preconditions :action-costs)
    (:types
        disk peg - object
    )
    (:predicates
        (on ?d1 - disk ?d2 - disk)   ; d1 is directly on d2
        (at ?d - disk ?p - peg)      ; d is the bottom disk on peg p
        (clear ?d - disk)            ; d has nothing on it
        (is-empty ?p - peg)          ; p has no disks
        (smaller ?d1 - disk ?d2 - disk) ; Static: d1 is smaller than d2
    )

    (:functions
        (total-cost)
    )

    ; 1. Move a non-base disk onto another disk
    (:action move-disk-to-disk
        :parameters (?d - disk ?d_from - disk ?d_to - disk)
        :precondition (and
            (clear ?d)
            (on ?d ?d_from)
            (clear ?d_to)
            (smaller ?d ?d_to)
        )
        :effect (and
            (not (on ?d ?d_from))
            (on ?d ?d_to)
            (clear ?d_from)
            (not (clear ?d_to))
            (increase (total-cost) 1)
        )
    )
    
    ; 2. Move a non-base disk onto an empty peg
    (:action move-disk-to-peg
        :parameters (?d - disk ?d_from - disk ?p_to - peg)
        :precondition (and
            (clear ?d)
            (on ?d ?d_from)
            (is-empty ?p_to)
        )
        :effect (and
            (not (on ?d ?d_from))
            (at ?d ?p_to)
            (clear ?d_from)
            (not (is-empty ?p_to))
            (increase (total-cost) 1)
        )
    )

    ; 3. Move a base disk onto another disk
    (:action move-base-disk-to-disk
        :parameters (?d - disk ?p_from - peg ?d_to - disk)
        :precondition (and
            (clear ?d)
            (at ?d ?p_from)
            (clear ?d_to)
            (smaller ?d ?d_to)
        )
        :effect (and
            (not (at ?d ?p_from))
            (on ?d ?d_to)
            (is-empty ?p_from)
            (not (clear ?d_to))
            (increase (total-cost) 1)
        )
    )
    
    ; 4. Move a base disk onto an empty peg
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