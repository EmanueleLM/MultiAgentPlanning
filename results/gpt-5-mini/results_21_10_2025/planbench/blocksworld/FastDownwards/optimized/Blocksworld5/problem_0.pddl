(define (problem multi_agent_block_problem)
  (:domain multi_agent_blocks)

  (:objects
    A B C D E F G H I J K L - block
  )

  (:init
    ;; Which blocks are vowels (movable by vowel agent)
    (vowel A)
    (vowel E)
    (vowel I)

    ;; Which blocks are consonants (movable by consonant agent)
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

    ;; Clear (top) blocks initially
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