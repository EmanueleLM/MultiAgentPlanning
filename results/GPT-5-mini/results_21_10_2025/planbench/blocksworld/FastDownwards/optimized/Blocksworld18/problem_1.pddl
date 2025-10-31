(define (problem multi_agent_stacking_orchestrated)
  (:domain multi_agent_blocks_orchestrated)
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

  ;; Global stacking goal: L on table, K on L, J on K, I on J, H on I, G on H,
  ;; F on G, E on F, D on E, C on D, B on C, A on B.
  (:goal (and
    (ontable L)
    (on K L)
    (on J K)
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