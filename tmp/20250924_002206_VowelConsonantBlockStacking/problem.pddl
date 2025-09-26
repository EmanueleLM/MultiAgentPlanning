(define (problem two-agent-stacking-problem)
  (:domain two-agent-stacking)
  (:objects
    A B C D E F G I - block
    stack1 stack2 stack3 - stack
  )

  (:init
    ;; block kinds
    (vowel A) (vowel E) (vowel I)
    (consonant B) (consonant C) (consonant D) (consonant F) (consonant G)

    ;; initial stacks (on relations). format: (on block support)
    ;; stack1 bottom-to-top: D, C, B, A  => D on stack1, C on D, B on C, A on B
    (on D stack1)
    (on C D)
    (on B C)
    (on A B)

    ;; stack2 bottom-to-top: E, G, I, F => E on stack2, G on E, I on G, F on I
    (on E stack2)
    (on G E)
    (on I G)
    (on F I)

    ;; top markers and clear: top blocks A and F
    (top A)
    (top F)
    (clear A)
    (clear F)

    ;; stacks emptiness: stack1 and stack2 non-empty; stack3 empty
    (empty stack3)

    ;; both agents start with empty hands
    (handempty_v)
    (handempty_c)
  )

  (:goal (and
    ;; target stacks:
    ;; stack1 bottom-to-top: F, C, I, G  => F on stack1, C on F, I on C, G on I
    (on F stack1)
    (on C F)
    (on I C)
    (on G I)

    ;; stack2 bottom-to-top: A, B, D, E  => A on stack2, B on A, D on B, E on D
    (on A stack2)
    (on B A)
    (on D B)
    (on E D)

    ;; top blocks are G (stack1) and E (stack2)
    (top G)
    (top E)
    (clear G)
    (clear E)

    ;; third stack remains empty (max 3 stacks rule observed)
    (empty stack3)

    ;; no agent is holding anything at the goal
    (handempty_v)
    (handempty_c)
  ))
)