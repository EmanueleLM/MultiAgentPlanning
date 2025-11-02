(define (problem multiagent-blocks-global)
  (:domain multiagent-blocks-combined)
  (:objects
    A B C D E F G H I J K L M N - block
    vowel_agent consonant_agent orchestrator - agent
  )

  (:init
    (ontable I)
    (on C I)
    (on H C)
    (on G H)
    (on A G)
    (on N A)
    (on K N)

    (ontable D)
    (on F D)
    (on E F)
    (on M E)
    (on L M)
    (on B L)
    (on J B)

    (clear K)
    (clear J)

    (is-vowel A)
    (is-vowel E)
    (is-vowel I)

    (is-consonant B)
    (is-consonant C)
    (is-consonant D)
    (is-consonant F)
    (is-consonant G)
    (is-consonant H)
    (is-consonant J)
    (is-consonant K)
    (is-consonant L)
    (is-consonant M)
    (is-consonant N)

    (handempty vowel_agent)
    (handempty consonant_agent)
  )

  (:goal (and
    (ontable N)
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
  ))
)