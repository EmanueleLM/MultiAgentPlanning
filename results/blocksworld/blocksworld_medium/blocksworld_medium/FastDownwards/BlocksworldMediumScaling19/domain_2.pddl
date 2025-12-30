(define (domain blocksworld)
    (:requirements :strips :typing :negative-preconditions)
    (:types block)
    (:predicates
        (on ?b1 - block ?b2 - block)
        (on-table ?b - block)
        (clear ?b - block)
        (holding ?b - block)
        (hand-empty)
    )

    ;; Pick up block B from the table
    (:action pick-up
        :parameters (?b - block)
        :precondition (and (hand-empty)
                           (on-table ?b)
                           (clear ?b))
        :effect (and (not (on-table ?b))
                     (not (clear ?b))
                     (not (hand-empty))
                     (holding ?b))
    )

    ;; Unstack B1 from B2
    (:action unstack
        :parameters (?b1 - block ?b2 - block)
        :precondition (and (hand-empty)
                           (on ?b1 ?b2)
                           (clear ?b1))
        :effect (and (not (on ?b1 ?b2))
                     (not (clear ?b1))
                     (not (hand-empty))
                     (clear ?b2)
                     (holding ?b1))
    )

    ;; Put down block B onto the table
    (:action put-down
        :parameters (?b - block)
        :precondition (holding ?b)
        :effect (and (not (holding ?b))
                     (hand-empty)
                     (on-table ?b)
                     (clear ?b))
    )

    ;; Stack B1 onto B2
    (:action stack
        :parameters (?b1 - block ?b2 - block)
        :precondition (and (holding ?b1)
                           (clear ?b2))
        :effect (and (not (holding ?b1))
                     (not (clear ?b2))
                     (hand-empty)
                     (on ?b1 ?b2)
                     (clear ?b1))
    )
)