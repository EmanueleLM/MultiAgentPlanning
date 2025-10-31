(define (problem combined-blocks-problem)
  (:domain combined-blocks)

  (:objects
    M H G K D N A L J F C I B E O - block
  )

  (:init
    ;; agent capabilities
    (vowel A)
    (vowel E)
    (vowel I)
    (vowel O)

    (consonant B) (consonant C) (consonant D) (consonant F)
    (consonant G) (consonant H) (consonant J) (consonant K)
    (consonant L) (consonant M) (consonant N)

    ;; Initial configuration (shared / public)
    ;; Stack 1 (bottom -> top): M, H, G, L, B, O
    (on M table)
    (on H M)
    (on G H)
    (on L G)
    (on B L)
    (on O B)

    ;; Stack 2 (bottom -> top): K, N, A, J, F, C, I, E
    (on K table)
    (on N K)
    (on A N)
    (on J A)
    (on F J)
    (on C F)
    (on I C)
    (on E I)

    ;; Stack 3
    (on D table)

    ;; Clear (top) blocks
    (clear O)
    (clear E)
    (clear D)
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
    (on M N)
    (on N O)
    (on O table)
  ))
)