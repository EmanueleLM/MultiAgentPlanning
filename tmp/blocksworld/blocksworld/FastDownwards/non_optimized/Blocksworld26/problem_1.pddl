(define (problem combined-blocks-problem)
  (:domain combined-blocks)
  (:objects
    A B C D E F G H I J K L M N - block
  )

  (:init
    ;; Agent capabilities
    (vowel A) (vowel E) (vowel I)
    (consonant B) (consonant C) (consonant D) (consonant F)
    (consonant G) (consonant H) (consonant J) (consonant K)
    (consonant L) (consonant M) (consonant N)

    ;; Initial stacks (bottom -> ... -> top)
    (on-table B)
    (on D B)
    (on C D)

    (on-table G)
    (on L G)
    (on K L)
    (on F K)
    (on H F)
    (on E H)

    (on-table I)
    (on M I)
    (on J M)
    (on A J)
    (on N A)

    ;; Top and clear facts for current tops
    (top C) (clear C)
    (top E) (clear E)
    (top N) (clear N)

    ;; The blocks that are bases are on-table but not clear unless they are top;
    ;; other intermediate blocks are not clear/top (closed-world will treat missing facts as false).
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
    (on-table N)
  ))

  (:metric minimize (total-cost))
)