(define (problem blocks-problem)
  (:domain blocks-domain)
  (:objects
    red yellow orange blue - block
    s0 s1 s2 s3 s4 s5 s6 - stage
  )

  (:init
    (on orange blue)
    (on yellow orange)
    (on-table red)
    (on-table blue)

    (clear red)
    (clear yellow)

    (handempty)

    (at-stage s0)
    (succ s0 s1)
    (succ s1 s2)
    (succ s2 s3)
    (succ s3 s4)
    (succ s4 s5)
    (succ s5 s6)
  )

  (:goal (and
    (on red blue)
    (on orange yellow)
    (on yellow red)
  ))
)