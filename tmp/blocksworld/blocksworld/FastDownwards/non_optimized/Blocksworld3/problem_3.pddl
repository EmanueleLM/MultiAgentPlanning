(define (problem multi_agent_block_task)
  (:domain multi_agent_blocks)
  (:objects A B C D E F G H I J - block)

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

    (ontable C)
    (ontable B)

    (on I C)
    (on F I)
    (on J F)

    (on D B)
    (on A D)
    (on E A)
    (on G E)
    (on H G)

    (clear J)
    (clear H)

    (handempty-vowel)
    (handempty-consonant)
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
      (ontable J)
    )
  )
)