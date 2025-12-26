(define (domain tower-of-hanoi)
    (:requirements :typing :negative-preconditions :action-costs)
    (:types
        disk peg
    )
    (:predicates
        (on ?d1 - disk ?d2 - disk) ; d1 rests on d2
        (base ?d - disk ?p - peg)   ; d is the lowest disk, rests on p
        (smaller ?d1 - disk ?d2 - disk) ; d1 is smaller than d2 (static)
        (clear-disk ?d - disk)      ; d has nothing stacked on it
        (clear-peg ?p - peg)        ; p has no disks
    )
    (:functions
        (total-cost)
    )

    ;; Action 1: Disk D moves from Disk X to Disk Y
    (:action move_d_d_d
        :parameters (?d - disk ?x - disk ?y - disk)
        :precondition (and
            (clear-disk ?d)
            (clear-disk ?y)
            (smaller ?d ?y)
            (on ?d ?x)
        )
        :effect (and
            (not (on ?d ?x))
            (on ?d ?y)
            (clear-disk ?x)
            (not (clear-disk ?y))
            (increase (total-cost) 1)
        )
    )

    ;; Action 2: Disk D moves from Disk X onto Peg P (empty target peg)
    (:action move_d_d_p
        :parameters (?d - disk ?x - disk ?p - peg)
        :precondition (and
            (clear-disk ?d)
            (clear-peg ?p)
            (on ?d ?x)
        )
        :effect (and
            (not (on ?d ?x))
            (base ?d ?p)
            (clear-disk ?x)
            (not (clear-peg ?p))
            (increase (total-cost) 1)
        )
    )

    ;; Action 3: Disk D moves from Peg P onto Disk Y
    (:action move_d_p_d
        :parameters (?d - disk ?p - peg ?y - disk)
        :precondition (and
            (clear-disk ?d)
            (clear-disk ?y)
            (smaller ?d ?y)
            (base ?d ?p)
        )
        :effect (and
            (not (base ?d ?p))
            (on ?d ?y)
            (clear-peg ?p)
            (not (clear-disk ?y))
            (increase (total-cost) 1)
        )
    )

    ;; Action 4: Disk D moves from Peg P1 onto Peg P2 (empty target peg)
    (:action move_d_p_p
        :parameters (?d - disk ?p1 - peg ?p2 - peg)
        :precondition (and
            (clear-disk ?d)
            (clear-peg ?p2)
            (base ?d ?p1)
            (not (= ?p1 ?p2))
        )
        :effect (and
            (not (base ?d ?p1))
            (base ?d ?p2)
            (clear-peg ?p1)
            (not (clear-peg ?p2))
            (increase (total-cost) 1)
        )
    )
)