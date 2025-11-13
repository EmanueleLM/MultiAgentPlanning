(define (problem blocksworld-scn-B-staged)
  (:domain blocksworld_staged)
  (:objects
    red blue yellow orange - block
    s0 s1 s2 s3 s4 - stage
  )
  (:init
    (clear orange)
    (clear yellow)
    (handempty)
    (on blue red)
    (on yellow blue)
    (ontable red)
    (ontable orange)
    (atstage s0)
    (next s0 s1)
    (next s1 s2)
    (next s2 s3)
    (next s3 s4)
  )
  (:goal
    (and
      (on blue yellow)
    )
  )
)