(define (problem BlocksworldScaling77-problem)
  (:domain BlocksworldScaling77)
  (:objects
    A B C D E F G H I J K L - block
  )

  (:init
    ;; initial stacking
    (ontable A)
    (on D A)
    (on J D)
    (on B J)
    (on F B)

    (ontable L)
    (on E L)
    (on K E)
    (on H K)

    (ontable I)
    (on C I)
    (on G C)

    ;; clear = top blocks
    (clear F)
    (clear H)
    (clear G)

    ;; letter types
    (vowel A)
    (vowel E)
    (vowel I)

    (consonant B)
    (consonant C)
    (consonant D)
    (consonant F)
    (consonant G)
    (consonant H)
    (consonant J)
    (consonant K)
    (consonant L)
  )

  ;; goal: A on B, B on C, C on D, D on E, E on F, F on G, G on H, H on I, I on J, J on K, K on L, L on table
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