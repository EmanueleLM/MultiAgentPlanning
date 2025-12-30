(define (domain hanoi-4-disks)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types
        disk peg - object
    )
    (:predicates
        (on ?d - disk ?s - object)
        (clear ?s - object)
        (smaller ?d1 - disk ?d2 - disk)
    )

    (:functions
        (total-cost) - number
    )

    ;; 1. Move Disk D from Disk D_from to Disk D_to
    (:action move-d-d
        :parameters (?d ?d_from ?d_to - disk)
        :precondition (and
            (on ?d ?d_from)
            (clear ?d)
            (clear ?d_to)
            (smaller ?d ?d_to)
        )
        :effect (and
            (not (on ?d ?d_from))
            (on ?d ?d_to)
            (not (clear ?d_to))
            (clear ?d_from)
            (increase (total-cost) 1)
        )
    )

    ;; 2. Move Disk D from Disk D_from to Peg P_to
    (:action move-d-p
        :parameters (?d - disk ?d_from - disk ?p_to - peg)
        :precondition (and
            (on ?d ?d_from)
            (clear ?d)
            (clear ?p_to)
        )
        :effect (and
            (not (on ?d ?d_from))
            (on ?d ?p_to)
            (not (clear ?p_to))
            (clear ?d_from)
            (increase (total-cost) 1)
        )
    )

    ;; 3. Move Disk D from Peg P_from to Disk D_to
    (:action move-p-d
        :parameters (?d - disk ?p_from - peg ?d_to - disk)
        :precondition (and
            (on ?d ?p_from)
            (clear ?d)
            (clear ?d_to)
            (smaller ?d ?d_to)
        )
        :effect (and
            (not (on ?d ?p_from))
            (on ?d ?d_to)
            (not (clear ?d_to))
            (clear ?p_from)
            (increase (total-cost) 1)
        )
    )

    ;; 4. Move Disk D from Peg P_from to Peg P_to
    (:action move-p-p
        :parameters (?d - disk ?p_from ?p_to - peg)
        :precondition (and
            (on ?d ?p_from)
            (clear ?d)
            (clear ?p_to)
        )
        :effect (and
            (not (on ?d ?p_from))
            (on ?d ?p_to)
            (not (clear ?p_to))
            (clear ?p_from)
            (increase (total-cost) 1)
        )
    )
)