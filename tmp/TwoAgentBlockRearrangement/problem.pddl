(define (problem orchestrator-problem)
  (:domain orchestrator-blocks)
  (:objects
    A B C D E F G I - block
    stack1 stack2 stack3 - stack
  )
  (:init
    ;; blocks and stacks
    (block A) (block B) (block C) (block D) (block E) (block F) (block G) (block I)
    (stack stack1) (stack stack2) (stack stack3)
    ;; agent roles for blocks
    (vowel A) (vowel E) (vowel I)
    (consonant B) (consonant C) (consonant D) (consonant F) (consonant G)
    ;; initial on relations (bottom-to-top)
    (on D stack1)
    (on C D)
    (on B C)
    (on A B)
    (on E stack2)
    (on G E)
    (on I G)
    (on F I)
    ;; clear and empty
    (clear A)
    (clear F)
    (empty stack3)
    ;; hands free
    (hand-free-vowel)
    (hand-free-cons)
    ;; total-cost initial value
    (= (total-cost) 0)
  )
  (:goal (and
    ;; goal stack 1: bottom-to-top C B A D
    (on C stack1)
    (on B C)
    (on A B)
    (on D A)
    (clear D)
    ;; goal stack 2: bottom-to-top G I F E
    (on G stack2)
    (on I G)
    (on F I)
    (on E F)
    (clear E)
    ;; preserve available empty stack and free hands
    (empty stack3)
    (hand-free-vowel)
    (hand-free-cons)
  ))
  (:metric minimize (total-cost))
)