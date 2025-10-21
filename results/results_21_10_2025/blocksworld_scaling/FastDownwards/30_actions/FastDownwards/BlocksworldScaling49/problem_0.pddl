(define (problem build-A-on-B-...-N-on-table)
  (:domain blocksworld-multiagent)
  (:objects
    A B C D E F G H I J K L M N - block
  )

  (:init
    ;; Initial stacks: D-root stack
    (ontable D)
    (on A D)
    (on L A)
    (on N L)
    (on C N)
    (on H C)

    ;; I-root stack
    (ontable I)
    (on M I)
    (on J M)
    (on K J)
    (on F K)
    (on G F)
    (on B G)
    (on E B)

    ;; Clear/top blocks
    (clear H)
    (clear E)

    ;; Vowel / consonant classification (as provided)
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
    (ontable N)
  ))
)