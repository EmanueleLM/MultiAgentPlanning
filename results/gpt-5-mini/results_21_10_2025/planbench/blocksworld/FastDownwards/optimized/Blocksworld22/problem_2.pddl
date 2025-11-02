(define (problem multiagent-stack-goal-22)
  (:domain multiagent-blocksworld22)

  (:objects
    A B C D E F G H I J - block
    vowel_agent consonant_agent orchestrator - agent
  )

  (:init
    (is-agent vowel_agent)
    (is-agent consonant_agent)
    (is-agent orchestrator)

    (vowel A)
    (vowel E)
    (vowel I)
    (can-move vowel_agent A)
    (can-move vowel_agent E)
    (can-move vowel_agent I)

    (consonant B)
    (consonant C)
    (consonant D)
    (consonant F)
    (consonant G)
    (consonant H)
    (consonant J)
    (can-move consonant_agent B)
    (can-move consonant_agent C)
    (can-move consonant_agent D)
    (can-move consonant_agent F)
    (can-move consonant_agent G)
    (can-move consonant_agent H)
    (can-move consonant_agent J)

    (ontable A)
    (on J A)
    (on I J)
    (on G I)
    (on B G)

    (ontable C)
    (on D C)

    (ontable H)
    (on F H)

    (ontable E)

    (clear B)
    (clear D)
    (clear F)
    (clear E)
  )

  (:goal (and
    (ontable J)
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