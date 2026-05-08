(define (problem craving-problem-consistent)
  (:domain craving-consistent)
  (:objects
    a b c d - item
    s0 s1 s2 s3 s4 s5 s6 - stage
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

    ;; successor relation (explicit discrete time). Provide a contiguous chain of stages to permit multiple actions.
    (succ s0 s1)
    (succ s1 s2)
    (succ s2 s3)
    (succ s3 s4)
    (succ s4 s5)
    (succ s5 s6)
  )

  (:goal (and
    (craves a b)
    (craves d c)
  ))
)