(define (domain blocksworld-hard-scaling5)
    (:requirements :strips :typing :negative-preconditions)
    (:types block)
    (:predicates
        (on ?x - block ?y - block)
        (ontable ?x - block)
        (clear ?x - block)
        (handempty)
        (holding ?x - block)
    )

    ;; Action 1: Pick up a block from the table
    ;; Pre: Hand empty, block on table, block is clear (nothing on it AND not held)
    ;; Effect: Hold block, block is no longer clear (since it is held)
    (:action pick-up
        :parameters (?x - block)
        :precondition (and
            (handempty)
            (ontable ?x)
            (clear ?x)
        )
        :effect (and
            (holding ?x)
            (not (handempty))
            (not (ontable ?x))
            (not (clear ?x))
        )
    )

    ;; Action 2: Unstack a block from another block
    ;; Pre: Hand empty, X on Y, X is clear (nothing on it AND not held)
    ;; Effect: Hold X, Y becomes clear, X is no longer clear (since it is held)
    (:action unstack
        :parameters (?x - block ?y - block)
        :precondition (and
            (handempty)
            (on ?x ?y)
            (clear ?x)
        )
        :effect (and
            (holding ?x)
            (not (handempty))
            (not (on ?x ?y))
            (clear ?y)
            (not (clear ?x))
        )
    )

    ;; Action 3: Put down a block onto the table
    ;; Pre: Holding block
    ;; Effect: Block placed on table, hand empty, block becomes clear
    (:action put-down
        :parameters (?x - block)
        :precondition (holding ?x)
        :effect (and
            (handempty)
            (not (holding ?x))
            (ontable ?x)
            (clear ?x)
        )
    )

    ;; Action 4: Stack a block onto another block
    ;; Pre: Holding X, Y is clear
    ;; Effect: X placed on Y, hand empty, X becomes clear, Y is no longer clear
    (:action stack
        :parameters (?x - block ?y - block)
        :precondition (and
            (holding ?x)
            (clear ?y)
        )
        :effect (and
            (handempty)
            (not (holding ?x))
            (on ?x ?y)
            (not (clear ?y))
            (clear ?x)
        )
    )
)