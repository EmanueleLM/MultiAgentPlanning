(define (problem stack_goal)
  (:domain blocks_agents)
  (:objects
    ; blocks: vowels and consonants typed appropriately
    A E I - vowel
    B C D F G H J K - consonant

    ; agents: one vowel agent and one consonant agent
    vowel1 - vowel_agent
    consonant1 - consonant_agent
  )

  (:init
    ; Initially conservatively assume every block is on the table and clear
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

    ; Both agents start with empty hands
    (handempty vowel1)
    (handempty consonant1)
  )

  (:goal (and
    ; K must be on the table
    (ontable K)
    ; Above K (from bottom to top): J I H G F E D C B A with A at the top
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