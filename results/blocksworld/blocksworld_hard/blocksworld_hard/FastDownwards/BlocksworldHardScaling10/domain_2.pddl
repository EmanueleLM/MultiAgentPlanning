(define (domain hanoi-6-disks)
    (:requirements :typing :negative-preconditions :action-costs)
    (:types
        disk peg - object
    )
    (:predicates
        (on ?d - disk ?loc - object) ; ?loc can be a disk or a peg
        (clear ?loc - object)       ; ?loc can be a disk or a peg
        (smaller ?d1 - disk ?d2 - disk)
    )
    
    (:functions
        (total-cost) - number
    )

    ;; Action to move disk ?d from ?src to Peg ?p
    (:action move-to-peg
        :parameters (?d - disk ?src - object ?p - peg)
        :precondition (and
            (on ?d ?src)
            (clear ?d)
            (clear ?p)
        )
        :effect (and
            (not (on ?d ?src))
            (on ?d ?p)
            (clear ?src)
            (not (clear ?p))
            (increase (total-cost) 1)
        )
    )
    
    ;; Action to move disk ?d1 from ?src onto Disk ?d2
    (:action move-to-disk
        :parameters (?d1 - disk ?src - object ?d2 - disk)
        :precondition (and
            (on ?d1 ?src)
            (clear ?d1)
            (clear ?d2)
            (smaller ?d1 ?d2) ; Enforce size constraint: ?d1 must be smaller than ?d2
        )
        :effect (and
            (not (on ?d1 ?src))
            (on ?d1 ?d2)
            (clear ?src)
            (not (clear ?d2))
            (increase (total-cost) 1)
        )
    )
)