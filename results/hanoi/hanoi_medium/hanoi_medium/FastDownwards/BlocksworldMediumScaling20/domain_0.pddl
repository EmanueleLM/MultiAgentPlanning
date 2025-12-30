```pddl
(define (domain blocksworld-4blocks)
    (:requirements :strips :typing)
    (:types block)
    
    (:predicates
        (on ?x - block ?y - block) ; Block on block
        (ontable ?x - block)       ; Block on table
        (clear ?x - block)
        (holding ?x - block)
        (hand-empty)
    )

    ;; Action 1: Pick up X from the table
    (:action pick-up
        :parameters (?x - block)
        :precondition (and (clear ?x) (ontable ?x) (hand-empty))
        :effect (and (holding ?x)
                     (not (clear ?x))
                     (not (ontable ?x))
                     (not (hand-empty))
        )
    )

    ;; Action 2: Put down X onto the table
    (:action put-down
        :parameters (?x - block)
        :precondition (holding ?x)
        :effect (and (ontable ?x)
                     (clear ?x)
                     (hand-empty)
                     (not (holding ?x))
        )
    )

    ;; Action 3: Unstack X from Y
    (:action unstack
        :parameters (?x - block ?y - block)
        :precondition (and (on ?x ?y) (clear ?x) (hand-empty))
        :effect (and (holding ?x)
                     (clear ?y)
                     (not (on ?x ?y))
                     (not (clear ?x))
                     (not (hand-empty))
        )
    )

    ;; Action 4: Stack X onto Y
    (:action stack
        :parameters (?x - block ?y - block)
        :precondition (and (holding ?x) (clear ?y))
        :effect (and (on ?x ?y)
                     (clear ?x)
                     (hand-empty)
                     (not (holding ?x))
                     (not (clear ?y))
        )
    )
)
```