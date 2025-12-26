(define (domain blocksworld)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types block)

    (:predicates
        (on ?b1 - block ?b2 - block)
        (ontable ?b - block)
        (clear ?b - block)
        (handempty)
        (holding ?b - block)
    )

    (:functions
        (total-cost)
    )

    ;; Action 1: Pick up a block from the table
    ;; Preconditions: Block is clear, on the table, and hand is empty.
    ;; Effects: Block is held, no longer clear or on table, hand is full.
    (:action pick-up
        :parameters (?b - block)
        :precondition (and (clear ?b) (ontable ?b) (handempty))
        :effect (and (not (ontable ?b)) (not (clear ?b)) (not (handempty)) (holding ?b) (increase (total-cost) 1))
    )

    ;; Action 2: Put down a block onto the table
    ;; Preconditions: Holding the block.
    ;; Effects: Block is on the table and clear, hand becomes empty.
    (:action put-down
        :parameters (?b - block)
        :precondition (holding ?b)
        :effect (and (not (holding ?b)) (handempty) (ontable ?b) (clear ?b) (increase (total-cost) 1))
    )

    ;; Action 3: Unstack a block from another block
    ;; Preconditions: Block ?b is on ?c, ?b is clear, hand is empty.
    ;; Effects: ?b is held, ?b is no longer on ?c or clear, ?c becomes clear, hand is full.
    (:action unstack
        :parameters (?b - block ?c - block)
        :precondition (and (on ?b ?c) (clear ?b) (handempty))
        :effect (and (not (on ?b ?c)) (not (clear ?b)) (not (handempty)) (holding ?b) (clear ?c) (increase (total-cost) 1))
    )

    ;; Action 4: Stack a block onto another block
    ;; Preconditions: Holding ?b, target block ?c is clear.
    ;; Effects: ?b is stacked on ?c, ?c is no longer clear, ?b becomes clear (as it's now on top), hand is empty.
    (:action stack
        :parameters (?b - block ?c - block)
        :precondition (and (holding ?b) (clear ?c))
        :effect (and (not (holding ?b)) (not (clear ?c)) (handempty) (on ?b ?c) (clear ?b) (increase (total-cost) 1))
    )