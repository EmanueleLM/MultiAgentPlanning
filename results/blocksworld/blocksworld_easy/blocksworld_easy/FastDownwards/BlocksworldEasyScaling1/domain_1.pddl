(define (domain hanoi-4disk)
    (:requirements :strips :typing :action-costs)
    (:types
        disk peg - object
    )
    (:predicates
        (smaller ?d1 - disk ?d2 - disk) ; d1 is smaller than d2 (static constraint)
        (on ?d - disk ?l - object)      ; d is immediately on l (l is disk or peg)
        (clear ?l - object)             ; l (disk or peg) has nothing on top
    )
    
    (:functions
        (total-cost) - number
    )

    ;; Action 1: Move disk D1 from L_from (disk or peg) to Peg P_to
    (:action move_to_peg
        :parameters (?d1 - disk ?l_from - object ?p_to - peg)
        :precondition (and
            (on ?d1 ?l_from)
            (clear ?d1)    ; D1 must be the top disk
            (clear ?p_to)  ; P_to must be clear
        )
        :effect (and
            (not (on ?d1 ?l_from))
            (on ?d1 ?p_to)
            (not (clear ?p_to))
            (clear ?l_from)
            (increase (total-cost) 1)
        )
    )

    ;; Action 2: Move disk D1 from L_from (disk or peg) to Disk D2
    (:action move_to_disk
        :parameters (?d1 - disk ?l_from - object ?d2 - disk)
        :precondition (and
            (on ?d1 ?l_from)
            (clear ?d1)    ; D1 must be the top disk
            (clear ?d2)    ; D2 must be clear
            (smaller ?d1 ?d2) ; Hanoi constraint: D1 must be smaller than D2
        )
        :effect (and
            (not (on ?d1 ?l_from))
            (on ?d1 ?d2)
            (not (clear ?d2))
            (clear ?l_from)
            (increase (total-cost) 1)
        )
    )
)