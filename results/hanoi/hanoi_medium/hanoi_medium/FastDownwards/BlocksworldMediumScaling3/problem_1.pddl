(define (problem blocksworld-medium-3)
    (:domain blocksworld-medium)
    (:objects
        R B Y O - block
    )
    (:init
        (hand-empty)
        
        ; Initial Stacks:
        ; Stack 1: R on Y, Y on O, O on table
        (on R Y)
        (on Y O)
        (ontable O)
        
        ; Stack 2: B on table
        (ontable B)
        
        ; Clear blocks: R (top of Stack 1) and B (top of Stack 2)
        (clear R)
        (clear B)
    )
    (:goal (and
        ; Goal: The blue block must be on top of the orange block
        (on B O)
        ; Goal: The yellow block must be on top of the red block
        (on Y R)
    ))
)