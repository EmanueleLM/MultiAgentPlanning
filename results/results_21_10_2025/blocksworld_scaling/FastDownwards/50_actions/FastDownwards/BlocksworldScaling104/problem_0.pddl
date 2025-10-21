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

    ; Types of letters
    (vowel A) (vowel E) (vowel I)

    (consonant B) (consonant C) (consonant D)
    (consonant F) (consonant G) (consonant H)
    (consonant J) (consonant K) (consonant L)
    (consonant M) (consonant N)
  )

  (:goal (and
    ; Hard constraints derived from the agents' required final relations:
    (on A B)    ; A must be placed on B
    (on H I)    ; H on I
    (on I J)    ; I on J
    (on D E)    ; D on E
    (on E F)    ; E on F
  ))
)