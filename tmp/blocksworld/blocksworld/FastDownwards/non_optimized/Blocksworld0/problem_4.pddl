(define (problem combined-blocks-problem)
  (:domain blocks-multiagent-domain)

  (:objects
    A B C D E F G H I J K L - block
    vowel_agent consonant_agent orchestrator - agent
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

    (on A G)
    (on G H)
    (on H L)
    (ontable L)

    (on D C)
    (on C K)
    (on K J)
    (ontable J)

    (on F E)
    (on E B)
    (on B I)
    (ontable I)

    (clear A)
    (clear D)
    (clear F)
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
      (ontable L)
    )
  )

  (:metric minimize (total-cost))
)