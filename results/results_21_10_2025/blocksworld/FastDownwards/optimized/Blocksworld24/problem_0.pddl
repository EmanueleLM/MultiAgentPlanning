(define (problem multi_agent_blocks_problem)
  (:domain multi_agent_blocks)
  (:objects
    A B C D E F G H I J K L M N - block
  )
  (:init
    ;; Agent classifications
    (vowel A) (vowel E) (vowel I)
    (consonant B) (consonant C) (consonant D) (consonant F)
    (consonant G) (consonant H) (consonant J) (consonant K)
    (consonant L) (consonant M) (consonant N)

    ;; Initial stacks (shared world state)
    ;; Stack1: bottom B, K on B, F on K, M on F, L on M, I on L (I is top)
    (ontable B)
    (on K B)
    (on F K)
    (on M F)
    (on L M)
    (on I L)

    ;; Stack2: bottom G, N on G, D on N, A on D (A is top)
    (ontable G)
    (on N G)
    (on D N)
    (on A D)

    ;; Stack3: bottom E, C on E, H on C (H is top)
    (ontable E)
    (on C E)
    (on H C)

    ;; Stack4: J on table (J is top)
    (ontable J)

    ;; Clear (tops of stacks)
    (clear I)
    (clear A)
    (clear H)
    (clear J)

    ;; Both agents start with empty hands (distinct agent hands)
    (handempty-v)
    (handempty-c)
  )

  ;; Global goal: final stacked configuration top-to-bottom A B C D E F G H I J K L M N with N on the table
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
    (on L M)
    (on M N)
    (ontable N)
  ))
)