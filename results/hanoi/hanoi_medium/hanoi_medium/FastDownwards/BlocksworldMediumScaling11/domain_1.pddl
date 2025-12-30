(define (domain hanoi-5-disk)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types
        disk peg
    )
    (:predicates
        (on ?d1 - disk ?d2 - disk) ; d1 is immediately on d2
        (at ?d - disk ?p - peg) ; Disk d is the bottom disk resting on peg p
        (smaller ?d1 - disk ?d2 - disk) ; d1 < d2 (static size property)
        (clear ?d - disk) ; d has nothing on top of it
        (empty ?p - peg)  ; p has no disks on it
    )
    
    (:functions
        (total-cost)
    )

    ;; 1. Move D from a Disk (D_below) onto a Disk (D_target)
    (:action move-disk-disk-to-disk-disk
        :parameters (?d - disk ?d_below - disk ?d_target - disk)
        :precondition (and
            (on ?d ?d_below)
            (clear ?d)
            (clear ?d_target)
            (smaller ?d ?d_target)
        )
        :effect (and
            (not (on ?d ?d_below))
            (not (clear ?d_target))
            (on ?d ?d_target)
            (clear ?d_below)
            (increase (total-cost) 1)
        )
    )

    ;; 2. Move D from a Peg (P1) onto a Disk (D_target)
    (:action move-disk-peg-to-disk-disk
        :parameters (?d - disk ?p1 - peg ?d_target - disk)
        :precondition (and
            (at ?d ?p1)
            (clear ?d)
            (clear ?d_target)
            (smaller ?d ?d_target)
        )
        :effect (and
            (not (at ?d ?p1))
            (not (clear ?d_target))
            (on ?d ?d_target)
            (empty ?p1)
            (increase (total-cost) 1)
        )
    )

    ;; 3. Move D from a Disk (D_below) onto a Peg (P2)
    (:action move-disk-disk-to-disk-peg
        :parameters (?d - disk ?d_below - disk ?p2 - peg)
        :precondition (and
            (on ?d ?d_below)
            (clear ?d)
            (empty ?p2)
        )
        :effect (and
            (not (on ?d ?d_below))
            (not (empty ?p2))
            (at ?d ?p2)
            (clear ?d_below)
            (increase (total-cost) 1)
        )
    )

    ;; 4. Move D from a Peg (P1) onto a Peg (P2)
    (:action move-disk-peg-to-disk-peg
        :parameters (?d - disk ?p1 - peg ?p2 - peg)
        :precondition (and
            (at ?d ?p1)
            (clear ?d)
            (empty ?p2)
            (not (= ?p1 ?p2))
        )
        :effect (and
            (not (at ?d ?p1))
            (not (empty ?p2))
            (at ?d ?p2)
            (empty ?p1)
            (increase (total-cost) 1)
        )
    )
)