(define (problem blocks-multiagent-problem)
  (:domain blocks-multiagent)

  (:objects
    A B C D E F G H I J K L M - block
    vowel_agent consonant_agent orchestrator - agent
  )

  (:init
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

    (consonant-agent consonant_agent)
    (vowel-agent vowel_agent)

    (ontable G)
    (on L G)
    (on J L)
    (on B J)

    (ontable H)
    (on C H)
    (on M C)

    (ontable I)
    (on D I)
    (on F D)

    (ontable A)
    (on K A)
    (on E K)

    (clear B)
    (clear M)
    (clear F)
    (clear E)

    (handempty consonant_agent)
    (handempty vowel_agent)
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
    (ontable M)
  ))
)