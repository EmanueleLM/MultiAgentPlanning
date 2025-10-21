(define (problem build-goal-tower)
  (:domain blocks-multiagent)

  ; Objects: blocks and stacks. Blocks are of type block, stacks of type stack.
  (:objects
    A B C D E F G H I J K L - block
    Stack1 Stack2 Stack3 Stack4 StackGoal - stack
    ; Note: blocks are also "places" for the on predicate via typing conventions above.
  )

  ; Initial state: represent each stack as on relations bottom-to-top.
  (:init
    ; Type predicates
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

    ; Initially StackGoal is empty
    ; Clear predicates: only true for current tops and for empty StackGoal
    (clear L)
    (clear A)
    (clear K)
    (clear H)
    (clear StackGoal)

    ; Hands are empty for both agents (kept true; actions are atomic and do not change these predicates)
    (handempty_vowel)
    (handempty_cons)
  )

  ; Goal: a single tower on StackGoal with the specified bottom-to-top order:
  ; [L, K, J, I, H, G, F, E, D, C, B, A]
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

  ; No metric (regular reachability problem)
)