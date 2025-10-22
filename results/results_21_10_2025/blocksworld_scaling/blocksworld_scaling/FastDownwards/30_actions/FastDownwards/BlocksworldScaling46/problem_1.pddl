(define (problem BlocksworldScaling46-problem)
  (:domain BlocksworldScaling46)
  (:objects
    A B C D E F G H I J K L table
  )
  (:init
    ;; initial on relations (from the specification)
    (on C D)
    (on I J)
    (on B I)
    (on H B)
    (on K E)
    (on L K)
    (on G L)
    (on F G)

    ;; which blocks are on the table initially
    (ontable D)
    (ontable J)
    (ontable E)
    (ontable A)

    ;; clear (top) blocks initially
    (clear C)
    (clear H)
    (clear F)
    (clear A)

    ;; type facts for agents' permissions
    (vowel A) (vowel E) (vowel I)
    (consonant B) (consonant C) (consonant D) (consonant F)
    (consonant G) (consonant H) (consonant J) (consonant K) (consonant L)

    ;; both agents' hands start free
    (free-vowel-hand)
    (free-cons-hand)
  )
  (:goal
    (and
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
    )
  )
)