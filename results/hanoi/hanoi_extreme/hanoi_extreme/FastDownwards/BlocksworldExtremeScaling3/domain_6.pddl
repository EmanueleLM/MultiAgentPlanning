(define (domain hanoi-7-disks)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types
        disk
        peg
    )
    (:predicates
        (on-disk ?d1 - disk ?d2 - disk)   ; d1 is immediately on d2
        (on-peg ?d - disk ?p - peg)       ; d is the bottom disk resting on peg p
        (clear ?d - disk)                 ; d is the top disk of a stack
        (available ?p - peg)              ; p is empty (no disks on it)
        (smaller ?d1 - disk ?d2 - disk)   ; d1 is smaller than d2
    )
    (:functions
        (total-cost)
    )

    ;; 1. Move D from disk D_below to Peg T (Empty target)
    (:action move-disk-to-empty-peg-from-disk
        :parameters (?d - disk ?d_below - disk ?t - peg)
        :precondition (and
            (clear ?d)
            (on-disk ?d ?d_below)
            (available ?t)
        )
        :effect (and
            (not (on-disk ?d ?d_below))
            (on-peg ?d ?t)
            (clear ?d_below)
            (not (available ?t))
            (increase (total-cost) 1)
        )
    )

    ;; 2. Move D from disk D_below to Disk D_above (Occupied target)
    (:action move-disk-to-disk-from-disk
        :parameters (?d - disk ?d_below - disk ?d_above - disk)
        :precondition (and
            (clear ?d)
            (on-disk ?d ?d_below)
            (clear ?d_above)
            (smaller ?d ?d_above)
        )
        :effect (and
            (not (on-disk ?d ?d_below))
            (on-disk ?d ?d_above)
            (clear ?d_below)
            (not (clear ?d_above))
            (increase (total-cost) 1)
        )
    )

    ;; 3. Move D from Peg F (Base disk) to Peg T (Empty target)
    (:action move-base-disk-to-empty-peg
        :parameters (?d - disk ?f - peg ?t - peg)
        :precondition (and
            (clear ?d)
            (on-peg ?d ?f)
            (available ?t)
        )
        :effect (and
            (not (on-peg ?d ?f))
            (on-peg ?d ?t)
            (available ?f)
            (not (available ?t))
            (increase (total-cost) 1)
        )
    )

    ;; 4. Move D from Peg F (Base disk) to Disk D_above (Occupied target)
    (:action move-base-disk-to-disk
        :parameters (?d - disk ?f - peg ?d_above - disk)
        :precondition (and
            (clear ?d)
            (on-peg ?d ?f)
            (clear ?d_above)
            (smaller ?d ?d_above)
        )
        :effect (and
            (not (on-peg ?d ?f))
            (on-disk ?d ?d_above)
            (available ?f)
            (not (clear ?d_above))
            (increase (total-cost) 1)
        )
    )
)