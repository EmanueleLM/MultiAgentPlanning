(define (problem BlocksworldScaling10-problem-1)
  (:domain BlocksworldScaling10)
  (:objects
    red yellow blue orange - block
    s0 s1 s2 s3 s4 - stage
  )
  (:init
    (on red blue)
    (on yellow orange)
    (ontable blue)
    (ontable orange)
    (clear red)
    (clear yellow)
    (handempty)
    (at s0)
    (succ s0 s1)
    (succ s1 s2)
    (succ s2 s3)
    (succ s3 s4)
  )
  (:goal (on orange red))
)