(define (problem blocksworld-s2-staged)
  (:domain blocksworld)
  (:objects
    blue yellow orange red - block
    s0 s1 s2 s3 s4 s5 s6 - stage
  )
  (:init
    (clear red)
    (clear blue)
    (handempty)
    (on red yellow)
    (on yellow orange)
    (ontable blue)
    (ontable orange)
    (atstage s0)
    (next s0 s1)
    (next s1 s2)
    (next s2 s3)
    (next s3 s4)
    (next s4 s5)
    (next s5 s6)
  )
  (:goal (and
    (on blue orange)
    (on yellow red)
  ))
)