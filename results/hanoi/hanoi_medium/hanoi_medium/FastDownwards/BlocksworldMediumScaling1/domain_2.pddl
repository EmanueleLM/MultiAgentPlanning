(define (domain blocksworld)
    (:requirements :strips :typing :action-costs)
    (:types block)
    (:predicates
        (on ?x - block ?y - block)
        (on-table ?x - block)
        (clear ?x - block)
        (hand-empty)
        (holding ?x - block)
    )

    (:functions
        (total-cost) - number
    )

    ;; Action to pick up a block from the table
    (:action pick-up
        :parameters (?x - block)
        :precondition (and (clear ?x) (on-table ?x) (hand-empty))
        :effect (and (not (on-table ?x))
                     (not (hand-empty))
                     (holding ?x)
                     (increase (total-cost) 1)
                )
    )

    ;; Action to put down a block onto the table
    (:action put-down
        :parameters (?x - block)
        :precondition (holding ?x)
        :effect (and (not (holding ?x))
                     (hand-empty)
                     (on-table ?x)
                     (clear ?x)
                     (increase (total-cost) 1)
                )
    )

    ;; Action to stack block ?x onto block ?y
    (:action stack
        :parameters (?x - block ?y - block)
        :precondition (and (holding ?x) (clear ?y))
        :effect (and (not (holding ?x))
                     (not (clear ?y))
                     (hand-empty)
                     (on ?x ?y)
                     (increase (total-cost) 1)
                )
    )

    ;; Action to unstack block ?x from block ?y
    (:action unstack
        :parameters (?x - block ?y - block)
        :precondition (and (on ?x ?y) (clear ?x) (hand-empty))
        :effect (and (not (on ?x ?y))
                     (not (hand-empty))
                     (clear ?y)
                     (holding ?x)
                     (increase (total-cost) 1)
                )
    )
)