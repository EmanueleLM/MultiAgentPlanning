(define (domain hanoi-6-disks)
    (:requirements :typing :negative-preconditions :action-costs)
    
    (:types 
        support
        disk - support
        peg - support
    )

    (:predicates
        (on ?d - disk ?s - support)
        (clear ?s - support)
        (smaller ?d1 - disk ?d2 - disk)
    )
    
    (:functions
        (total-cost) - number
    )

    ; Action 1: Move Disk ?d from support ?x_from to an empty Peg ?p_to
    (:action move-to-empty-peg
        :parameters (?d - disk ?x_from - support ?p_to - peg)
        :precondition (and
            (on ?d ?x_from)
            (clear ?d)
            (clear ?p_to)
        )
        :effect (and
            (not (on ?d ?x_from))
            (on ?d ?p_to)
            (clear ?x_from)
            (not (clear ?p_to))
            (increase (total-cost) 1)
        )
    )

    ; Action 2: Move Disk ?d from support ?x_from onto Disk ?d_under
    (:action move-onto-disk
        :parameters (?d - disk ?x_from - support ?d_under - disk)
        :precondition (and
            (on ?d ?x_from)
            (clear ?d)
            (clear ?d_under)
            (smaller ?d ?d_under)
        )
        :effect (and
            (not (on ?d ?x_from))
            (on ?d ?d_under)
            (clear ?x_from)
            (not (clear ?d_under))
            (increase (total-cost) 1)
        )
    )
)