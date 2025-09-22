(define (problem two_agent_blocks_problem)
  (:domain two_agent_blocks)
  (:objects
    A B C D E F G H I J - block
  )

  (:init
    ;; Blocks on the table initially
    (ontable H)
    (ontable A)
    (ontable I)
    (ontable E)

    ;; Stacked blocks (top -> under)
    (on G A)
    (on B E)
    (on J H)
    (on C J)
    (on D B)
    (on F C)

    ;; Clear (top) blocks
    (clear G)
    (clear D)
    (clear F)
    (clear I)

    ;; Which blocks each agent may move
    (vowel A)
    (vowel E)
    (vowel I)

    (consonant H)
    (consonant G)
    (consonant B)
    (consonant J)
    (consonant C)
    (consonant D)
    (consonant F)
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
    (ontable J)
  ))
)