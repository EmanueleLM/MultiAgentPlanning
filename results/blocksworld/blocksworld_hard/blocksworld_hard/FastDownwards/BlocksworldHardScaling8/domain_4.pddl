(define (domain blocksworld)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types
        block - object
    )
    (:predicates
        (on ?b - block ?x - object) ; x is a block or the table T
        (clear ?x - object) ; Dynamically tracks clearance for blocks; statically tracks clearance for T (assumed true)
        (holding ?b - block)
        (hand-empty)
    )
    (:functions
        (total-cost) - number
    )

    ;; Action 1: Pick up a block B from the surface X (assumed Table T)
    (:action pick-up
        :parameters (?b - block ?x - object)
        :precondition (and
            (on ?b ?x)
            (clear ?b)
            (hand-empty)
        )
        :effect (and
            (not (on ?b ?x))
            (not (clear ?b)) 
            (holding ?b)
            (not (hand-empty))
            (increase (total-cost) 1)
        )
    )

    ;; Action 2: Unstack a block B1 from block B2
    (:action unstack
        :parameters (?b1 - block ?b2 - block)
        :precondition (and
            (on ?b1 ?b2)
            (clear ?b1)
            (hand-empty)
        )
        :effect (and
            (not (on ?b1 ?b2))
            (not (clear ?b1))
            (holding ?b1)
            (not (hand-empty))
            (clear ?b2) ; B2 becomes clear
            (increase (total-cost) 1)
        )
    )

    ;; Action 3: Put down a block onto surface X (assumed Table T)
    (:action put-down
        :parameters (?b - block ?x - object)
        :precondition (and
            (holding ?b)
        )
        :effect (and
            (not (holding ?b))
            (hand-empty)
            (on ?b ?x)
            (clear ?b)
            (increase (total-cost) 1)
        )
    )
    
    ;; Action 4: Stack block B1 onto block B2
    (:action stack
        :parameters (?b1 - block ?b2 - block)
        :precondition (and
            (holding ?b1)
            (clear ?b2)
        )
        :effect (and
            (not (holding ?b1))
            (hand-empty)
            (on ?b1 ?b2)
            (clear ?b1)
            (not (clear ?b2)) ; B2 is no longer clear
            (increase (total-cost) 1)
        )
    )