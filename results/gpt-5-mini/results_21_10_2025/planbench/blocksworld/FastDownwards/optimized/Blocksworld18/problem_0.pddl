(define (problem multi_agent_stacking)
  (:domain multi_agent_blocks)
  (:objects
    A B C D E F G H I J K L - block
  )

  (:init
    ;; Stack1: bottom C (on table), L on C, A on L, K on A, J on K
    (ontable C)
    (on L C)
    (on A L)
    (on K A)
    (on J K)

    ;; Stack2: bottom D (on table), B on D, E on B, H on E
    (ontable D)
    (on B D)
    (on E B)
    (on H E)

    ;; Stack3: bottom F (on table), G on F, I on G
    (ontable F)
    (on G F)
    (on I G)

    ;; Clear (tops of stacks)
    (clear J)
    (clear H)
    (clear I)

    ;; Vowel-agent movable blocks
    (vowel A)
    (vowel E)
    (vowel I)

    ;; Consonant-agent movable blocks
    (consonant B) (consonant C) (consonant D)
    (consonant F) (consonant G) (consonant H)
    (consonant J) (consonant K) (consonant L)
  )

  ;; Global stacking goal: A on B, B on C, C on D, D on E, E on F, F on G,
  ;; G on H, H on I, I on J, J on K, K on L, L on the table.
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