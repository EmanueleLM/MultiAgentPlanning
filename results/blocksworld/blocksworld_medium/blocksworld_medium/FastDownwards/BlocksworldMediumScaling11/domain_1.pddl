(define (domain hanoi-5-disks)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types
        disk peg - object
    )
    (:predicates
        (on ?d1 - disk ?x2 - (either disk peg)) ; d1 is immediately on x2
        (clear ?x - (either disk peg))          ; x has nothing on top
        (smaller ?d1 - disk ?d2 - disk)        ; d1 is smaller than d2 (static)
    )
    (:functions
        (total-cost)
    )

    ; Action: Move disk ?d from stack based at ?from to stack based at ?to
    ; ?x is what ?d was sitting on. ?y is what ?d will sit on.
    (:action move
        :parameters (?d - disk ?from - peg ?to - peg ?x - (either disk peg) ?y - (either disk peg))
        :precondition (and
            (not (= ?from ?to))
            
            ; Source constraints: ?d must be clear and resting on ?x
            (on ?d ?x)
            (clear ?d)
            
            ; Destination constraints: ?y must be clear
            (clear ?y)
            
            ; Size rule: ?d cannot be placed on a larger disk (or must be placed on peg base)
            (or
                (peg ?y)
                (smaller ?d ?y)
            )
        )
        :effect (and
            (not (on ?d ?x))
            (on ?d ?y)
            (clear ?x)
            (not (clear ?y))
            (increase (total-cost) 1)
        )
    )
)