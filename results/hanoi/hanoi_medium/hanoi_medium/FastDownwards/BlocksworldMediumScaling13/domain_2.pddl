(define (domain hanoi-5-disks)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        disk peg
    )
    (:predicates
        (on ?d1 - disk ?d2 - disk) ; d1 is immediately on d2
        (on-peg ?d - disk ?p - peg) ; d is immediately on peg p (d is the bottom disk)
        (is-top ?d - disk) ; d has nothing on it
        (empty ?p - peg) ; p has nothing on it
        (smaller ?d1 - disk ?d2 - disk) ; size ordering: d1 < d2
    )

    ;; Action 1: Move D from sitting on D_old to sitting on D_new
    (:action move_D_D
        :parameters (?d - disk ?d_old - disk ?d_new - disk)
        :precondition (and 
            (is-top ?d)
            (on ?d ?d_old)
            (is-top ?d_new)
            (smaller ?d ?d_new) ; Size constraint: D must be smaller than D_new
        )
        :effect (and
            (not (on ?d ?d_old))
            (not (is-top ?d_new))
            (on ?d ?d_new)
            (is-top ?d_old)
        )
    )
    
    ;; Action 2: Move D from sitting on D_old to empty Peg P_new
    (:action move_D_P_empty
        :parameters (?d - disk ?d_old - disk ?p_new - peg)
        :precondition (and
            (is-top ?d)
            (on ?d ?d_old)
            (empty ?p_new)
        )
        :effect (and
            (not (on ?d ?d_old))
            (on-peg ?d ?p_new)
            (is-top ?d_old)
            (not (empty ?p_new))
        )
    )
    
    ;; Action 3: Move D from Peg P_old (base disk) to Disk D_new
    (:action move_P_D
        :parameters (?d - disk ?d_new - disk ?p_old - peg)
        :precondition (and
            (is-top ?d)
            (on-peg ?d ?p_old)
            (is-top ?d_new)
            (smaller ?d ?d_new) ; Size constraint
        )
        :effect (and
            (not (on-peg ?d ?p_old))
            (on ?d ?d_new)
            (not (is-top ?d_new))
            (empty ?p_old) ; P_old is now empty
        )
    )

    ;; Action 4: Move D from Peg P_old (base disk) to empty Peg P_new
    (:action move_P_P
        :parameters (?d - disk ?p_old - peg ?p_new - peg)
        :precondition (and
            (is-top ?d)
            (on-peg ?d ?p_old)
            (empty ?p_new)
            (not (= ?p_old ?p_new))
        )
        :effect (and
            (not (on-peg ?d ?p_old))
            (on-peg ?d ?p_new)
            (empty ?p_old)
            (not (empty ?p_new))
        )
    )
)