(define (problem multi_agent_block_problem_v2)
  (:domain multi_agent_blocks_v2)

  (:objects
    A B C D E F G H I J K L - block
    vowel_agent consonant_agent - agent
  )

  (:init
    ;; Agent identities
    (is_vowel_agent vowel_agent)
    (is_consonant_agent consonant_agent)

    ;; Both agents start with empty hands
    (handempty vowel_agent)
    (handempty consonant_agent)

    ;; Block classifications (who may move which blocks)
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

    ;; Initial stacks (public information)
    ;; Stack 1: I (table) - L - F - G - C (top)
    (ontable I)
    (on L I)
    (on F L)
    (on G F)
    (on C G)

    ;; Stack 2: B (table) - A - H - D - E - K (top)
    (ontable B)
    (on A B)
    (on H A)
    (on D H)
    (on E D)
    (on K E)

    ;; Stack 3: J (table)
    (ontable J)

    ;; Only the top blocks are clear at start (and blocks on the table that are top)
    (clear C)
    (clear K)
    (clear J)
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