(define (problem blocksworld-agents-problem)
  (:domain blocksworld-agents)

  (:objects
    A B C D E F G H I J K L M N - block
  )

  (:init
    ; Stack1 (bottom to top): J - E - D - L - B - I - H
    (ontable J)
    (on E J)
    (on D E)
    (on L D)
    (on B L)
    (on I B)
    (on H I)

    ; Stack2 (bottom to top): K - N - M - A - F - G - C
    (ontable K)
    (on N K)
    (on M N)
    (on A M)
    (on F A)
    (on G F)
    (on C G)

    ; Clear (tops)
    (clear H)
    (clear C)

    ; Hand state
    (handempty)

    ; Types: vowels and consonants
    (vowel A) (vowel E) (vowel I)

    (consonant B) (consonant C) (consonant D)
    (consonant F) (consonant G) (consonant H)
    (consonant J) (consonant K) (consonant L)
    (consonant M) (consonant N)
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