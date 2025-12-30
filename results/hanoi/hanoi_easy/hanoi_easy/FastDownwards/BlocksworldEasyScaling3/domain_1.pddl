(define (domain tower-of-hanoi-4d)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        disk peg
    )
    (:predicates
        (on ?d1 - disk ?d2 - disk) ; d1 is immediately on d2
        (on-peg ?d - disk ?p - peg) ; d is the bottom disk on peg p
        (clear ?d - disk) ; d has nothing on top
        (peg-clear ?p - peg) ; peg p is empty
        (smaller ?d1 - disk ?d2 - disk) ; d1 size < d2 size (static constraint)
    )

    ; Action 1: Move Disk D from D_below onto Disk T
    ; Used when moving from a non-empty stack to a non-empty stack.
    (define (action move-d-d-d)
        :parameters (?d - disk ?d_below - disk ?t - disk)
        :precondition (and
            (clear ?d)
            (on ?d ?d_below)
            (clear ?t)
            (smaller ?d ?t) ; Cannot place ?d on a smaller disk ?t (T must be larger than D)
        )
        :effect (and
            (not (on ?d ?d_below))
            (on ?d ?t)
            (not (clear ?t))
            (clear ?d_below)
        )
    )

    ; Action 2: Move Disk D from D_below onto Peg Q (empty peg)
    ; Used when moving from a non-empty stack to an empty peg.
    (define (action move-d-d-p)
        :parameters (?d - disk ?d_below - disk ?q - peg)
        :precondition (and
            (clear ?d)
            (on ?d ?d_below)
            (peg-clear ?q)
        )
        :effect (and
            (not (on ?d ?d_below))
            (clear ?d_below)
            (on-peg ?d ?q)
            (not (peg-clear ?q))
        )
    )

    ; Action 3: Move Disk D from Peg P onto Disk T
    ; Used when moving the bottom disk of a stack (P becomes empty) onto another stack.
    (define (action move-d-p-d)
        :parameters (?d - disk ?t - disk ?p - peg)
        :precondition (and
            (clear ?d)
            (on-peg ?d ?p)
            (clear ?t)
            (smaller ?d ?t) ; Cannot place ?d on a smaller disk ?t
        )
        :effect (and
            (not (on-peg ?d ?p))
            (peg-clear ?p) ; Source peg P becomes empty
            (on ?d ?t)
            (not (clear ?t))
        )
    )

    ; Action 4: Move Disk D from Peg P onto Peg Q (empty peg)
    ; Used when moving the sole disk on P to an empty Q.
    (define (action move-d-p-p)
        :parameters (?d - disk ?p - peg ?q - peg)
        :precondition (and
            (clear ?d)
            (on-peg ?d ?p)
            (peg-clear ?q)
            (not (= ?p ?q))
        )
        :effect (and
            (not (on-peg ?d ?p))
            (peg-clear ?p) ; Source peg P becomes empty
            (on-peg ?d ?q)
            (not (peg-clear ?q)) ; Target peg Q becomes occupied
        )
    )
)