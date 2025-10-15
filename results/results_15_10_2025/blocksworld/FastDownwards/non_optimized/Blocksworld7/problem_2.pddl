(define (problem combined_rearrangement_problem)
  (:domain combined_agents)
  (:objects
    A B C D E F G H I J K L - block
    vowel_agent consonant_agent orchestrator - agent
  )
  (:init
    ;; block types
    (vowel A) (vowel E) (vowel I)
    (consonant B) (consonant C) (consonant D) (consonant F) (consonant G) (consonant H) (consonant J) (consonant K) (consonant L)

    ;; agent roles
    (is-vowel-agent vowel_agent)
    (is-consonant-agent consonant_agent)
    (is-orchestrator orchestrator)

    ;; agents are initially free-handed
    (handempty vowel_agent)
    (handempty consonant_agent)
    (handempty orchestrator)

    ;; initial stacks as given: [['H','B','C','E','F'], ['L','J','I'], ['K','D','G'], ['A']]
    (ontable H) (on B H) (on C B) (on E C) (on F E)
    (ontable L) (on J L) (on I J)
    (ontable K) (on D K) (on G D)
    (ontable A)

    ;; clear/top blocks
    (clear F) (clear I) (clear G) (clear A)
  )
  (:goal
    (and
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
      (ontable L)
    )
  )
)