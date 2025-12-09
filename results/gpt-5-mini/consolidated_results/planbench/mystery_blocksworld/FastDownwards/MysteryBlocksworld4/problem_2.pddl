(define (problem craving-problem-consistent)
  (:domain craving-consistent)
  (:objects
    a b c d - item
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 - stage
  )

  (:init
    ;; initial craves
    (craves a c)
    (craves c b)
    (craves d a)

    ;; initial global facts
    (harmony)
    (planet b)
    (province d)

    ;; initial stage
    (at s0)

    ;; successor relation (explicit discrete time). Provide a contiguous chain of stages to permit the needed sequence of actions.
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
  )

  (:goal (and
    (craves a b)
    (craves d c)
  ))
)