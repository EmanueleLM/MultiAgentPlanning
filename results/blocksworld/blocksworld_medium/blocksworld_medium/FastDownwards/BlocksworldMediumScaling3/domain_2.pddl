(define (domain blocksworld)
    (:requirements :strips :typing :negative-preconditions)
    (:types block)
    
    (:predicates
        (on ?x - block ?y - block)
        (on-table ?x - block)
        (clear ?x - block)
        (hand-empty)
        (holding ?x - block)
    )

    ;; Action 1: Pick up block ?x from the table
    (:action pick-up
        :parameters (?x - block)
        :precondition (and (clear ?x) (on-table ?x) (hand-empty))
        :effect (and (not (on-table ?x))
                     (not (hand-empty))
                     (holding ?x)
                     (not (clear ?x))) ; Must remove clear since it is held
    )

    ;; Action 2: Put down block ?x onto the table
    (:action put-down
        :parameters (?x - block)
        :precondition (holding ?x)
        :effect (and (on-table ?x)
                     (clear ?x)
                     (hand-empty)
                     (not (holding ?x)))
    )

    ;; Action 3: Unstack block ?x from block ?y
    (:action unstack
        :parameters (?x - block ?y - block)
        :precondition (and (on ?x ?y) (clear ?x) (hand-empty))
        :effect (and (holding ?x)
                     (clear ?y)
                     (not (on ?x ?y))
                     (not (hand-empty))
                     (not (clear ?x))) ; Must remove clear since it is held
    )

    ;; Action 4: Stack block ?x onto block ?y
    (:action stack
        :parameters (?x - block ?y - block)
        :precondition (and (holding ?x) (clear ?y))
        :effect (and (on ?x ?y)
                     (hand-empty)
                     (clear ?x)
                     (not (holding ?x))
                     (not (clear ?y)))
    )
)