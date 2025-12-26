(define (domain hanoi-4-disks)
    (:requirements :strips :typing :negative-preconditions :action-costs)

    (:types
        disk peg - object
    )

    (:predicates
        (on ?d - disk ?l - object)          ; d is immediately on top of l (l is peg or disk)
        (clear ?l - object)                 ; l has nothing on top of it (available for placement)
        (smaller ?d1 - disk ?d2 - disk)     ; d1 is strictly smaller than d2
        (disk-on-peg ?d - disk ?p - peg)    ; d is currently associated with peg p (tracks overall location for goal state)
    )

    (:functions
        (total-cost) - number
    )

    ; Action 1: Move disk D from a support L_from (peg or disk) to an empty peg P_to
    (:action move-to-empty-peg
        :parameters (?d - disk ?l_from - object ?p_from - peg ?p_to - peg)
        :precondition (and
            (on ?d ?l_from)         ; D is on L_from
            (clear ?d)              ; D is the top disk (Rule 2)
            (clear ?p_to)           ; P_to is currently empty
            (disk-on-peg ?d ?p_from)
            (not (= ?p_from ?p_to)) ; Must move between different pegs
        )
        :effect (and
            (not (on ?d ?l_from))
            (not (clear ?p_to))     
            (on ?d ?p_to)           

            (clear ?l_from)         ; L_from is now clear

            (not (disk-on-peg ?d ?p_from))
            (disk-on-peg ?d ?p_to)

            (increase (total-cost) 1)
        )
    )

    ; Action 2: Move disk D from a support L_from (peg or disk) onto a larger disk D_under
    (:action move-onto-disk
        :parameters (?d - disk ?l_from - object ?d_under - disk ?p_from - peg ?p_to - peg)
        :precondition (and
            (on ?d ?l_from)         ; D is on L_from
            (clear ?d)              ; D is the top disk (Rule 2)
            
            (clear ?d_under)        ; D_under is clear (available spot)
            (smaller ?d ?d_under)   ; D must be smaller than D_under (Rule 3: never place larger on smaller)
            
            (disk-on-peg ?d ?p_from) 
            (disk-on-peg ?d_under ?p_to) ; D_under defines the destination peg P_to context
            (not (= ?p_from ?p_to)) ; Must move between different pegs
        )
        :effect (and
            (not (on ?d ?l_from))
            (not (clear ?d_under))  
            (on ?d ?d_under)        

            (clear ?l_from)         ; L_from is now clear

            (not (disk-on-peg ?d ?p_from))
            (disk-on-peg ?d ?p_to)
            
            (increase (total-cost) 1)
        )
    )