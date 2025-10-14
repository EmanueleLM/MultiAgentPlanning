(define (problem multiagent-rearrange)
  (:domain multiagent-blocks)
  (:objects
    A B C D E F G H I J K L M - block
    table - place
  )
  (:init
    ;; initial stacks (as provided)
    ;; Stack with base E on the table: E bottom then L then F then C then M then K top.
    (ontable E)
    (on L E)
    (on F L)
    (on C F)
    (on M C)
    (on K M)

    ;; Stack with base H on the table: H bottom then A then B then D then I top.
    (ontable H)
    (on A H)
    (on B A)
    (on D B)
    (on I D)

    ;; Stack with base J on the table: J bottom then G top.
    (ontable J)
    (on G J)

    ;; clear (only the top blocks are clear)
    (clear K)
    (clear I)
    (clear G)

    ;; agent-specific capability facts (hard constraints)
    (vowel A)
    (vowel E)
    (vowel I)

    (consonant B)
    (consonant C)
    (consonant D)
    (consonant F)
    (consonant G)
    (consonant H)
    (consonant J)
    (consonant K)
    (consonant L)
    (consonant M)
  )
  (:goal (and
    ;; Desired single stack with M on the table and above it in order L,K,J,I,H,G,F,E,D,C,B,A (A on top)
    (ontable M)
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