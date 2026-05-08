(define (problem mystery-craving-problem)
  (:domain mystery-craving)
  (:objects
    a b c d - object
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 - stage
  )
  (:init
    ;; Explicit initial crave relations (no compressed encodings)
    (craves a c)
    (craves c b)
    (craves d a)

    ;; Initial status facts
    (harmony)
    (planet b)
    (province d)

    ;; Initial stage: s0 is active. All actions must advance stage according to succ chain.
    (at-stage s0)
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
    (succ s10 s11)
  )
  (:goal (and
    (craves a d)
    (craves d b)
  ))
)