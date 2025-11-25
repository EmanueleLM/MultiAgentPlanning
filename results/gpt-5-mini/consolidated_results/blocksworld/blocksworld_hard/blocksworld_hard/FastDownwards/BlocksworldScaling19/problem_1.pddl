; Discrete steps s0..s6 enforce forward-only stage progression; each action must advance current to the successor step.
(define (problem BlocksworldScaling19)
  (:domain blocks)
  (:objects
    blue yellow orange red - block
    s0 s1 s2 s3 s4 s5 s6 - step
  )
  (:init
    ;; step successor chain and initial current step
    (succ s0 s1)
    (succ s1 s2)
    (succ s2 s3)
    (succ s3 s4)
    (succ s4 s5)
    (succ s5 s6)
    (current s0)

    ;; blocks initial configuration (public information)
    (clear blue)
    (clear yellow)
    (handempty)
    (on blue orange)
    (on orange red)
    (on-table red)
    (on-table yellow)
  )
  (:goal (and
    (on red blue)
    (on orange red)
    (on yellow orange)
  ))
)