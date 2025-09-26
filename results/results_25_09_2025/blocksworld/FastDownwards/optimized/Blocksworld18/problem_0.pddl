(define (problem multiagent-blocks-task)
  (:domain multiagent-blocks)

  (:objects
    A B C D E F G H I J K L - block
    consonant_agent vowel_agent - agent
  )

  (:init
    ;; agent identities
    (agent consonant_agent)
    (agent vowel_agent)

    ;; vowel / consonant labeling
    (vowel A) (vowel E) (vowel I)
    (consonant B) (consonant C) (consonant D) (consonant F)
    (consonant G) (consonant H) (consonant J) (consonant K) (consonant L)

    ;; Initial stacks (as provided by the two agents)
    ;; stack1: bottom C, L on C, A on L, K on A, J on K
    (ontable C)
    (on L C)
    (on A L)
    (on K A)
    (on J K)

    ;; stack2: bottom D, B on D, E on B, H on E
    (ontable D)
    (on B D)
    (on E B)
    (on H E)

    ;; stack3: bottom F, G on F, I on G
    (ontable F)
    (on G F)
    (on I G)

    ;; clear/top-of-stack facts
    (clear J)
    (clear H)
    (clear I)
  )

  ;; Global cooperative goal: a single tall tower A on B on C on D on E on F on G on H on I on J on K on L on the table.
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