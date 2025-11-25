(define (problem blocks-goal-red-yellow-yellow-blue)
  (:domain blocks-world-orchestrator)
  (:objects
    red yellow blue orange - block
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 - stage
  )
  (:init
    (ontable blue)
    (on orange blue)
    (on red orange)
    (on yellow red)
    (clear yellow)
    (handempty)
    (at-stage s0)
    (next s0 s1)
    (next s1 s2)
    (next s2 s3)
    (next s3 s4)
    (next s4 s5)
    (next s5 s6)
    (next s6 s7)
    (next s7 s8)
    (next s8 s9)
    (next s9 s10)
  )
  (:goal
    (and
      (on red yellow)
      (on yellow blue)
      (at-stage s10)
    )
  )
)