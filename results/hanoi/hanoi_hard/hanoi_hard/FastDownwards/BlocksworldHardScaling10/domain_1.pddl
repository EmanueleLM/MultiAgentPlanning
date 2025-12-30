(define (domain hanoi-6-disks)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types
        disk - object
        peg - object
    )

    (:predicates
        (on ?d1 - disk ?d2 - disk)  ; d1 is directly on d2
        (on-peg ?d - disk ?p - peg) ; d is directly on peg p (bottom of stack)
        (clear ?x)                  ; x (disk or peg) has nothing on it
        (smaller ?d1 - disk ?d2 - disk) ; d1 is smaller than d2 (static constraint)
        (loc ?d - disk ?p - peg)    ; Disk d is currently located on peg p's stack
    )
    
    (:functions
        (total-cost)
    )

    ; Action 1: Move D from B (disk) onto T (disk). D must be smaller than T.
    (:action move-d-from-d-to-d
        :parameters (?d - disk ?b - disk ?t - disk ?from - peg ?to - peg)
        :precondition (and
            (on ?d ?b)
            (clear ?d)
            (clear ?t)
            (smaller ?d ?t)
            (loc ?d ?from)
            (loc ?t ?to)
            (not (= ?from ?to))
        )
        :effect (and
            (not (on ?d ?b))
            (on ?d ?t)
            (clear ?b)
            (not (clear ?t))
            (not (loc ?d ?from))
            (loc ?d ?to)
            (increase (total-cost) 1)
        )
    )

    ; Action 2: Move D from B (disk) onto P (peg).
    (:action move-d-from-d-to-p
        :parameters (?d - disk ?b - disk ?p - peg ?from - peg)
        :precondition (and
            (on ?d ?b)
            (clear ?d)
            (clear ?p)
            (loc ?d ?from)
            (not (= ?from ?p))
        )
        :effect (and
            (not (on ?d ?b))
            (on-peg ?d ?p)
            (clear ?b)
            (not (clear ?p)) 
            (not (loc ?d ?from))
            (loc ?d ?p)
            (increase (total-cost) 1)
        )
    )
    
    ; Action 3: Move D from peg F onto disk T. D must be smaller than T.
    (:action move-d-from-p-to-d
        :parameters (?d - disk ?f - peg ?t - disk ?to - peg)
        :precondition (and
            (on-peg ?d ?f)
            (clear ?d)
            (clear ?t)
            (smaller ?d ?t)
            (loc ?d ?f)
            (loc ?t ?to)
            (not (= ?f ?to))
        )
        :effect (and
            (not (on-peg ?d ?f))
            (clear ?f) ; F becomes clear (empty)
            (on ?d ?t)
            (not (clear ?t))
            (not (loc ?d ?f))
            (loc ?d ?to)
            (increase (total-cost) 1)
        )
    )

    ; Action 4: Move D from peg F onto peg P.
    (:action move-d-from-p-to-p
        :parameters (?d - disk ?f - peg ?p - peg)
        :precondition (and
            (on-peg ?d ?f)
            (clear ?d)
            (clear ?p)
            (loc ?d ?f)
            (not (= ?f ?p))
        )
        :effect (and
            (not (on-peg ?d ?f))
            (on-peg ?d ?p)
            (clear ?f)      ; F becomes clear
            (not (clear ?p)) ; P becomes occupied
            (not (loc ?d ?f))
            (loc ?d ?p)
            (increase (total-cost) 1)
        )
    )
)