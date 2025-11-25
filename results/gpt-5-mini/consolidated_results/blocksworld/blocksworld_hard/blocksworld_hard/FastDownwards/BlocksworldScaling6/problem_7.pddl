(define (problem BlocksworldScaling6-prob)
  (:domain BlocksworldScaling6)
  (:objects
    red orange blue yellow - block
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 - stage
  )
  (:init
    ;; initial stacking and table facts
    (on red yellow)
    (on orange blue)
    (ontable blue)
    (ontable yellow)

    ;; clear and hand facts (only positive atoms allowed in :init)
    (clear red)
    (clear orange)
    (handempty)

    ;; stage/time progression: single current stage and successor ordering
    (current s0)
    (succ s0 s1) (succ s1 s2) (succ s2 s3) (succ s3 s4) (succ s4 s5)
    (succ s5 s6) (succ s6 s7) (succ s7 s8) (succ s8 s9) (succ s9 s10)
    (succ s10 s11) (succ s11 s12)
  )
  (:goal (and
    (on blue red)
    (on orange blue)
    (on yellow orange)
  ))
)