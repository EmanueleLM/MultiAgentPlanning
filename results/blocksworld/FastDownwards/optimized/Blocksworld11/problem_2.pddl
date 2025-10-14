(define (problem multi-agent-stack-A-on-B-on-C-...-K)
  (:domain multi-agent-blocks)
  (:objects
    vowel_agent consonant_agent - agent
    A B C D E F G H I J K - block
  )

  (:init
    (vowel-agent vowel_agent)
    (consonant-agent consonant_agent)

    (vowel-block A)
    (vowel-block E)
    (vowel-block I)

    (consonant-block B)
    (consonant-block C)
    (consonant-block D)
    (consonant-block F)
    (consonant-block G)
    (consonant-block H)
    (consonant-block J)
    (consonant-block K)

    (on K J)
    (on G K)
    (on A G)
    (on F A)
    (on B F)
    (on D B)
    (on C D)
    (on H E)
    (on I H)

    (ontable J)
    (ontable E)

    (clear C)
    (clear I)

    (handempty vowel_agent)
    (handempty consonant_agent)
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
    (ontable K)
  ))
)