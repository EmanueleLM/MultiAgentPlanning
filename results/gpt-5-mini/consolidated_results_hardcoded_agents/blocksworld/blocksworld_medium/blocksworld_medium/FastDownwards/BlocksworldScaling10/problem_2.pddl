(define (problem blocksworld-scaling10-problem)
  (:domain blocksworld-scaling10-domain)
  (:objects
    red blue yellow orange - block
    s0 s1 s2 s3 s4 s5 s6 - stage
  )
  (:init
    (on red blue)
    (on blue yellow)
    (on yellow orange)
    (ontable orange)
    (clear red)
    (handempty)
    (at-stage s0)
    (next s0 s1)
    (next s1 s2)
    (next s2 s3)
    (next s3 s4)
    (next s4 s5)
    (next s5 s6)
  )
  (:goal
    (and
      (on yellow red)
    )
  )
)