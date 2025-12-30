(define (domain hanoi-7-disk)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        disk peg - object
    )
    (:predicates
        (on ?d1 - disk ?d2 - disk)         ; d1 is immediately on d2
        (on-peg ?d - disk ?p - peg)        ; d is immediately on peg p (base)
        (clear ?x - disk)                  ; disk x has nothing on top of it
        (peg-clear ?p - peg)               ; peg p has nothing on top of it
        (smaller ?d1 - disk ?d2 - disk)    ; d1 is smaller than d2 (static)
    )

    ;; 1. Move Disk D from Disk S_From to Disk S_To (D->D)
    (:action move-d-d
        :parameters (?d ?s_from ?s_to - disk ?p_from ?p_to - peg)
        :precondition (and
            (not (= ?p_from ?p_to))
            
            (clear ?d)
            (on ?d ?s_from)
            (clear ?s_to)
            
            ; Size constraint: D must be smaller than S_to
            (smaller ?d ?s_to)
        )
        :effect (and
            (not (on ?d ?s_from))
            (not (clear ?s_to))
            (on ?d ?s_to)
            (clear ?s_from)
        )
    )

    ;; 2. Move Disk D from Disk S_From to Peg P_To (D->P)
    (:action move-d-p
        :parameters (?d ?s_from - disk ?p_from ?p_to - peg)
        :precondition (and
            (not (= ?p_from ?p_to))
            
            (clear ?d)
            (on ?d ?s_from)
            (peg-clear ?p_to)
        )
        :effect (and
            (not (on ?d ?s_from))
            (not (peg-clear ?p_to))
            (on-peg ?d ?p_to)
            (clear ?s_from)
        )
    )

    ;; 3. Move Disk D from Peg P_From to Disk S_To (P->D)
    (:action move-p-d
        :parameters (?d ?s_to - disk ?p_from ?p_to - peg)
        :precondition (and
            (not (= ?p_from ?p_to))
            
            (clear ?d)
            (on-peg ?d ?p_from)
            (clear ?s_to)
            
            ; Size constraint: D must be smaller than S_to
            (smaller ?d ?s_to)
        )
        :effect (and
            (not (on-peg ?d ?p_from))
            (not (clear ?s_to))
            (on ?d ?s_to)
            (peg-clear ?p_from) ; P_from becomes empty
        )
    )

    ;; 4. Move Disk D from Peg P_From to Peg P_To (P->P)
    (:action move-p-p
        :parameters (?d - disk ?p_from ?p_to - peg)
        :precondition (and
            (not (= ?p_from ?p_to))
            
            (clear ?d)
            (on-peg ?d ?p_from)
            (peg-clear ?p_to)
        )
        :effect (and
            (not (on-peg ?d ?p_from))
            (not (peg-clear ?p_to))
            (on-peg ?d ?p_to)
            (peg-clear ?p_from) ; P_from becomes empty
        )
    )
)