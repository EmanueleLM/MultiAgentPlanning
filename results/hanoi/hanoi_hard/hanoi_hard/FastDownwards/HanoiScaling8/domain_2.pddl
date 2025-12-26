(define (domain hanoi-6disk)
    (:requirements :typing :negative-preconditions :action-costs)
    (:types
        disk peg
    )
    (:predicates
        (smaller ?d1 - disk ?d2 - disk) ; d1 is smaller than d2 (static)
        (at ?d - disk ?p - peg)        ; d is located on p
        (top ?d - disk)                ; d is the top (movable) disk
        (on ?d1 - disk ?d2 - disk)     ; d1 is immediately on d2
        (is-base ?d - disk ?p - peg) ; d is the disk resting directly on peg p
        (clear ?p - peg)             ; p is empty
    )

    (:functions (total-cost) - number)

    ; Action 1: Move D (Base on P_from) to Empty P_to
    (define (action move-base-to-empty)
        :parameters (?d - disk ?p_from - peg ?p_to - peg)
        :precondition (and
            (at ?d ?p_from)
            (top ?d)
            (is-base ?d ?p_from)
            (clear ?p_to)
        )
        :effect (and
            (not (at ?d ?p_from))
            (not (is-base ?d ?p_from))
            
            (at ?d ?p_to)
            (is-base ?d ?p_to)
            
            (clear ?p_from)
            (not (clear ?p_to))
            (increase (total-cost) 1)
        )
    )

    ; Action 2: Move D (On D_below) to Empty P_to
    (define (action move-disk-to-empty)
        :parameters (?d - disk ?d_below - disk ?p_from - peg ?p_to - peg)
        :precondition (and
            (at ?d ?p_from)
            (top ?d)
            (on ?d ?d_below)
            (clear ?p_to)
        )
        :effect (and
            (not (at ?d ?p_from))
            (not (on ?d ?d_below))
            (top ?d_below) ; D_below is now clear/top
            
            (at ?d ?p_to)
            (is-base ?d ?p_to)
            
            (not (clear ?p_to))
            (increase (total-cost) 1)
        )
    )
    
    ; Action 3: Move D (Base on P_from) to D_target (on P_to)
    (define (action move-base-to-disk)
        :parameters (?d - disk ?p_from - peg ?d_target - disk ?p_to - peg)
        :precondition (and
            (at ?d ?p_from)
            (top ?d)
            (is-base ?d ?p_from)
            
            (at ?d_target ?p_to)
            (top ?d_target)
            
            (smaller ?d ?d_target) ; Hanoi rule: D must be smaller than D_target
        )
        :effect (and
            (not (at ?d ?p_from))
            (not (is-base ?d ?p_from))
            (clear ?p_from) ; P_from becomes empty
            
            (at ?d ?p_to)
            (on ?d ?d_target)
            (not (top ?d_target))
            (increase (total-cost) 1)
        )
    )

    ; Action 4: Move D (On D_below) to D_target (on P_to)
    (define (action move-disk-to-disk)
        :parameters (?d - disk ?d_below - disk ?p_from - peg ?d_target - disk ?p_to - peg)
        :precondition (and
            (at ?d ?p_from)
            (top ?d)
            (on ?d ?d_below)
            
            (at ?d_target ?p_to)
            (top ?d_target)
            
            (smaller ?d ?d_target) ; Hanoi rule: D must be smaller than D_target
        )
        :effect (and
            (not (at ?d ?p_from))
            (not (on ?d ?d_below))
            (top ?d_below) ; D_below is now clear/top
            
            (at ?d ?p_to)
            (on ?d ?d_target)
            (not (top ?d_target))
            (increase (total-cost) 1)
        )
    )
)