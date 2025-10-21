(define (problem multi_agent_blocks_problem)
  (:domain blocks_multi_agent)
  (:objects
    A B C D E F G H I J K - block
  )

  (:init
    ;; Initial stacks (unified naming: uppercase)
    ;; Stack 1: B (table) <- K on B <- H on K
    (ontable B)
    (on K B)
    (on H K)

    ;; Stack 2: G (table) <- J on G <- A on J <- C on A <- I on C <- F on I <- D on F
    (ontable G)
    (on J G)
    (on A J)
    (on C A)
    (on I C)
    (on F I)
    (on D F)

    ;; E on the table
    (ontable E)

    ;; Clear (top) blocks
    (clear H)
    (clear D)
    (clear E)

    ;; Vowel blocks (movable by vowel-agent)
    (vowel A)
    (vowel E)
    (vowel I)

    ;; Consonant blocks (movable by consonant-agent)
    (consonant B)
    (consonant C)
    (consonant D)
    (consonant F)
    (consonant G)
    (consonant H)
    (consonant J)
    (consonant K)
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