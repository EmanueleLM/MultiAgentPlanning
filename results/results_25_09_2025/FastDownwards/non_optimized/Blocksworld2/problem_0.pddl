(define (problem orchestrated-problem)
  (:domain orchestrated-blocks)
  (:objects A B C D E F G H I J - block)

  (:init
    ;; type assignments (combined knowledge)
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

    ;; initial stacking: J bottom on table, then I on J, H on I, G on H, F on G,
    ;; E on F, D on E, C on D, B on C (B is top of this stack). A is on the table alone.
    (ontable J)
    (on I J)
    (on H I)
    (on G H)
    (on F G)
    (on E F)
    (on D E)
    (on C D)
    (on B C)

    (ontable A)

    ;; clear (top) blocks
    (clear B)
    (clear A)
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
    (ontable J)
  ))
)