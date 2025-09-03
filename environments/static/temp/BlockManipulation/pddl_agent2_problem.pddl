(define (problem block-arrangement)
  (:domain block-manipulation)
  (:objects A B C O)
  (:init
    (block A) (block B) (block C) (block O)
    (ontable A) (ontable C) (ontable O)
    (on B A)
    (clear B) (clear C) (clear O)
  )
  (:goal
    (and
      (ontable A)
      (ontable B)
      (on C O)
      (on O B)
    )
  )
)