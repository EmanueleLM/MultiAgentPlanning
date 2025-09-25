(define (problem multi_agent_stacking)
  (:domain multi_agent_blocks)
  (:objects
    A B C D E F G H I J K - block
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

    (is_vowel_agent vowel_agent)
    (is_consonant_agent consonant_agent)

    (ontable F)
    (on H F)
    (on J H)
    (on C J)
    (on E C)
    (on G E)
    (on B G)
    (on A B)

    (ontable D)
    (on K D)
    (on I K)

    (clear A)
    (clear I)
  )
  (:goal
    (and
      (ontable K)
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
)