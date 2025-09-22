(define (problem combined-multiagent-tower)
  (:domain combined-blocks)

  (:objects
    A B C D E F G H I J K L M N - block
    vowel_agent consonant_agent - agent
  )

  (:init
    (agent vowel_agent)
    (agent consonant_agent)

    (vowel A) (vowel E) (vowel I)
    (consonant B) (consonant C) (consonant D) (consonant F)
    (consonant G) (consonant H) (consonant J) (consonant K)
    (consonant L) (consonant M) (consonant N)

    (can-manip vowel_agent A) (can-manip vowel_agent E) (can-manip vowel_agent I)
    (can-manip consonant_agent B) (can-manip consonant_agent C) (can-manip consonant_agent D)
    (can-manip consonant_agent F) (can-manip consonant_agent G) (can-manip consonant_agent H)
    (can-manip consonant_agent J) (can-manip consonant_agent K) (can-manip consonant_agent L)
    (can-manip consonant_agent M) (can-manip consonant_agent N)

    (ontable I)
    (on C I)
    (on H C)
    (on G H)
    (on A G)
    (on N A)
    (on K N)
    (clear K)

    (ontable D)
    (on F D)
    (on E F)
    (on M E)
    (on L M)
    (on B L)
    (on J B)
    (clear J)

    (handempty consonant_agent)
    (handempty vowel_agent)
  )

  (:goal
    (and
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
    )
  )

  (:metric minimize (total-cost))
)