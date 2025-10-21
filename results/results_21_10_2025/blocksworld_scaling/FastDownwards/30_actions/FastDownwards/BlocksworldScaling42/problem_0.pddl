(define (problem blocks-multiagent-problem)
  (:domain blocks-multiagent)

  (:objects
    A E - block
    B C D - block
    vowel_agent consonant_agent - agent
  )

  (:init
    ;; initial stacking
    (on A B)
    (ontable B)
    (clear A)

    (ontable C)
    (clear C)

    (ontable D)
    (clear D)

    (ontable E)
    (clear E)

    ;; type labels: vowels and consonants
    (is-vowel A)
    (is-vowel E)
    (is-consonant B)
    (is-consonant C)
    (is-consonant D)

    ;; agent availability and hand state
    (can-move-vowel vowel_agent)
    (can-move-consonant consonant_agent)
    (handempty vowel_agent)
    (handempty consonant_agent)
  )

  (:goal (and
    ;; goal configuration (strict constraints)
    (on A C)
    (on C B)
    (ontable B)
    (on E D)
    (ontable D)
  ))
)