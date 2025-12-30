(define (domain tower-of-hanoi)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        disk peg
    )
    (:predicates
        (on ?d1 - disk ?l2 - (either disk peg)) ; d1 is on l2 (disk or peg)
        (clear ?x - (either disk peg)) ; Nothing is on x
        (smaller ?d1 - disk ?d2 - disk) ; d1 is smaller than d2
    )

    ; 1. Move disk D from disk D_BELOW to disk D_TARGET
    ; Preconditions ensure D is clear, on D_below, D_target is clear, and D < D_target.
    (:action move-disk-disk-to-disk
        :parameters (?d - disk ?d_below - disk ?d_target - disk)
        :precondition (and
            (clear ?d)
            (on ?d ?d_below)
            (clear ?d_target)
            (smaller ?d ?d_target)
        )
        :effect (and
            (not (on ?d ?d_below))
            (not (clear ?d_target))
            (clear ?d_below)
            (on ?d ?d_target)
        )
    )
    
    ; 2. Move disk D from disk D_BELOW to peg P_TARGET
    ; Peg P_target is always considered infinitely large, so no size constraint needed.
    (:action move-disk-disk-to-peg
        :parameters (?d - disk ?d_below - disk ?p_target - peg)
        :precondition (and
            (clear ?d)
            (on ?d ?d_below)
            (clear ?p_target) ; P_TARGET must be empty/clear base
        )
        :effect (and
            (not (on ?d ?d_below))
            (clear ?d_below)
            (not (clear ?p_target))
            (on ?d ?p_target)
        )
    )

    ; 3. Move disk D from peg P_BELOW to disk D_TARGET
    ; Preconditions ensure D is clear, on P_below, D_target is clear, and D < D_target.
    (:action move-disk-peg-to-disk
        :parameters (?d - disk ?p_below - peg ?d_target - disk)
        :precondition (and
            (clear ?d)
            (on ?d ?p_below)
            (clear ?d_target)
            (smaller ?d ?d_target)
        )
        :effect (and
            (not (on ?d ?p_below))
            (clear ?p_below) 
            (not (clear ?d_target))
            (on ?d ?d_target)
        )
    )

    ; 4. Move disk D from peg P_BELOW to peg P_TARGET
    ; Moving the bottom disk from one stack/peg base to another empty peg base.
    (:action move-disk-peg-to-peg
        :parameters (?d - disk ?p_below - peg ?p_target - peg)
        :precondition (and
            (clear ?d)
            (on ?d ?p_below)
            (clear ?p_target) ; P_TARGET must be empty/clear base
        )
        :effect (and
            (not (on ?d ?p_below))
            (clear ?p_below) 
            (not (clear ?p_target))
            (on ?d ?p_target)
        )
    )
)