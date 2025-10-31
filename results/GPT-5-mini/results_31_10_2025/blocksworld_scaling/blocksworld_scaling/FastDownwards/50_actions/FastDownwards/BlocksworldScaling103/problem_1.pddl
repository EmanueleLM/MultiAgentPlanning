(define (problem stacking-orchestration)
  (:domain BlocksworldScaling103)
  (:objects
    A B C D E F G H I J - block
  )
  (:init
    ;; type membership (vowels vs consonants)
    (vowel A) (vowel E) (vowel I)
    (consonant B) (consonant C) (consonant D) (consonant F) (consonant G) (consonant H) (consonant J)

    ;; initial stacks
    ;; Stack1: bottom E, then G, then F, then A, then J (top)
    (ontable E)
    (on G E)
    (on F G)
    (on A F)
    (on J A)

    ;; Stack2: bottom I then C (top)
    (ontable I)
    (on C I)

    ;; Stack3: bottom D then B then H (top)
    (ontable D)
    (on B D)
    (on H B)

    ;; clear: tops of each stack
    (clear J)
    (clear C)
    (clear H)

    ;; agents start with empty hands
    (handempty vowel_agent)
    (handempty consonant_agent)
  )

  (:goal (and
    ;; final single stack: top A, then B, C, D, E, F, G, H, I, J on table
    (ontable J)
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