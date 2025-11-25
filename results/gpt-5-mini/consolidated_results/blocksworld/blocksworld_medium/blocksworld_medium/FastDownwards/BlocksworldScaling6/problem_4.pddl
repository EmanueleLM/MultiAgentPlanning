(define (problem BlocksworldScaling6-problem)
  (:domain BlocksworldScaling6)
  (:objects
    red blue yellow orange - block
    s0 s1 s2 s3 s4 s5 s6 - step
  )
  (:init
    (ontable red)
    (ontable orange)
    (on blue yellow)
    (on yellow orange)
    (clear red)
    (clear blue)
    (handempty)
    (next s0 s1)
    (next s1 s2)
    (next s2 s3)
    (next s3 s4)
    (next s4 s5)
    (next s5 s6)
    (current s0)
  )
  (:goal
    (and
      (on blue red)
      (on orange blue)
      (current s6)
    )
  )
)