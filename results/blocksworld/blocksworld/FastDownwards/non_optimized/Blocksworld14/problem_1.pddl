(define (problem stacking-multiagent-problem)
  (:domain stacking-multiagent)
  (:objects
    A B C D E F G H I J K L M N
    vowel_agent consonant_agent orchestrator
  )
  (:init
    (vowel-agent vowel_agent)
    (consonant-agent consonant_agent)

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

    (ontable L)
    (ontable K)

    (on M L)
    (on A M)
    (on E A)
    (on N E)
    (on F N)
    (on B F)

    (on H K)
    (on C H)
    (on G C)
    (on J G)
    (on I J)
    (on D I)

    (clear B)
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
    (ontable N)
  ))
)