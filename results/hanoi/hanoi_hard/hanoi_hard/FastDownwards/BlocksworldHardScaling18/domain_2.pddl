(define (domain tower-of-hanoi)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        disk peg
    )
    (:predicates
        (on ?d1 - disk ?d2 - (either disk peg)) ; d1 is on d2 or d1 is on peg p
        (clear ?x - (either disk peg)) ; nothing is on x
        (smaller ?d1 - disk ?d2 - disk) ; static property: d1 is smaller than d2
    )

    ;; 1. Move D from Disk S to Disk Dst
    (:action move-d-d
        :parameters (?d - disk ?s - disk ?dst - disk)
        :precondition (and
            (clear ?d)
            (on ?d ?s)
            (clear ?dst)
            (smaller ?d ?dst) ; Cannot place a larger disk on a smaller disk
        )
        :effect (and
            (not (on ?d ?s))
            (not (clear ?dst))
            (on ?d ?dst)
            (clear ?s)
        )
    )

    ;; 2. Move D from Disk S to Peg Dst (Peg must be clear)
    (:action move-d-p
        :parameters (?d - disk ?s - disk ?p_dst - peg)
        :precondition (and
            (clear ?d)
            (on ?d ?s)
            (clear ?p_dst)
        )
        :effect (and
            (not (on ?d ?s))
            (not (clear ?p_dst))
            (on ?d ?p_dst)
            (clear ?s)
        )
    )

    ;; 3. Move D from Peg S to Disk Dst
    (:action move-p-d
        :parameters (?d - disk ?p_s - peg ?dst - disk)
        :precondition (and
            (clear ?d)
            (on ?d ?p_s)
            (clear ?dst)
            (smaller ?d ?dst) ; Cannot place a larger disk on a smaller disk
        )
        :effect (and
            (not (on ?d ?p_s))
            (not (clear ?dst))
            (on ?d ?dst)
            (clear ?p_s)
        )
    )

    ;; 4. Move D from Peg S to Peg Dst (Peg must be clear)
    (:action move-p-p
        :parameters (?d - disk ?p_s - peg ?p_dst - peg)
        :precondition (and
            (clear ?d)
            (on ?d ?p_s)
            (clear ?p_dst)
        )
        :effect (and
            (not (on ?d ?p_s))
            (not (clear ?p_dst))
            (on ?d ?p_dst)
            (clear ?p_s)
        )
    )
)