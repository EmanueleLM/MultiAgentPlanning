(define (domain blocksworld)
    (:requirements :strips :typing :negative-preconditions)
    (:types block)
    
    (:predicates
        (on ?x - block ?y - block)
        (ontable ?x - block)
        (clear ?x - block)
        (holding ?x - block)
        (hand-empty)
    )

    ;; Action 1: pick-up (from table)
    ;; Constraint: Requires empty hand, block on table, and clear.
    ;; Effect: Holding block, hand not empty, block not on table, block not clear (since it's being held).
    (:action pick-up
        :parameters (?b - block)
        :precondition (and 
            (clear ?b) 
            (ontable ?b) 
            (hand-empty)
        )
        :effect (and 
            (holding ?b) 
            (not (clear ?b)) 
            (not (ontable ?b)) 
            (not (hand-empty))
        )
    )

    ;; Action 2: put-down (onto table)
    ;; Constraint: Requires holding block.
    ;; Effect: Block on table, block clear, hand empty, not holding block.
    (:action put-down
        :parameters (?b - block)
        :precondition (holding ?b)
        :effect (and 
            (clear ?b) 
            (ontable ?b) 
            (hand-empty) 
            (not (holding ?b))
        )
    )

    ;; Action 3: unstack (from block c)
    ;; Constraint: Requires empty hand, block clear, and block must be on c.
    ;; Effect: Holding block, c becomes clear, block not clear (since it's being held), not on c, hand not empty.
    (:action unstack
        :parameters (?b - block ?c - block)
        :precondition (and 
            (on ?b ?c) 
            (clear ?b) 
            (hand-empty)
        )
        :effect (and 
            (holding ?b) 
            (clear ?c) 
            (not (clear ?b)) 
            (not (on ?b ?c)) 
            (not (hand-empty))
        )
    )

    ;; Action 4: stack (onto block c)
    ;; Constraint: Requires holding block, target block c must be clear.
    ;; Effect: b is on c, b is clear, not holding b, c is not clear, hand empty.
    (:action stack
        :parameters (?b - block ?c - block)
        :precondition (and 
            (holding ?b) 
            (clear ?c)
        )
        :effect (and 
            (on ?b ?c) 
            (clear ?b) 
            (not (holding ?b)) 
            (not (clear ?c)) 
            (hand-empty)
        )
    )