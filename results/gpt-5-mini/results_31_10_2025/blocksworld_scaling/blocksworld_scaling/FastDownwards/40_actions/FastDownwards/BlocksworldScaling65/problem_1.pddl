(define (problem build-goal-tower)
  (:domain blocks-multiagent)

  ; Objects: blocks and stacks. Blocks are subtypes of place via domain type declarations.
  (:objects
    A B C D E F G H I J K L - block
    Stack1 Stack2 Stack3 Stack4 StackGoal - stack
  )

  (:init
    ; Type membership: which blocks are vowel-controlled vs consonant-controlled
    (vowel A) (vowel E) (vowel I)
    (consonant B) (consonant C) (consonant D) (consonant F) (consonant G)
    (consonant H) (consonant J) (consonant K) (consonant L)

    ; Initial stacks (bottom-to-top)
    ; Stack1: [B, E, L]
    (on B Stack1)
    (on E B)
    (on L E)

    ; Stack2: [C, F, J, A]
    (on C Stack2)
    (on F C)
    (on J F)
    (on A J)

    ; Stack3: [D, G, K]
    (on D Stack3)
    (on G D)
    (on K G)

    ; Stack4: [I, H]
    (on I Stack4)
    (on H I)

    ; StackGoal initially empty (on nothing)
    ; Clear predicates: true for current tops and empty stack
    (clear L)
    (clear A)
    (clear K)
    (clear H)
    (clear StackGoal)
  )

  ; Goal: a single tower on StackGoal with bottom-to-top [L, K, J, I, H, G, F, E, D, C, B, A]
  (:goal (and
    (on L StackGoal)
    (on K L)
    (on J K)
    (on I J)
    (on H I)
    (on G H)
    (on F G)
    (on E F)
    (on D E)
    (on C D)
    (on B C)
    (on A B)
    (clear A) ; top of final tower must be clear
  ))
)