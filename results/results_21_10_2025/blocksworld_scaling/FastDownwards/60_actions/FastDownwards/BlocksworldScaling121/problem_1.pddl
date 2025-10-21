(define (problem BlocksworldScaling121-instance)
  (:domain blocksworld-multiagent)

  (:objects
    A B C D E F G H I J K - block
  )

  (:init
    ;; type assignments (vowel / consonant)
    (vowel A) (vowel E) (vowel I)
    (consonant B) (consonant C) (consonant D) (consonant F)
    (consonant G) (consonant H) (consonant J) (consonant K)

    ;; Initial stacking configuration:
    ;; Stack 1 (bottom -> top): A, G, I, E, B, D, F, C
    (ontable A)
    (on G A)
    (on I G)
    (on E I)
    (on B E)
    (on D B)
    (on F D)
    (on C F)

    ;; Stack 2 (bottom -> top): J, H, K
    (ontable J)
    (on H J)
    (on K H)

    ;; Initially only top blocks are clear (C and K)
    (clear C)
    (clear K)

    ;; All other blocks are not clear implicitly (no (clear X) facts)
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
    (ontable K)
  ))
)