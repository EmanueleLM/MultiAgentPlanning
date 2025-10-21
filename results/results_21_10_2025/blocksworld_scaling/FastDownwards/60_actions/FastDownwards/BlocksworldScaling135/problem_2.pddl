(define (problem blocks-multiagent-problem)
  (:domain blocks-multi-agent)

  (:objects
    I A E M N B G D C J K F L H - block
  )

  (:init
    (vowel I)
    (vowel A)
    (vowel E)

    (consonant M) (consonant N) (consonant B) (consonant G) (consonant D)
    (consonant C) (consonant J) (consonant K) (consonant F) (consonant L) (consonant H)

    (on I table)
    (on N I)
    (on D N)
    (on A D)
    (on J A)
    (on K J)
    (on F K)
    (on H F)

    (on M table)
    (on B M)
    (on G B)
    (on C G)
    (on E C)
    (on L E)

    (clear H)
    (clear L)

    (clear table)
  )

  (:goal (and
    (on N table)
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
    (clear A)
  ))
)