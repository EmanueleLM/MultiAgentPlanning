(define (problem multi-agent-blocksworld-problem)
  (:domain multi-agent-blocksworld)

  (:objects
    A B C D E F G H I J K - block
  )

  (:init
    (ontable E)
    (on D E)

    (ontable A)
    (on G A)
    (on K G)
    (on H K)
    (on F H)

    (ontable J)
    (on B J)
    (on I B)
    (on C I)

    (clear D)
    (clear F)
    (clear C)

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
  )

  (:goal (and
    (ontable K)
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
  ))
)