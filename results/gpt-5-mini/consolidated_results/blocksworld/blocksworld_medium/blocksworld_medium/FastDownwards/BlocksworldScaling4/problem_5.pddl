(define (problem blocks-world-problem)
  (:domain blocks-world)
  (:objects
    red orange blue yellow - block
    s0 s1 s2 s3 s4 s5 s6 - stage
  )
  (:init
    ;; initial world facts from the specification
    (handempty)
    (clear red)
    (clear orange)
    (on red yellow)
    (on orange blue)
    (ontable blue)
    (ontable yellow)

    ;; initial stage and strict successor chain (enforces contiguous stage progression)
    (at-stage s0)
    (succ s0 s1)
    (succ s1 s2)
    (succ s2 s3)
    (succ s3 s4)
    (succ s4 s5)
    (succ s5 s6)

    ;; pairwise inequality facts used by action schemas to forbid self-stacking
    (neq red orange) (neq red blue) (neq red yellow)
    (neq orange red) (neq orange blue) (neq orange yellow)
    (neq blue red) (neq blue orange) (neq blue yellow)
    (neq yellow red) (neq yellow orange) (neq yellow blue)
  )
  (:goal (and
    (on red yellow)
    (on yellow orange)
    (at-stage s6)
  ))
)