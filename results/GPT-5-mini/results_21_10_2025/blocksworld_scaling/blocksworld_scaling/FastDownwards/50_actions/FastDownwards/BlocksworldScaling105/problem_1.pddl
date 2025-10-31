(define (problem stack-rearrangement)
  (:domain blocks-vowel-consonant)
  (:objects
    A B C D E F G H I J K L M N - block
  )

  (:init
    ;; Initial stacks (bottom -> top)
    ;; Stack1: D, J, I, M, N, A, K
    (ontable D)
    (on J D)
    (on I J)
    (on M I)
    (on N M)
    (on A N)
    (on K A)

    ;; Stack2: B, H, G, C, L, E, F
    (ontable B)
    (on H B)
    (on G H)
    (on C G)
    (on L C)
    (on E L)
    (on F E)

    ;; Only the top blocks are clear initially
    (clear K)
    (clear F)

    ;; Vowel / consonant classification (private capability encoded publicly)
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
    (consonant N)
  )

  (:goal
    (and
      ;; Final single stack top-to-bottom: A on B, B on C, ..., M on N, with N on table
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
      (on M N)
      (ontable N)
    )
  )
)