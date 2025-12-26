(define (domain tower-of-hanoi-6d)
    (:requirements :strips :typing :negative-preconditions)
    (:types disk peg)
    (:predicates
        (on ?d1 - disk ?d2 - disk)      ; d1 is directly on d2
        (on-base ?d - disk ?p - peg)    ; d is the bottom disk on peg p
        (clear ?d - disk)               ; d is the top disk (nothing on it)
        (empty ?p - peg)                ; p has no disks on it (base is available)
        (smaller ?d1 - disk ?d2 - disk) ; d1 is smaller than d2 (Size constraint)
    )

; 1. Move D from Base P_from to Empty Peg P_to
(:action move-from-base-to-empty-peg
    :parameters (?d - disk ?p_from - peg ?p_to - peg)
    :precondition (and
        (clear ?d)
        (on-base ?d ?p_from)
        (empty ?p_to)
    )
    :effect (and
        (not (on-base ?d ?p_from))
        (on-base ?d ?p_to)
        (empty ?p_from)
        (not (empty ?p_to))
    )
)

; 2. Move D from Base P_from to Disk Y (on any peg)
(:action move-from-base-to-disk
    :parameters (?d - disk ?p_from - peg ?y - disk)
    :precondition (and
        (clear ?d)
        (on-base ?d ?p_from)
        (clear ?y)
        (smaller ?d ?y)
    )
    :effect (and
        (not (on-base ?d ?p_from))
        (empty ?p_from)
        (on ?d ?y)
        (not (clear ?y))
    )
)

; 3. Move D from Disk X to Empty Peg P_to
(:action move-from-disk-to-empty-peg
    :parameters (?d - disk ?x - disk ?p_to - peg)
    :precondition (and
        (clear ?d)
        (on ?d ?x)
        (empty ?p_to)
    )
    :effect (and
        (not (on ?d ?x))
        (clear ?x)
        (on-base ?d ?p_to)
        (not (empty ?p_to))
    )
)

; 4. Move D from Disk X to Disk Y
(:action move-from-disk-to-disk
    :parameters (?d - disk ?x - disk ?y - disk)
    :precondition (and
        (clear ?d)
        (on ?d ?x)
        (clear ?y)
        (smaller ?d ?y)
    )
    :effect (and
        (not (on ?d ?x))
        (clear ?x)
        (on ?d ?y)
        (not (clear ?y))
    )
)
)