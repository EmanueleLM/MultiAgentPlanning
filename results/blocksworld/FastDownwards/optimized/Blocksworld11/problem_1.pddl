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

    (ontable A) (clear A)
    (ontable B) (clear B)
    (ontable C) (clear C)
    (ontable D) (clear D)
    (ontable E) (clear E)
    (ontable F) (clear F)
    (ontable G) (clear G)
    (ontable H) (clear H)
    (ontable I) (clear I)
    (ontable J) (clear J)
    (ontable K) (clear K)

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