(define (domain tower-of-hanoi)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        disk
        peg
    )
    (:predicates
        (on ?d - disk ?p - peg)         ; d is immediately on peg p (d is the base disk of the stack on p)
        (stacked ?d1 - disk ?d2 - disk) ; d1 is immediately on disk d2
        (clear ?d - disk)               ; d has nothing on it (top disk)
        (empty ?p - peg)                ; p has no disks on it
        (smaller ?d1 - disk ?d2 - disk) ; d1 < d2 (Static)
    )

    ; --- 1. Move Disk D from Disk D_base to Peg P_to ---
    (:action move-d-d-to-p
        :parameters (?d - disk ?d_base - disk ?p_to - peg)
        :precondition (and
            (stacked ?d ?d_base)
            (clear ?d)          ; D is top disk (Rule 2)
            (empty ?p_to)       ; P_to is empty
        )
        :effect (and
            (not (stacked ?d ?d_base))
            (clear ?d_base)     ; D_base is now clear
            (on ?d ?p_to)       ; D is now base disk on P_to
            (not (empty ?p_to)) ; P_to is no longer empty
        )
    )
    
    ; --- 2. Move Disk D from Disk D_base to Disk D_to ---
    (:action move-d-d-to-d
        :parameters (?d - disk ?d_base - disk ?d_to - disk)
        :precondition (and
            (stacked ?d ?d_base)
            (clear ?d)          ; D is top disk (Rule 2)
            (clear ?d_to)       ; D_to is clear
            (smaller ?d ?d_to)  ; Size constraint (Rule 3)
        )
        :effect (and
            (not (stacked ?d ?d_base))
            (clear ?d_base)     ; D_base is now clear
            (stacked ?d ?d_to)  ; D is now on D_to
            (not (clear ?d_to)) ; D_to is no longer clear
        )
    )

    ; --- 3. Move Disk D from Peg P_from to Peg P_to (D must be the only disk on P_from) ---
    (:action move-d-p-to-p
        :parameters (?d - disk ?p_from - peg ?p_to - peg)
        :precondition (and
            (on ?d ?p_from)     ; D is the base disk on P_from
            (clear ?d)          ; D is the top disk (meaning P_from holds only D)
            (empty ?p_to)       ; P_to is empty
        )
        :effect (and
            (not (on ?d ?p_from))
            (empty ?p_from)     ; P_from is now empty
            (on ?d ?p_to)       ; D is now base disk on P_to
            (not (empty ?p_to)) ; P_to is no longer empty
        )
    )
    
    ; --- 4. Move Disk D from Peg P_from to Disk D_to (D must be the only disk on P_from) ---
    (:action move-d-p-to-d
        :parameters (?d - disk ?p_from - peg ?d_to - disk)
        :precondition (and
            (on ?d ?p_from)     ; D is the base disk on P_from
            (clear ?d)          ; D is the top disk (meaning P_from holds only D)
            (clear ?d_to)       ; D_to is clear
            (smaller ?d ?d_to)  ; Size constraint (Rule 3)
        )
        :effect (and
            (not (on ?d ?p_from))
            (empty ?p_from)     ; P_from is now empty
            (stacked ?d ?d_to)  ; D is now on D_to
            (not (clear ?d_to)) ; D_to is no longer clear
        )
    )
)