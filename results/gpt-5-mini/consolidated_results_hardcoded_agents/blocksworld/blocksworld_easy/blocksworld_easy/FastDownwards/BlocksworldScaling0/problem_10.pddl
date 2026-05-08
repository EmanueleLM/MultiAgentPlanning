(define (problem move-yellow-on-orange)
  (:domain orchestrator-blocks)
  (:objects
    orange yellow blue red - block
    s0 s1 s2 s3 - stage
  )
  (:init
    (on blue red)
    (on orange blue)
    (ontable red)
    (ontable yellow)
    (clear orange)
    (clear yellow)
    (handempty)
    (atstage s0)
    (next s0 s1)
    (next s1 s2)
    (next s2 s3)
  )
  (:goal (and
    (on blue red)
    (on yellow orange)
  ))
)