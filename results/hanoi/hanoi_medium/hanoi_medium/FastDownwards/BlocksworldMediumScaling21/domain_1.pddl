(define (domain blocksworld)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types 
        block
    )
    (:predicates
        (on ?x - block ?y - block)
        (on_table ?x - block)
        (clear ?x - block)
        (holding ?x - block)
        (hand_empty)
    )
    (:functions
        (total-cost) - number
    )

    ;; Action 1: Pick up a clear block from the table
    (:action pick-up
        :parameters (?x - block)
        :precondition (and (clear ?x) 
                           (on_table ?x)
                           (hand_empty))
        :effect (and (not (on_table ?x))
                     (not (hand_empty))
                     (holding ?x)
                     (increase (total-cost) 1)
               )
    )

    ;; Action 2: Put down a held block onto the table
    (:action put-down
        :parameters (?x - block)
        :precondition (holding ?x)
        :effect (and (not (holding ?x))
                     (hand_empty)
                     (on_table ?x)
                     (clear ?x)
                     (increase (total-cost) 1)
               )
    )

    ;; Action 3: Unstack a clear block from another block
    (:action unstack
        :parameters (?x - block ?y - block)
        :precondition (and (on ?x ?y)
                           (clear ?x)
                           (hand_empty))
        :effect (and (not (on ?x ?y))
                     (clear ?y)
                     (not (hand_empty))
                     (holding ?x)
                     (increase (total-cost) 1)
               )
    )

    ;; Action 4: Stack a held block onto a clear block
    (:action stack
        :parameters (?x - block ?y - block)
        :precondition (and (holding ?x)
                           (clear ?y))
        :effect (and (not (holding ?x))
                     (hand_empty)
                     (on ?x ?y)
                     (not (clear ?y))
                     (increase (total-cost) 1)
               )
    )
)