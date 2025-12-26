(define (domain hanoi-4disks)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types
        disk peg
    )
    
    (:predicates
        ; Connectivity / Stacking
        (on ?d1 - disk ?d2 - disk)   ; d1 is immediately on d2
        (is_bottom ?d - disk ?p - peg) ; d is the lowest disk, resting on peg p

        ; Location tracking
        (at ?d - disk ?p - peg)      ; d is located on peg p

        ; Availability/Top Status
        (clear ?d - disk)            ; d has nothing on it
        (empty ?p - peg)             ; p has no disks on it

        ; Size hierarchy (Static)
        (smaller ?d1 - disk ?d2 - disk)
    )

    (:functions
        (total-cost)
    )

    ; 1. Move disk D from disk D_src to disk D_dst
    (:action move-dd
        :parameters (?d - disk ?d_src - disk ?d_dst - disk ?p_from - peg ?p_to - peg)
        :precondition (and
            ; D must be at top of stack on P_from, resting on D_src
            (at ?d ?p_from)
            (on ?d ?d_src)
            (clear ?d)
            (not (= ?p_from ?p_to))
            
            ; Destination D_dst must be clear, on P_to, and larger than D
            (at ?d_dst ?p_to)
            (clear ?d_dst)
            (smaller ?d ?d_dst)
        )
        :effect (and
            (not (on ?d ?d_src))
            (on ?d ?d_dst)
            (clear ?d_src)
            (not (clear ?d_dst))
            (not (at ?d ?p_from))
            (at ?d ?p_to)
            (increase (total-cost) 1)
        )
    )

    ; 2. Move disk D from disk D_src to empty peg P_to
    (:action move-dp
        :parameters (?d - disk ?d_src - disk ?p_from - peg ?p_to - peg)
        :precondition (and
            ; D must be at top of stack on P_from, resting on D_src
            (at ?d ?p_from)
            (on ?d ?d_src)
            (clear ?d)
            (not (= ?p_from ?p_to))
            
            ; Destination P_to must be empty
            (empty ?p_to)
        )
        :effect (and
            (not (on ?d ?d_src))
            (is_bottom ?d ?p_to)
            (clear ?d_src)
            (not (empty ?p_to))
            (not (at ?d ?p_from))
            (at ?d ?p_to)
            (increase (total-cost) 1)
        )
    )

    ; 3. Move disk D (bottom disk on P_from) to disk D_dst
    (:action move-pd
        :parameters (?d - disk ?d_dst - disk ?p_from - peg ?p_to - peg)
        :precondition (and
            ; D must be the single top/bottom disk on P_from
            (at ?d ?p_from)
            (is_bottom ?d ?p_from)
            (clear ?d)
            (not (= ?p_from ?p_to))

            ; Destination D_dst must be clear, on P_to, and larger than D
            (at ?d_dst ?p_to)
            (clear ?d_dst)
            (smaller ?d ?d_dst)
        )
        :effect (and
            (not (is_bottom ?d ?p_from))
            (on ?d ?d_dst)
            (empty ?p_from) ; P_from becomes empty
            (not (clear ?d_dst))
            (not (at ?d ?p_from))
            (at ?d ?p_to)
            (increase (total-cost) 1)
        )
    )
    
    ; 4. Move disk D (single disk on P_from) to empty peg P_to
    (:action move-pp
        :parameters (?d - disk ?p_from - peg ?p_to - peg)
        :precondition (and
            ; D must be the single top/bottom disk on P_from
            (at ?d ?p_from)
            (is_bottom ?d ?p_from)
            (clear ?d)
            (not (= ?p_from ?p_to))

            ; Destination P_to must be empty
            (empty ?p_to)
        )
        :effect (and
            (not (is_bottom ?d ?p_from))
            (is_bottom ?d ?p_to)
            (empty ?p_from)
            (not (empty ?p_to))
            (not (at ?d ?p_from))
            (at ?d ?p_to)
            (increase (total-cost) 1)
        )
    )
)