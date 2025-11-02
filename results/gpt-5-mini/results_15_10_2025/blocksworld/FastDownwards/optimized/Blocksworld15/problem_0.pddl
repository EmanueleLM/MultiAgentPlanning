(define (problem stack-orchestration)
  (:domain multiagent-blocks)
  (:objects
    A B C D E F G H I J K - block
  )

  (:init
    ;; Type membership (agent capabilities)
    (vowel A) (vowel E) (vowel I)
    (consonant B) (consonant C) (consonant D) (consonant F)
    (consonant G) (consonant H) (consonant J) (consonant K)

    ;; Initial stacks:
    ;; Stack1 bottom-to-top: F, H, J, C, E, G, B, A
    (ontable F)
    (on H F)
    (on J H)
    (on C J)
    (on E C)
    (on G E)
    (on B G)
    (on A B)

    ;; Stack2 bottom-to-top: D, K, I
    (ontable D)
    (on K D)
    (on I K)

    ;; Clear (tops of stacks)
    (clear A)
    (clear I)

    ;; Note: All other blocks that have something on them are not marked clear.
  )

  (:goal (and
    ;; Desired final single stack bottom-to-top: K, J, I, H, G, F, E, D, C, B, A
    (ontable K)
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