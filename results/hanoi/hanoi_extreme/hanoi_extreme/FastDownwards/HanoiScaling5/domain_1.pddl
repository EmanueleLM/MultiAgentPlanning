(define (domain tower-of-hanoi-5)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        disk peg
    )
    (:constants
        A B C D E - disk ; A smallest, E largest
        L M R - peg      ; Left, Middle, Right
    )
    (:predicates
        (on ?d1 - disk ?d2 - disk)   ; d1 is directly on d2
        (on-peg ?d - disk ?p - peg)  ; d is directly on peg base p
        (clear ?x) ; Nothing is on x (x can be a disk or a peg base)
        (smaller ?d1 - disk ?d2 - disk) ; d1 is smaller than d2 (static)
    )

    ;; Action A: Move D from X_from (Disk) onto X_to (Disk)
    (:action move-disk-to-disk
        :parameters (?d ?x_from ?x_to - disk)
        :precondition (and
            (on ?d ?x_from) ; D is resting on X_from
            (clear ?d)      ; D is on top of its stack
            (clear ?x_to)   ; X_to is available
            (smaller ?d ?x_to) ; Size constraint
        )
        :effect (and
            (not (on ?d ?x_from))
            (on ?d ?x_to)
            (clear ?x_from) ; X_from is now exposed
            (not (clear ?x_to)) ; X_to is now covered
        )
    )
    
    ;; Action B: Move D from X_from (Disk) onto P_to (Peg base)
    (:action move-disk-to-peg-from-disk
        :parameters (?d ?x_from - disk ?p_to - peg)
        :precondition (and
            (on ?d ?x_from)
            (clear ?d)
            (clear ?p_to) ; P_to is empty
        )
        :effect (and
            (not (on ?d ?x_from))
            (on-peg ?d ?p_to)
            (clear ?x_from) ; X_from is now exposed
            (not (clear ?p_to)) ; P_to is now covered
        )
    )

    ;; Action C: Move D from P_from (Peg base) onto X_to (Disk)
    (:action move-disk-to-disk-from-peg
        :parameters (?d ?x_to - disk ?p_from - peg)
        :precondition (and
            (on-peg ?d ?p_from) ; D is resting on P_from base
            (clear ?d)
            (clear ?x_to)
            (smaller ?d ?x_to) ; Size constraint
        )
        :effect (and
            (not (on-peg ?d ?p_from))
            (on ?d ?x_to)
            (clear ?p_from) ; P_from base is now exposed
            (not (clear ?x_to)) ; X_to is now covered
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
            (clear ?p_from) ; P_from base is now exposed
            (not (clear ?p_to)) ; P_to is now covered
        )
    )
)