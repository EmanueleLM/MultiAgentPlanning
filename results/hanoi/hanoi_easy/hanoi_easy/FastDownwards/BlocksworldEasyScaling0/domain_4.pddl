(define (domain blocksworld)
    (:requirements :strips :typing :negative-preconditions)
    (:types block - object)

    (:predicates
        (on ?b1 - block ?b2 - block)
        (on_table ?b - block)
        (clear ?b - block)
        (holding ?b - block)
        (hand_empty)
    )

    ;; 1. PICK-UP: Block must be on the table and clear. Hand must be empty.
    (:action pick-up
        :parameters (?b - block)
        :precondition (and (on_table ?b) (clear ?b) (hand_empty))
        :effect (and (not (on_table ?b)) (not (clear ?b)) (not (hand_empty)) (holding ?b))
    )

    ;; 2. UNSTACK: Block A must be on Block B, and Block A must be clear. Hand must be empty.
    (:action unstack
        :parameters (?a - block ?b - block)
        :precondition (and (on ?a ?b) (clear ?a) (hand_empty))
        :effect (and (not (on ?a ?b)) (not (clear ?a)) (clear ?b) (not (hand_empty)) (holding ?a))
    )

    ;; 3. PUT-DOWN: Agent must be holding the block. Places it on the table.
    (:action put-down
        :parameters (?b - block)
        :precondition (holding ?b)
        :effect (and (on_table ?b) (clear ?b) (hand_empty) (not (holding ?b)))
    )

    ;; 4. STACK: Agent must be holding Block A, and Block B (the target) must be clear.
    (:action stack
        :parameters (?a - block ?b - block)
        :precondition (and (holding ?a) (clear ?b))
        :effect (and (on ?a ?b) (clear ?a) (not (clear ?b)) (hand_empty) (not (holding ?a)))
    )
)