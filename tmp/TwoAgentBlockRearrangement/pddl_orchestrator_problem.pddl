(define (problem orchestrator-problem)
  (:domain orchestrator-blocks)

  (:objects
    A B C D E F G I - block
    goal_stack_A goal_stack_B stack3 - stack
  )

  (:init
    ;; block/stack typing
    (block A) (block B) (block C) (block D) (block E) (block F) (block G) (block I)
    (stack goal_stack_A) (stack goal_stack_B) (stack stack3)

    ;; agent-specific access
    (vowel A) (vowel E) (vowel I)
    (consonant B) (consonant C) (consonant D) (consonant F) (consonant G)

    ;; initial stacks (mapped from the provided initial bottom-to-top stacks)
    ;; initial stack1 -> goal_stack_A: bottom-to-top [D, C, B, A]
    (on D goal_stack_A)
    (on C D)
    (on B C)
    (on A B)

    ;; initial stack2 -> goal_stack_B: bottom-to-top [E, G, I, F]
    (on E goal_stack_B)
    (on G E)
    (on I G)
    (on F I)

    ;; top blocks are clear
    (clear A)
    (clear F)

    ;; stack3 is initially empty (available as the third table slot)
    (empty stack3)

    ;; hands free
    (hand-free-vowel)
    (hand-free-cons)
  )

  ;; Goal requires exact block order on the named goal stacks; no agent holds any block; third stack empty.
  (:goal (and
    ;; goal_stack_A bottom-to-top: [C, B, A, D]  => C on goal_stack_A, B on C, A on B, D on A
    (on C goal_stack_A)
    (on B C)
    (on A B)
    (on D A)
    (clear D)

    ;; goal_stack_B bottom-to-top: [G, I, F, E]
    (on G goal_stack_B)
    (on I G)
    (on F I)
    (on E F)
    (clear E)

    ;; ensure third table slot empty so final table stacks are exactly the two goal stacks
    (empty stack3)

    ;; no one is holding any block at the end
    (hand-free-vowel)
    (hand-free-cons)
  ))

  (:metric minimize (total-time)) ;; placeholder to allow planners that expect a metric; not used here
)