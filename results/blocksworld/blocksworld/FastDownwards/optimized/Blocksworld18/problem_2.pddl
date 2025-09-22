(define (problem multiagent-blocks-task)
  (:domain multiagent-blocks)

  (:objects
    A B C D E F G H I J K L - block
    consonant_agent vowel_agent - agent
  )

  (:init
    ;; agents
    (agent consonant_agent)
    (agent vowel_agent)
    (vowel-agent vowel_agent)
    (consonant-agent consonant_agent)

    ;; vowel / consonant labeling
    (vowel A) (vowel E) (vowel I)
    (consonant B) (consonant C) (consonant D) (consonant F)
    (consonant G) (consonant H) (consonant J) (consonant K) (consonant L)

    ;; Initial stacks (explicit)
    (ontable C)
    (on L C)
    (on A L)
    (on K A)
    (on J K)

    (ontable D)
    (on B D)
    (on E B)
    (on H E)

    (ontable F)
    (on G F)
    (on I G)

    ;; clear/top-of-stack facts
    (clear J)
    (clear H)
    (clear I)
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
    (on K L)
    (ontable L)
  ))
)