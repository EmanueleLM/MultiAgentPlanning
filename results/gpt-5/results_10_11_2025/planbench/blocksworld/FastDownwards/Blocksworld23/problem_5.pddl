(define (problem blocksworld-scn-A-staged)
  (:domain blocksworld_staged)
  (:objects
    red blue yellow orange - block
    s0 s1 s2 s3 s4 s5 s6 s7 s8 - stage
  )
  (:init
    (clear red)
    (handempty)
    (on red blue)
    (on blue yellow)
    (on yellow orange)
    (ontable orange)

    (atstage s0)
    (next s0 s1)
    (next s1 s2)
    (next s2 s3)
    (next s3 s4)
    (next s4 s5)
    (next s5 s6)
    (next s6 s7)
    (next s7 s8)
  )
  (:goal
    (and
      (on orange red)
      (on yellow blue)
    )
  )
)