(define (problem orchestrated-problem)
  (:domain orchestrated-blocks)
  (:objects A B C D E F G H I J K L - block)

  (:init
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

    ;; initial stacks per human specification:
    ;; stack1: L (ontable) <- F <- C (top)
    (ontable L)
    (on F L)
    (on C F)

    ;; stack2: K (ontable) <- H <- D <- B <- J <- E (top)
    (ontable K)
    (on H K)
    (on D H)
    (on B D)
    (on J B)
    (on E J)

    ;; stack3: G on table (alone)
    (ontable G)

    ;; stack4: I (ontable) <- A (top)
    (ontable I)
    (on A I)

    ;; clear predicates: only top blocks are clear
    (clear C)
    (clear E)
    (clear G)
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
    (on J K)
    (on K L)
    (ontable L)
  ))
)