(define (domain blocksworld)
(:requirements :strips :typing :negative-preconditions :action-costs)
(:types block - object)

(:predicates
    (on ?x - block ?y - block)
    (on-table ?x - block)
    (clear ?x - block)
    (holding ?x - block)
    (hand-empty)
)

(:functions
    (total-cost)
)

;; Action 1: Pick up block from table
(:action pick-up
    :parameters (?b - block)
    :precondition (and
        (clear ?b)
        (on-table ?b)
        (hand-empty)
    )
    :effect (and
        (not (clear ?b))
        (not (on-table ?b))
        (not (hand-empty))
        (holding ?b)
        (increase (total-cost) 1)
    )
)

;; Action 2: Put down block onto table
(:action put-down
    :parameters (?b - block)
    :precondition (holding ?b)
    :effect (and
        (clear ?b)
        (on-table ?b)
        (hand-empty)
        (not (holding ?b))
        (increase (total-cost) 1)
    )
)

;; Action 3: Stack block A onto block B
(:action stack
    :parameters (?a - block ?b - block)
    :precondition (and
        (holding ?a)
        (clear ?b)
    )
    :effect (and
        (not (clear ?b))
        (not (holding ?a))
        (on ?a ?b)
        (clear ?a)
        (hand-empty)
        (increase (total-cost) 1)
    )
)

;; Action 4: Unstack block A from block B
(:action unstack
    :parameters (?a - block ?b - block)
    :precondition (and
        (on ?a ?b)
        (clear ?a)
        (hand-empty)
    )
    :effect (and
        (clear ?b)
        (holding ?a)
        (not (on ?a ?b))
        (not (clear ?a))
        (not (hand-empty))
        (increase (total-cost) 1)
    )
)
)