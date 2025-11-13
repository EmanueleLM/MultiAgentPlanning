(define (problem blocksworld4-s1)
  (:domain blocksworld-staged)
  (:objects
    red blue orange yellow - block
    s0 s1 s2 - stage
  )
  (:init
    (clear orange)
    (clear yellow)
    (handempty)
    (on blue red)
    (on orange blue)
    (ontable red)
    (ontable yellow)
    (at s0)
    (next s0 s1)
    (next s1 s2)
  )
  (:goal (and
    (on blue red)
    (on yellow orange)
    (at s2)
  ))
)