(define (problem blocks-world-problem)
  (:domain blocks-world)
  (:objects
    red orange blue yellow - block
    s0 s1 s2 s3 s4 s5 s6 - stage
  )
  (:init
    (handempty)
    (clear red)
    (clear orange)
    (on red yellow)
    (on orange blue)
    (ontable blue)
    (ontable yellow)

    (at-stage s0)
    (succ s0 s1)
    (succ s1 s2)
    (succ s2 s3)
    (succ s3 s4)
    (succ s4 s5)
    (succ s5 s6)

    ;; explicit inequality facts to prevent actions with identical block parameters
    (diff red orange) (diff red blue) (diff red yellow)
    (diff orange red) (diff orange blue) (diff orange yellow)
    (diff blue red) (diff blue orange) (diff blue yellow)
    (diff yellow red) (diff yellow orange) (diff yellow blue)
  )
  (:goal (and
    (on red yellow)
    (on yellow orange)
    (at-stage s6)
  ))
)