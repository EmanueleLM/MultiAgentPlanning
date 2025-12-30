(define (domain blocksworld)
    (:requirements :strips :typing)

    (:types
        block
    )

    (:predicates
        (on ?a - block ?b - block)
        (on-table ?a - block)
        (clear ?a - block)
        (holding ?a - block)
        (hand-empty)
    )

    ;; 1. PICK-UP: Pick up A from the table.
    (:action PICK-UP
        :parameters (?a - block)
        :precondition (and (clear ?a)
                           (on-table ?a)
                           (hand-empty))
        :effect (and (not (on-table ?a))
                     (not (clear ?a))
                     (not (hand-empty))
                     (holding ?a))
    )

    ;; 2. UNSTACK: Unstack A from B.
    (:action UNSTACK
        :parameters (?a - block ?b - block)
        :precondition (and (on ?a ?b)
                           (clear ?a)
                           (hand-empty))
        :effect (and (not (on ?a ?b))
                     (not (clear ?a))
                     (not (hand-empty))
                     (clear ?b)
                     (holding ?a))
    )

    ;; 3. PUT-DOWN: Put down A onto the table.
    (:action PUT-DOWN
        :parameters (?a - block)
        :precondition (holding ?a)
        :effect (and (not (holding ?a))
                     (on-table ?a)
                     (clear ?a)
                     (hand-empty))
    )

    ;; 4. STACK: Stack A (which is held) onto B.
    (:action STACK
        :parameters (?a - block ?b - block)
        :precondition (and (holding ?a)
                           (clear ?b))
        :effect (and (not (holding ?a))
                     (not (clear ?b))
                     (hand-empty)
                     (on ?a ?b)
                     (clear ?a))
    )
)