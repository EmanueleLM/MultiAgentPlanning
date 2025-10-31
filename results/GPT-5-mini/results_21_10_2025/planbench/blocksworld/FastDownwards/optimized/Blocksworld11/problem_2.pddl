(define (problem stack-A-on-B-to-K-with-slots)
  (:domain multi-agent-blocks-with-slots)
  (:objects
    A B C D E F G H I J K - block
    vowel_agent consonant_agent - agent
    s1 s2 - slot
  )

  (:init
    (ontable J s1)
    (on K J)
    (on G K)
    (on A G)
    (on F A)
    (on B F)
    (on D B)
    (on C D)

    (ontable E s2)
    (on H E)
    (on I H)

    (clear C)
    (clear I)

    (handempty vowel_agent)
    (handempty consonant_agent)

    (vowel-agent vowel_agent)
    (consonant-agent consonant_agent)

    (can-move vowel_agent A)
    (can-move vowel_agent E)
    (can-move vowel_agent I)

    (can-move consonant_agent J)
    (can-move consonant_agent K)
    (can-move consonant_agent G)
    (can-move consonant_agent F)
    (can-move consonant_agent B)
    (can-move consonant_agent D)
    (can-move consonant_agent C)
    (can-move consonant_agent H)
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
    (ontable K s1)
  ))
)