(define (problem blocksworld-multiagent-problem)
  (:domain blocksworld-multiagent)

  (:objects
    A B C D E F G H I J K L M - block
  )

  (:init
    (on L TABLE)
    (on G L)
    (on E G)
    (on C E)
    (on H C)

    (on F TABLE)
    (on I F)
    (on D I)
    (on B D)
    (on M B)
    (on A M)
    (on K A)
    (on J K)

    (clear H)
    (clear J)

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