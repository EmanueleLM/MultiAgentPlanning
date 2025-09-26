(define (problem dual-agent-blocks-problem)
  (:domain dual-agent-blocks)
  (:objects
    A B C D E F G I - block
    S1 S2 S3 - stack
  )

  (:init
    ;; block types
    (vowel A) (vowel E) (vowel I)
    (consonant B) (consonant C) (consonant D) (consonant F) (consonant G)

    ;; stacks present: S1 and S2 used, S3 free (enforces max 3 stacks)
    (stack-used S1) (stack-used S2) (stack-free S3)

    ;; initial stack layout (bottom -> top)
    (ontable D S1) (on C D) (on B C) (on A B)
    (ontable E S2) (on G E) (on I G) (on F I)

    ;; clear/top blocks
    (clear A)
    (clear F)

    ;; hands empty
    (handempty-va)
    (handempty-ca)
  )

  (:goal (and
    ;; target layout: S1 bottom-to-top F, C, I, G
    (ontable F S1) (on C F) (on I C) (on G I)
    ;; target layout: S2 bottom-to-top A, B, D, E
    (ontable A S2) (on B A) (on D B) (on E D)
    ;; ensure stacks used reflect goal (S3 remains free)
    (stack-used S1) (stack-used S2) (stack-free S3)
  ))
)