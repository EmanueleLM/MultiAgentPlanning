(define (domain blocks-specific)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        block - object
    )
    (:predicates
        (on ?b1 - block ?l - object) ; ?l can be a block or the table constant
        (clear ?b - block)       
        (handempty)
        (holding ?b - block)
        (is-table ?l - object) ; Identifies the non-block base location
    )
    
    ;; Pick up a block from the table (T)
    ;; Preconditions: Hand empty, block on T, block clear.
    ;; Effects: Holding block, hand not empty, block not on T.
    (:action pick-up
        :parameters (?b - block ?t - object)
        :precondition (and 
            (is-table ?t)
            (handempty)
            (on ?b ?t)
            (clear ?b)
        )
        :effect (and 
            (holding ?b)
            (not (handempty))
            (not (on ?b ?t))
        )
    )
    
    ;; Unstack a block (?b1) from another block (?b2)
    ;; Preconditions: Hand empty, b1 on b2, b1 clear.
    ;; Effects: Holding b1, hand not empty, b1 not on b2, b2 becomes clear.
    (:action unstack
        :parameters (?b1 - block ?b2 - block)
        :precondition (and
            (handempty)
            (on ?b1 ?b2)
            (clear ?b1)
        )
        :effect (and
            (holding ?b1)
            (not (handempty))
            (not (on ?b1 ?b2))
            (clear ?b2)
        )
    )
    
    ;; Put down a block (?b) onto the table (T)
    ;; Preconditions: Holding block.
    ;; Effects: Hand empty, block on T, block becomes clear.
    (:action put-down
        :parameters (?b - block ?t - object)
        :precondition (and 
            (is-table ?t)
            (holding ?b)
        )
        :effect (and
            (handempty)
            (not (holding ?b))
            (on ?b ?t)
            (clear ?b)
        )
    )
    
    ;; Stack a block (?b1) onto another block (?b2)
    ;; Preconditions: Holding b1, b2 clear.
    ;; Effects: Hand empty, b1 on b2, b2 not clear, b1 clear (new top).
    (:action stack
        :parameters (?b1 - block ?b2 - block)
        :precondition (and
            (holding ?b1)
            (clear ?b2)
        )
        :effect (and
            (handempty)
            (not (holding ?b1))
            (on ?b1 ?b2)
            (not (clear ?b2))
            (clear ?b1)
        )
    )
)