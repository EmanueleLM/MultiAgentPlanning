(define (domain tower-of-hanoi-5)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types
        disk peg
    )
    (:constants
        A B C D E - disk ; A smallest, E largest
        L M R - peg      ; Left, Middle, Right
    )
    (:predicates
        (on ?d1 - disk ?d2 - disk)
        (on-peg ?d - disk ?p - peg)
        (clear ?x)
        (smaller ?d1 - disk ?d2 - disk)
    )
    (:functions
        (total-cost)
    )

    ;; Action A: Move D from X_from (Disk) onto X_to (Disk)
    (:action move-disk-to-disk
        :parameters (?d ?x_from ?x_to - disk)
        :precondition (and
            (on ?d ?x_from)
            (clear ?d)
            (clear ?x_to)
            (smaller ?d ?x_to)
        )
        :effect (and
            (not (on ?d ?x_from))
            (on ?d ?x_to)
            (clear ?x_from)
            (not (clear ?x_to))
            (increase (total-cost) 1)
        )
    )
    
    ;; Action B: Move D from X_from (Disk) onto P_to (Peg base)
    (:action move-disk-to-peg-from-disk
        :parameters (?d ?x_from - disk ?p_to - peg)
        :precondition (and
            (on ?d ?x_from)
            (clear ?d)
            (clear ?p_to)
        )
        :effect (and
            (not (on ?d ?x_from))
            (on-peg ?d ?p_to)
            (clear ?x_from)
            (not (clear ?p_to))
            (increase (total-cost) 1)
        )
    )

    ;; Action C: Move D from P_from (Peg base) onto X_to (Disk)
    (:action move-disk-to-disk-from-peg
        :parameters (?d ?x_to - disk ?p_from - peg)
        :precondition (and
            (on-peg ?d ?p_from)
            (clear ?d)
            (clear ?x_to)
            (smaller ?d ?x_to)
        )
        :effect (and
            (not (on-peg ?d ?p_from))
            (on ?d ?x_to)
            (clear ?p_from)
            (not (clear ?x_to))
            (increase (total-cost) 1)
        )
    )

    ;; Action D: Move D from P_from (Peg base) onto P_to (Peg base)
    (:action move-disk-to-peg-from-peg
        :parameters (?d - disk ?p_from ?p_to - peg)
        :precondition (and
            (on-peg ?d ?p_from)
            (clear ?d)
            (clear ?p_to)
            (not (= ?p_from ?p_to))
        )
        :effect (and
            (not (on-peg ?d ?p_from))
            (on-peg ?d ?p_to)
            (clear ?p_from)
            (not (clear ?p_to))
            (increase (total-cost) 1)
        )
    )