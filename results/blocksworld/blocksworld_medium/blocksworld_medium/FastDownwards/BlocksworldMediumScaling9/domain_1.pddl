(define (domain hanoi-5-disk)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types
        disk 
        peg
    )
    (:predicates
        (smaller ?d1 - disk ?d2 - disk) ; d1 is smaller than d2 (Static constraint)
        (on ?d1 - disk ?d2 - disk)      ; d1 is immediately on d2
        (top ?d - disk)                 ; d has nothing on it (is clear)
        (base ?d - disk ?p - peg)       ; d is the lowest disk on peg p
        (available ?p - peg)            ; peg p is empty (base is available)
        (location ?d - disk ?p - peg)   ; d is located on peg p
    )

    (:functions
        (total-cost) - number
    )

    ;; 1. Move D from D_Under to D_Over (Disk to Disk)
    (:action move_D_D_D
        :parameters (?d - disk ?p_f - peg ?p_t - peg ?d_under - disk ?d_over - disk)
        :precondition (and
            (not (= ?p_f ?p_t))
            
            ; ?d is ready to move
            (top ?d)
            (location ?d ?p_f)
            (on ?d ?d_under)
            
            ; ?d_over is ready to receive
            (top ?d_over)
            (location ?d_over ?p_t)
            
            ; Size constraint: cannot place larger disk on smaller one
            (smaller ?d ?d_over)
        )
        :effect (and
            ; D moves off D_under, onto D_over
            (not (on ?d ?d_under))
            (on ?d ?d_over)
            
            ; Clear status changes
            (top ?d_under)
            (not (top ?d_over))
            
            ; Location change
            (not (location ?d ?p_f))
            (location ?d ?p_t)
            
            (increase (total-cost) 1)
        )
    )

    ;; 2. Move D from D_Under to Peg Base (Disk to Base)
    (:action move_D_D_B
        :parameters (?d - disk ?p_f - peg ?p_t - peg ?d_under - disk)
        :precondition (and
            (not (= ?p_f ?p_t))
            
            ; ?d is ready to move
            (top ?d)
            (location ?d ?p_f)
            (on ?d ?d_under)
            
            ; ?p_t is ready to receive
            (available ?p_t)
        )
        :effect (and
            ; D moves off D_under, onto base P_t
            (not (on ?d ?d_under))
            (base ?d ?p_t)
            
            ; Clear status changes
            (top ?d_under)
            (not (available ?p_t))
            
            ; Location change
            (not (location ?d ?p_f))
            (location ?d ?p_t)
            
            (increase (total-cost) 1)
        )
    )

    ;; 3. Move D from Peg Base to D_Over (Base to Disk)
    (:action move_D_B_D
        :parameters (?d - disk ?p_f - peg ?p_t - peg ?d_over - disk)
        :precondition (and
            (not (= ?p_f ?p_t))
            
            ; D is ready to move (must be the only disk exposed on P_f)
            (top ?d)
            (location ?d ?p_f)
            (base ?d ?p_f)
            
            ; D_over is ready to receive
            (top ?d_over)
            (location ?d_over ?p_t)
            
            ; Size constraint
            (smaller ?d ?d_over)
        )
        :effect (and
            ; D moves off base P_f, onto D_over
            (not (base ?d ?p_f))
            (on ?d ?d_over)
            
            ; Clear status changes
            (available ?p_f) ; P_f is now empty
            (not (top ?d_over))
            
            ; Location change
            (not (location ?d ?p_f))
            (location ?d ?p_t)
            
            (increase (total-cost) 1)
        )
    )

    ;; 4. Move D from Peg Base to Peg Base (Base to Base)
    (:action move_D_B_B
        :parameters (?d - disk ?p_f - peg ?p_t - peg)
        :precondition (and
            (not (= ?p_f ?p_t))
            
            ; D is ready to move (only disk on P_f)
            (top ?d)
            (location ?d ?p_f)
            (base ?d ?p_f)
            
            ; P_t is ready to receive
            (available ?p_t)
        )
        :effect (and
            ; D moves off base P_f, onto base P_t
            (not (base ?d ?p_f))
            (base ?d ?p_t)
            
            ; Change peg status
            (available ?p_f)
            (not (available ?p_t))
            
            ; Location change
            (not (location ?d ?p_f))
            (location ?d ?p_t)
            
            (increase (total-cost) 1)
        )
    )
)