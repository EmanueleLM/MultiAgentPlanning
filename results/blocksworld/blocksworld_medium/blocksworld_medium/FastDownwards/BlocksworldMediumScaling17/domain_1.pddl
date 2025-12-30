(define (domain hanoi-5-disks)
    (:requirements :strips :typing :action-costs)
    (:types
        disk peg - object
    )
    (:predicates
        (smaller ?d1 - disk ?d2 - disk) ; d1 is smaller than d2 (Static)
        (on ?d1 - disk ?d2 - disk)     ; d1 is directly on d2
        (on-peg ?d - disk ?p - peg)    ; d is on the base of peg p
        (clear-disk ?d - disk)         ; Nothing is on d (d is movable)
        (empty-peg ?p - peg)           ; Peg p is empty (base is usable)
    )

    ;; Action 1: Move disk D from disk X to disk Y (D -> Y)
    (:action move-d-to-d
        :parameters (?d - disk ?x - disk ?y - disk ?p_from - peg ?p_to - peg)
        :precondition (and
            ; D must be movable
            (clear-disk ?d)
            ; D's source support must be X
            (on ?d ?x)
            
            ; Y must be clear target
            (clear-disk ?y) 
            ; Hanoi rule: D must be smaller than Y
            (smaller ?d ?y) 
        )
        :effect (and
            (not (on ?d ?x))
            (on ?d ?y)

            (not (clear-disk ?y)) 
            (clear-disk ?x)       

            (increase (total-cost) 1)
        )
    )

    ;; Action 2: Move disk D from disk X to Peg P_to (empty peg)
    (:action move-d-to-peg-empty
        :parameters (?d - disk ?x - disk ?p_from - peg ?p_to - peg)
        :precondition (and
            ; D must be movable
            (clear-disk ?d)
            ; D's source support must be X
            (on ?d ?x)
            
            ; Target must be an empty peg
            (empty-peg ?p_to)
        )
        :effect (and
            (not (on ?d ?x))
            (on-peg ?d ?p_to)

            (not (empty-peg ?p_to))
            (clear-disk ?x)

            (increase (total-cost) 1)
        )
    )

    ;; Action 3: Move disk D from Peg P_from (base) to Disk Y
    (:action move-d-from-peg-to-d
        :parameters (?d - disk ?y - disk ?p_from - peg ?p_to - peg)
        :precondition (and
            ; D must be movable
            (clear-disk ?d)
            ; D's source support must be P_from base
            (on-peg ?d ?p_from)

            ; Y must be clear target
            (clear-disk ?y)
            ; Hanoi rule: D must be smaller than Y
            (smaller ?d ?y) 
        )
        :effect (and
            (not (on-peg ?d ?p_from))
            (on ?d ?y)

            (not (clear-disk ?y))
            (empty-peg ?p_from)

            (increase (total-cost) 1)
        )
    )
    
    ;; Action 4: Move disk D from Peg P_from (base) to Peg P_to (empty peg)
    (:action move-d-from-peg-to-peg
        :parameters (?d - disk ?p_from - peg ?p_to - peg)
        :precondition (and
            ; D must be movable
            (clear-disk ?d)
            ; D's source support must be P_from base
            (on-peg ?d ?p_from)

            ; Target must be an empty peg
            (empty-peg ?p_to)
            ; Must move between different pegs
            (not (= ?p_from ?p_to))
        )
        :effect (and
            (not (on-peg ?d ?p_from))
            (on-peg ?d ?p_to)

            (empty-peg ?p_from)
            (not (empty-peg ?p_to))

            (increase (total-cost) 1)
        )
    )
)