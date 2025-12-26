(define (domain tower-of-hanoi-5)
    (:requirements :strips :typing :negative-preconditions :action-costs :equality)
    (:types
        disk peg
    )
    (:constants
        A B C D E - disk ; A smallest, E largest
        L M R - peg      ; Left, Middle, Right
    )
    (:predicates
        (on ?d1 - disk ?d2 - disk) ; d1 is immediately on d2
        (on-peg ?d - disk ?p - peg) ; d is immediately on peg p base
        (clear ?x) ; x (disk or peg) has nothing on it
        (smaller ?d1 - disk ?d2 - disk) ; Static fact: d1 is smaller than d2
    )
    (:functions
        (total-cost)
    )

    ;; Action 1: Move D from X_from (Disk) onto X_to (Disk)
    (:action move-disk-to-disk
        :parameters (?d ?x_from ?x_to - disk)
        :precondition (and
            (on ?d ?x_from) ; D is on X_from
            (clear ?d)      ; D is on top
            (clear ?x_to)   ; X_to is clear to receive D
            (smaller ?d ?x_to) ; D must be smaller than X_to
        )
        :effect (and
            (not (on ?d ?x_from))
            (on ?d ?x_to)
            (clear ?x_from) ; X_from is now clear
            (not (clear ?x_to)) ; X_to is now covered by D
            (increase (total-cost) 1)
        )
    )
    
    ;; Action 2: Move D from X_from (Disk) onto P_to (Peg base)
    (:action move-disk-to-peg-from-disk
        :parameters (?d ?x_from - disk ?p_to - peg)
        :precondition (and
            (on ?d ?x_from) ; D is on X_from
            (clear ?d)      ; D is on top
            (clear ?p_to)   ; P_to peg is empty
        )
        :effect (and
            (not (on ?d ?x_from))
            (on-peg ?d ?p_to)
            (clear ?x_from) ; X_from is now clear
            (not (clear ?p_to)) ; P_to is now occupied by D
            (increase (total-cost) 1)
        )
    )

    ;; Action 3: Move D from P_from (Peg base) onto X_to (Disk)
    (:action move-disk-to-disk-from-peg
        :parameters (?d ?x_to - disk ?p_from - peg)
        :precondition (and
            (on-peg ?d ?p_from) ; D is on P_from base
            (clear ?d)          ; D is on top
            (clear ?x_to)       ; X_to is clear to receive D
            (smaller ?d ?x_to)  ; D must be smaller than X_to
        )
        :effect (and
            (not (on-peg ?d ?p_from))
            (on ?d ?x_to)
            (clear ?p_from) ; P_from peg is now empty
            (not (clear ?x_to)) ; X_to is now covered by D
            (increase (total-cost) 1)
        )
    )

    ;; Action 4: Move D from P_from (Peg base) onto P_to (Peg base)
    (:action move-disk-to-peg-from-peg
        :parameters (?d - disk ?p_from ?p_to - peg)
        :precondition (and
            (on-peg ?d ?p_from) ; D is on P_from base
            (clear ?d)          ; D is on top
            (clear ?p_to)       ; P_to peg is empty
            (not (= ?p_from ?p_to))
        )
        :effect (and
            (not (on-peg ?d ?p_from))
            (on-peg ?d ?p_to)
            (clear ?p_from) ; P_from peg is now empty
            (not (clear ?p_to)) ; P_to is now occupied by D
            (increase (total-cost) 1)
        )
    )
)