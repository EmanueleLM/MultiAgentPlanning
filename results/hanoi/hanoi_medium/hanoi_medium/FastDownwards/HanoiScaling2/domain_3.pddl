(define (domain HANOI-5)
    (:requirements :strips :typing :negative-preconditions)

    (:types
        disk peg
    )

    (:predicates
        (on-disk ?d1 - disk ?d2 - disk) ; d1 is immediately on d2
        (on-peg ?d - disk ?p - peg)     ; d is the lowest disk on peg p (resting on the floor)
        (at ?d - disk ?p - peg)         ; d is located at peg p (part of the stack)
        (clear ?d - disk)               ; nothing is on d (top disk)
        (peg-clear ?p - peg)            ; peg p has no disks on it (empty floor)
        (smaller ?d1 - disk ?d2 - disk) ; d1 is physically smaller than d2
    )
    
    ; 1. Move D from a base disk B_F to a target disk B_T
    (:action move-dd
        :parameters (?d - disk ?b_f - disk ?b_t - disk ?f - peg ?t - peg)
        :precondition (and
            (on-disk ?d ?b_f)
            (clear ?d)
            (clear ?b_t)                    ; Target base disk must be the top disk on its stack
            (smaller ?d ?b_t)               ; Rule: Cannot place larger disk on smaller disk
            (at ?d ?f)
            (at ?b_t ?t)
            (not (= ?f ?t))                 ; Must move between pegs
        )
        :effect (and
            (not (on-disk ?d ?b_f))
            (on-disk ?d ?b_t)
            (clear ?b_f)                    ; Previous base is now clear
            (not (clear ?b_t))              ; New base is no longer clear
            (not (at ?d ?f))                ; Change location tracking
            (at ?d ?t)
        )
    )

    ; 2. Move D from a base disk B_F to the target peg floor P_T
    (:action move-dp
        :parameters (?d - disk ?b_f - disk ?f - peg ?t - peg)
        :precondition (and
            (on-disk ?d ?b_f)
            (clear ?d)
            (peg-clear ?t)                  ; Target peg floor must be empty
            (at ?d ?f)
            (not (= ?f ?t))
        )
        :effect (and
            (not (on-disk ?d ?b_f))
            (on-peg ?d ?t)
            (clear ?b_f)
            (not (peg-clear ?t))
            (not (at ?d ?f))
            (at ?d ?t)
        )
    )

    ; 3. Move D from the floor of P_F to a target disk B_T
    (:action move-pd
        :parameters (?d - disk ?b_t - disk ?f - peg ?t - peg)
        :precondition (and
            (on-peg ?d ?f)
            (clear ?d)
            (clear ?b_t)
            (smaller ?d ?b_t)               ; Rule: Cannot place larger disk on smaller disk
            (at ?d ?f)
            (at ?b_t ?t)
            (not (= ?f ?t))
        )
        :effect (and
            (not (on-peg ?d ?f))
            (on-disk ?d ?b_t)
            (peg-clear ?f)                  ; Previous peg floor is now clear
            (not (clear ?b_t))
            (not (at ?d ?f))
            (at ?d ?t)
        )
    )

    ; 4. Move D from the floor of P_F to the target peg floor P_T
    (:action move-pp
        :parameters (?d - disk ?f - peg ?t - peg)
        :precondition (and
            (on-peg ?d ?f)
            (clear ?d)
            (peg-clear ?t)
            (at ?d ?f)
            (not (= ?f ?t))
        )
        :effect (and
            (not (on-peg ?d ?f))
            (on-peg ?d ?t)
            (peg-clear ?f)
            (not (peg-clear ?t))
            (not (at ?d ?f))
            (at ?d ?t)
        )
    )
)