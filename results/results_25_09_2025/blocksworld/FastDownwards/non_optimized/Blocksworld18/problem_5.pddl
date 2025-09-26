(define (problem multiagent-blocks-problem)
  (:domain blocks-multiagent)

  (:objects
    A B C D E F G H I J K L - block
    vowel_agent consonant_agent orchestrator - agent
  )

  (:init
    ;; stacks:
    (on L C)
    (on A L)
    (on K A)
    (on J K)
    (ontable C)

    (on B D)
    (on E B)
    (on H E)
    (ontable D)

    (on G F)
    (on I G)
    (ontable F)

    ;; clear/top blocks
    (clear J)
    (clear H)
    (clear I)

    ;; types of blocks
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
    (consonant L)

    ;; agents
    (is-vowel-agent vowel_agent)
    (is-consonant-agent consonant_agent)
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