(define (problem BlocksworldScaling16-problem)
  (:domain BlocksworldScaling16)

  (:objects
    J M B H I G E D F L A C K - block
  )

  (:init
    ;; initial stacks
    (ontable J)
    (on G J)
    (on E G)
    (on D E)
    (on K D)

    (ontable M)
    (on B M)
    (on I B)
    (on F I)
    (on C F)

    (ontable H)
    (on A H)

    (ontable L)

    ;; clear = top-of-stack blocks
    (clear K)
    (clear C)
    (clear A)
    (clear L)

    ;; agent capability facts
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
    (consonant M)
  )

  (:goal (and
    ;; final tower (top down): A on B on C on D on E on F on G on H on I on J on K on L on M (M on table)
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
    (on L M)
    (ontable M)
  ))
)