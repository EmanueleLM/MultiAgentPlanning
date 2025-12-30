(define (domain blocks-world-4)
    (:requirements :strips :typing)
    (:types block)
    (:predicates
        (on ?x - block ?y - block) ; ?x is on ?y
        (ontable ?x - block)       ; ?x is on the table
        (clear ?x - block)         ; Nothing is on ?x
        (holding ?x - block)       ; The hand is holding ?x
        (handempty)
    )

    ;; 1. Pick Up: Move a block from the table into the hand.
    (:action pick-up
        :parameters (?x - block)
        :precondition (and (clear ?x)
                           (ontable ?x)
                           (handempty))
        :effect (and (not (ontable ?x))
                     (not (clear ?x))
                     (not (handempty))
                     (holding ?x)
                )
    )

    ;; 2. Unstack: Move a block from another block into the hand.
    (:action unstack
        :parameters (?x - block ?y - block)
        :precondition (and (on ?x ?y)
                           (clear ?x)
                           (handempty))
        :effect (and (not (on ?x ?y))
                     (clear ?y)
                     (not (clear ?x))
                     (not (handempty))
                     (holding ?x)
                )
    )

    ;; 3. Put Down: Move a block from the hand onto the table.
    (:action put-down
        :parameters (?x - block)
        :precondition (holding ?x)
        :effect (and (ontable ?x)
                     (clear ?x)
                     (not (holding ?x))
                     (handempty)
                )
    )

    ;; 4. Stack: Move a block from the hand onto another clear block.
    (:action stack
        :parameters (?x - block ?y - block)
        :precondition (and (holding ?x)
                           (clear ?y))
        :effect (and (on ?x ?y)
                     (clear ?x)
                     (not (clear ?y))
                     (not (holding ?x))
                     (handempty)
                )
    )