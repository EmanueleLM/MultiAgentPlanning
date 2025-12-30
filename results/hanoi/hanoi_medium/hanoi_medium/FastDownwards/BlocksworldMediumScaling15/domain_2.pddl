(define (domain hanoi-5-disks)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        disk
        peg
    )
    (:predicates
        (smaller ?d1 - disk ?d2 - disk) ; d1 is smaller than d2 (Static relation)
        
        ; Stacking relations
        (on ?d1 - disk ?d2 - disk)      ; d1 is immediately on d2
        (is-bottom ?d - disk ?p - peg)  ; d is on the base of peg p
        
        ; Clearance states
        (clear ?d - disk)               ; d has nothing on top of it
        (empty ?p - peg)                ; p has no disks on it
    )

    ; 1. Move disk D, sitting on D_under, onto D_top
    (:action move-disk-to-disk
        :parameters (?d - disk ?p_from - peg ?p_to - peg ?d_under - disk ?d_top - disk)
        :precondition (and
            (clear ?d)
            (on ?d ?d_under) ; D is lifted from D_under
            (clear ?d_top)   ; D_top is receiving D
            (smaller ?d ?d_top) ; Size constraint: D must be smaller than D_top
            (not (= ?p_from ?p_to))
        )
        :effect (and
            ; Lift D
            (not (on ?d ?d_under))
            (clear ?d_under)
            
            ; Place D
            (on ?d ?d_top)
            (not (clear ?d_top))
        )
    )

    ; 2. Move disk D, sitting on peg base P_from, onto D_top
    (:action move-bottom-disk-to-disk
        :parameters (?d - disk ?p_from - peg ?p_to - peg ?d_top - disk)
        :precondition (and
            (clear ?d)
            (is-bottom ?d ?p_from) ; D is lifted from P_from base
            (clear ?d_top)
            (smaller ?d ?d_top)
            (not (= ?p_from ?p_to))
        )
        :effect (and
            ; Lift D
            (not (is-bottom ?d ?p_from))
            (empty ?p_from) ; P_from becomes empty
            
            ; Place D
            (on ?d ?d_top)
            (not (clear ?d_top))
        )
    )

    ; 3. Move disk D, sitting on D_under, onto empty peg P_to
    (:action move-disk-to-peg
        :parameters (?d - disk ?p_from - peg ?p_to - peg ?d_under - disk)
        :precondition (and
            (clear ?d)
            (on ?d ?d_under)
            (empty ?p_to) ; P_to is empty
            (not (= ?p_from ?p_to))
        )
        :effect (and
            ; Lift D
            (not (on ?d ?d_under))
            (clear ?d_under)
            
            ; Place D
            (is-bottom ?d ?p_to)
            (not (empty ?p_to))
        )
    )

    ; 4. Move disk D, sitting on peg base P_from, onto empty peg P_to
    (:action move-bottom-disk-to-peg
        :parameters (?d - disk ?p_from - peg ?p_to - peg)
        :precondition (and
            (clear ?d)
            (is-bottom ?d ?p_from)
            (empty ?p_to)
            (not (= ?p_from ?p_to))
        )
        :effect (and
            ; Lift D
            (not (is-bottom ?d ?p_from))
            (empty ?p_from)
            
            ; Place D
            (is-bottom ?d ?p_to)
            (not (empty ?p_to))
        )
    )
)