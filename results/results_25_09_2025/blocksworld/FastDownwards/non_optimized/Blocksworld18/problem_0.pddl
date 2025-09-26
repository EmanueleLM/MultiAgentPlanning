(define (problem multiagent-blocks-problem)
  (:domain blocks-multiagent)

  (:objects
    A B C D E F G H I J K L - block
  )

  (:init
    ;; initial stacks (consistent with both agents' views)
    ;; stack1: bottom C, L on C, A on L, K on A, J on K
    (on L C)
    (on A L)
    (on K A)
    (on J K)
    (ontable C)

    ;; stack2: bottom D, B on D, E on B, H on E
    (on B D)
    (on E B)
    (on H E)
    (ontable D)

    ;; stack3: bottom F, G on F, I on G
    (on G F)
    (on I G)
    (ontable F)

    ;; tops (clear)
    (clear J)
    (clear H)
    (clear I)

    ;; agent movement permissions (partition of blocks)
    (vowel A)
    (vowel E)
    (vowel I)

    (consonant B) (consonant C) (consonant D) (consonant F)
    (consonant G) (consonant H) (consonant J) (consonant K)
    (consonant L)
  )

  ;; Target: full tower A on B on C on D on E on F on G on H on I on J on K on L on table
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