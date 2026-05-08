(define (problem blocks-instance-3-with-time)
  (:domain blocks-world-with-time)
  (:objects
    red blue yellow orange - block
    s0 s1 s2 s3 s4 s5 s6 - step
  )
  (:init
    (on red yellow)
    (on yellow orange)
    (ontable blue)
    (ontable orange)
    (clear red)
    (clear blue)
    (handempty)
    (now s0)
    (succ s0 s1)
    (succ s1 s2)
    (succ s2 s3)
    (succ s3 s4)
    (succ s4 s5)
    (succ s5 s6)
  )
  (:goal (and
    (now s6)
    (on blue orange)
    (on yellow red)
  ))
)