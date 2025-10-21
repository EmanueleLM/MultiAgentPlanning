(define (problem blocks-problem)
  (:domain blocks-dual-agent)
  (:objects
    A E I - vowel
    B C D F G H J K L - consonant
    vowel_agent - vowel-agent
    consonant_agent - consonant-agent
  )

  (:init
    (ontable B)
    (on A B)
    (on L A)
    (on C L)
    (on E C)

    (ontable I)
    (on G I)
    (on D G)
    (on K D)

    (ontable H)
    (on F H)
    (on J F)

    (clear E)
    (clear K)
    (clear J)

    (handempty vowel_agent)
    (handempty consonant_agent)
  )

  (:goal (and
    (ontable L)
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
    (clear A)
  ))
)