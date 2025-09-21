(define (problem multiagent-blocks-problem)
  (:domain multi-agent-blocks)
  (:objects
    vowel_agent consonant_agent orchestrator - agent
    A B C D E F G H I J K L M - block
  )
  (:init
    (vowel-agent vowel_agent)
    (consonant-agent consonant_agent)

    (can-move vowel_agent A)
    (can-move vowel_agent E)
    (can-move vowel_agent I)

    (can-move consonant_agent M)
    (can-move consonant_agent H)
    (can-move consonant_agent G)
    (can-move consonant_agent B)
    (can-move consonant_agent L)
    (can-move consonant_agent D)
    (can-move consonant_agent F)
    (can-move consonant_agent C)
    (can-move consonant_agent K)
    (can-move consonant_agent J)

    (vowel A)
    (vowel E)
    (vowel I)

    (consonant M)
    (consonant H)
    (consonant G)
    (consonant B)
    (consonant L)
    (consonant D)
    (consonant F)
    (consonant C)
    (consonant K)
    (consonant J)

    (ontable M)
    (on I M)
    (on K I)
    (on A K)

    (ontable E)
    (on L E)
    (on D L)
    (on F D)
    (on J F)

    (ontable G)
    (on B G)
    (on C B)

    (ontable H)

    (clear A)
    (clear J)
    (clear C)
    (clear H)

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