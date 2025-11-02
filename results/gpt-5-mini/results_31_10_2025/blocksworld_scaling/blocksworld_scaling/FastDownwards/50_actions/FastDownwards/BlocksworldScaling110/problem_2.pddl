(define (problem build-tower)
  (:domain multiagent-blocks)

  (:objects
    A B C D E F G H I J K L M N - block
  )

  (:init
    (vowel A) (vowel E) (vowel I)
    (consonant B) (consonant C) (consonant D) (consonant F)
    (consonant G) (consonant H) (consonant J) (consonant K)
    (consonant L) (consonant M) (consonant N)

    (ontable H)
    (on M H)

    (ontable L)
    (on N L)
    (on B N)
    (on J B)
    (on A J)
    (on F A)
    (on I F)

    (ontable K)
    (on G K)
    (on C G)
    (on D C)
    (on E D)

    (clear M)
    (clear I)
    (clear E)
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