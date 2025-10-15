(define (problem blocks-multiagent-problem)
  (:domain blocks-multiagent)
  (:objects
    A B C D E F G H I J K L M N - block
  )
  (:init
    (vowel A) (vowel E) (vowel I)
    (consonant B) (consonant C) (consonant D) (consonant F) (consonant G)
    (consonant H) (consonant J) (consonant K) (consonant L) (consonant M) (consonant N)

    (ontable B)
    (on D B)
    (on C D)

    (ontable G)
    (on L G)
    (on K L)
    (on F K)
    (on H F)
    (on E H)

    (ontable I)
    (on M I)
    (on J M)
    (on A J)
    (on N A)

    (clear C)
    (clear E)
    (clear N)

    (handempty-vowel)
    (handempty-consonant)
  )
  (:goal
    (and
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