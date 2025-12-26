(define (domain blocksworld)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types block)
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

    ;; Action 1: Pick up a block from the table (Constraint 2, 1)
    (:action pick-up
        :parameters (?b - block)
        :precondition (and
            (clear ?b)
            (on-table ?b)
            (hand-empty)
        )
        :effect (and
            (not (on-table ?b))
            (not (hand-empty))
            (not (clear ?b)) ; B is no longer clear when held
            (holding ?b) ; Constraint 4
            (increase (total-cost) 1)
        )
    )

    ;; Action 2: Unstack a block from another block (Constraint 3, 1)
    (:action unstack
        :parameters (?b - block ?a - block)
        :precondition (and
            (on ?b ?a)
            (clear ?b)
            (hand-empty)
        )
        :effect (and
            (not (on ?b ?a))
            (not (hand-empty))
            (not (clear ?b)) ; B is no longer clear when held
            (clear ?a) ; A becomes clear
            (holding ?b) ; Constraint 4
            (increase (total-cost) 1)
        )
    )

    ;; Action 3: Put down a block onto the table (Constraint 5)
    (:action put-down
        :parameters (?b - block)
        :precondition (holding ?b)
        :effect (and
            (not (holding ?b))
            (on-table ?b)
            (clear ?b)
            (hand-empty)
            (increase (total-cost) 1)
        )
    )

    ;; Action 4: Stack a block onto another clear block (Constraint 5, 6)
    (:action stack
        :parameters (?b - block ?a - block)
        :precondition (and
            (holding ?b)
            (clear ?a)
        )
        :effect (and
            (not (holding ?b))
            (not (clear ?a)) ; Constraint 6: A is no longer clear
            (on ?b ?a)
            (clear ?b) ; B is now clear
            (hand-empty)
            (increase (total-cost) 1)
        )
    )
)