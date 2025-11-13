(define (problem case_b)
  (:domain blocks-case-b)
  (:objects
    b1 b2 b3 - block
  )
  (:init
    (handempty)
    (clear b3)
    (on b3 b2)
    (on b2 b1)
    (ontable b1)
  )
  (:goal
    (and
      (ontable b3)
      (on b2 b3)
      (on b1 b2)
      (clear b1)
      (handempty)
    )
  )
)