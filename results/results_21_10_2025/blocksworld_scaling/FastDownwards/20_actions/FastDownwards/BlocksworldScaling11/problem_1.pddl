(define (problem blocksworld-multiagent-problem)
  (:domain blocksworld-multiagent)

  (:objects
    TABLE - block
    A B C D E F G H I J K L M - block
  )

  (:init
    ; Initial stacks given as on relations (bottom -> top)
    ; Stack 1: L (on TABLE), G on L, E on G, C on E, H on C
    (on L TABLE)
    (on G L)
    (on E G)
    (on C E)
    (on H C)

    ; Stack 2: F (on TABLE), I on F, D on I, B on D, M on B, A on M, K on A, J on K
    (on F TABLE)
    (on I F)
    (on D I)
    (on B D)
    (on M B)
    (on A M)
    (on K A)
    (on J K)

    ; Clear predicates: only tops are clear initially (H and J)
    (clear H)
    (clear J)

    ; Table is represented as a block named TABLE; blocks that are on TABLE are listed above.
    ; (We do NOT restrict the TABLE's "clearness" in general; actions to/from TABLE are handled by separate actions.)

    ; Agent-specific permissions: vowels and consonants
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
    (on A B)
    (on B C)
    (on C D)
    (on D E)
    (on E F)
    (on F G)
    (on G H)
    (on H I)
    (on I J)
    (on J K)
    (on K L)
    (on L M)
    (on M TABLE)
  ))
)