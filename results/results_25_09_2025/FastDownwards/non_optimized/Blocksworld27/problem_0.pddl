(define (problem multi_agent_block_stacking)
  (:domain multi_agent_vowel_consonant_blocks)
  (:objects
    A B C D E F G H I J K
  )

  (:init
    ;; Vowel / Consonant classification (consistent combined view)
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

    ;; Initial stacks (mapped to unified uppercase names)
    ;; Stack 1: B (table) <- K <- H (top)
    (ontable B)
    (on K B)
    (on H K)

    ;; Stack 2: G (table) <- J <- A <- C <- I <- F <- D (top)
    (ontable G)
    (on J G)
    (on A J)
    (on C A)
    (on I C)
    (on F I)
    (on D F)

    ;; Stack 3: E on table
    (ontable E)

    ;; Clear (top) blocks
    (clear H)
    (clear D)
    (clear E)
  )

  (:goal (and
    ;; Target chain (global goal):
    ;; A on B on C on D on E on F on G on H on I on J on K on table
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