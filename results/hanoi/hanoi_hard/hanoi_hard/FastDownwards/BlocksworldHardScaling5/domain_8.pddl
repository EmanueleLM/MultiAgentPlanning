(define (domain Hanoi)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types
        disk peg
    )
    (:predicates
        (on ?d1 - disk ?d2 - disk)   ; d1 is immediately on d2
        (on-peg ?d - disk ?p - peg)  ; d is the base disk resting on peg p
        (clear ?d - disk)            ; d is the top disk of a stack
        (empty ?p - peg)             ; p holds no disks
        (holding ?d - disk)          ; hand is holding d
        (handempty)
        (smaller ?d1 - disk ?d2 - disk) ; d1 size < d2 size
    )
    (:functions
        (total-cost) - number
    )

    ;; A1: Lift disk d1 from disk d2 (Unstack)
    (action lift-from-disk
        :parameters (?d1 - disk ?d2 - disk)
        :precondition (and
            (handempty)
            (on ?d1 ?d2)
            (clear ?d1)
        )
        :effect (and
            (holding ?d1)
            (clear ?d2)
            (not (on ?d1 ?d2))
            (not (clear ?d1))
            (not (handempty))
            (increase (total-cost) 1)
        )
    )
    
    ;; A2: Lift base disk d from peg p (Pick up)
    (action lift-from-peg
        :parameters (?d - disk ?p - peg)
        :precondition (and
            (handempty)
            (on-peg ?d ?p)
            (clear ?d)
        )
        :effect (and
            (holding ?d)
            (empty ?p)
            (not (on-peg ?d ?p))
            (not (clear ?d))
            (not (handempty))
            (increase (total-cost) 1)
        )
    )

    ;; B1: Place disk d1 onto disk d2 (Stack)
    ;; Rule: d1 must be smaller than d2.
    (action place-on-disk
        :parameters (?d1 - disk ?d2 - disk)
        :precondition (and
            (holding ?d1)
            (clear ?d2)
            (smaller ?d1 ?d2) ; Hanoi Rule: Cannot place larger on smaller
        )
        :effect (and
            (on ?d1 ?d2)
            (clear ?d1)
            (handempty)
            (not (holding ?d1))
            (not (clear ?d2))
            (increase (total-cost) 1)
        )
    )

    ;; B2: Place disk d onto empty peg p (Put down)
    (action place-on-peg
        :parameters (?d - disk ?p - peg)
        :precondition (and
            (holding ?d)
            (empty ?p)
        )
        :effect (and
            (on-peg ?d ?p)
            (clear ?d)
            (handempty)
            (not (holding ?d))
            (not (empty ?p))
            (increase (total-cost) 1)
        )
    )
)