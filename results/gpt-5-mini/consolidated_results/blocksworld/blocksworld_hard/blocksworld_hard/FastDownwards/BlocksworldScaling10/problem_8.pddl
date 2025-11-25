(define (problem blocksworld-staged)
  (:domain blocks-singlehanded)

  (:objects
    red orange blue yellow - block
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 - stage
  )

  (:init
    ;; initial block configuration
    (on red orange)
    (on orange blue)
    (on blue yellow)
    (ontable yellow)
    (clear red)
    (handempty)

    ;; explicit stage ordering to enforce sequential progression
    (succ s0 s1)
    (succ s1 s2)
    (succ s2 s3)
    (succ s3 s4)
    (succ s4 s5)
    (succ s5 s6)
    (succ s6 s7)
    (succ s7 s8)
    (succ s8 s9)
    (succ s9 s10)

    ;; start at s0
    (current s0)
  )

  (:goal (and
    (on red yellow)
    (on blue red)
  ))
)