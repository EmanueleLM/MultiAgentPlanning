(define (problem multiagent-blocks-problem)
  (:domain multiagent-blocks)
  (:objects
    A B C D E F G H I J - block
    vowel_agent consonant_agent orchestrator - agent
  )
  (:init
    ;; block type membership
    (vowel A) (vowel E) (vowel I)
    (consonant B) (consonant C) (consonant D) (consonant F) (consonant G) (consonant H) (consonant J)

    ;; agent roles
    (is-vowel-agent vowel_agent)
    (is-consonant-agent consonant_agent)
    (is-orchestrator orchestrator)

    ;; initial stacks (topology)
    (ontable A)
    (on J A)
    (on I J)
    (on G I)
    (on B G)

    (ontable C)
    (on D C)

    (ontable H)
    (on F H)

    (ontable E)

    ;; clear facts for top blocks
    (clear B)
    (clear D)
    (clear F)
    (clear E)
  )
  (:goal (and
    (ontable J)
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