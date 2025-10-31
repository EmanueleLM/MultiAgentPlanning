(define (problem stack-11-two-agents)
  (:domain two-agent-blocks)
  (:objects
    A B C D E F G H I J K - block
    vowel_agent consonant_agent - agent
  )

  (:init
    ;; Initial stacks (public environment)
    (ontable E)
    (on A E)
    (on J A)
    (on B J)

    (ontable H)
    (on C H)
    (on G C)

    (ontable I)
    (on F I)

    (ontable K)
    (on D K)

    ;; Clear (top) blocks
    (clear B)
    (clear G)
    (clear F)
    (clear D)

    ;; Block labels (vowel vs consonant)
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

    ;; Agent role facts
    (vowel-agent vowel_agent)
    (consonant-agent consonant_agent)
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