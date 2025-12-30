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

    ;; Action 1: Pick up a block from the table
    (:action pick-up
        :parameters (?x - block)
        :precondition (and (clear ?x) (on-table ?x) (hand-empty))
        :effect (and (not (on-table ?x))
                     (not (clear ?x))
                     (not (hand-empty))
                     (holding ?x)
                     (increase (total-cost) 1)
                )
    )

    ;; Action 2: Put down a block onto the table
    (:action put-down
        :parameters (?x - block)
        :precondition (holding ?x)
        :effect (and (not (holding ?x))
                     (on-table ?x)
                     (clear ?x)
                     (hand-empty)
                     (increase (total-cost) 1)
                )
    )

    ;; Action 3: Stack a block on another block
    (:action stack
        :parameters (?x - block ?y - block)
        :precondition (and (holding ?x) (clear ?y) (not (= ?x ?y)))
        :effect (and (not (holding ?x))
                     (not (clear ?y))
                     (on ?x ?y)
                     (clear ?x)
                     (hand-empty)
                     (increase (total-cost) 1)
                )
    )

    ;; Action 4: Unstack a block from another block
    (:action unstack
        :parameters (?x - block ?y - block)
        :precondition (and (on ?x ?y) (clear ?x) (hand-empty) (not (= ?x ?y)))
        :effect (and (not (on ?x ?y))
                     (not (clear ?x))
                     (not (hand-empty))
                     (holding ?x)
                     (clear ?y)
                     (increase (total-cost) 1)
                )
    )