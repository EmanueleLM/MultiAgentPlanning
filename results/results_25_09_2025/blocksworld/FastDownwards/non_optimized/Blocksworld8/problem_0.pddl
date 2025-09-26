(define (problem multiagent-blocks-combined-problem)
  (:domain multiagent-blocks-combined)
  (:objects
    A B C D E F G H I J K L M N - block
    vowel_agent consonant_agent - agent
  )

  (:init
    ;; Agent roles
    (vowel-agent vowel_agent)
    (consonant-agent consonant_agent)

    ;; Vowel blocks (from agent 1)
    (vowel A)
    (vowel E)
    (vowel I)

    ;; Consonant classification (set for all non-vowel blocks to resolve ambiguity)
    (is-consonant B) (is-consonant C) (is-consonant D)
    (is-consonant F) (is-consonant G) (is-consonant H)
    (is-consonant J) (is-consonant K) (is-consonant L)
    (is-consonant M) (is-consonant N)

    ;; Initial stacks (stack1 bottom to top: I C H G A N K)
    (ontable I)
    (on C I)
    (on H C)
    (on G H)
    (on A G)
    (on N A)
    (on K N)

    ;; Initial stacks (stack2 bottom to top: D F E M L B J)
    (ontable D)
    (on F D)
    (on E F)
    (on M E)
    (on L M)
    (on B L)
    (on J B)

    ;; Clear (top blocks)
    (clear K)
    (clear J)

    ;; Hands empty
    (handempty vowel_agent)
    (handempty consonant_agent)
  )

  ;; Global goal: single tower with N on the table and blocks above it in order
  ;; ... N M L K J I H G F E D C B A  (A is top)
  (:goal (and
    (ontable N)
    (on M N)
    (on L M)
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
  ))
)