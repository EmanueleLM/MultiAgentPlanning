(define (problem crave_problem)
  (:domain crave_domain)
  (:objects
    a b c d - obj
    s0 s1 s2 s3 s4 s5 s6 - stage
  )

  (:init
    ;; initial provinces and planets
    (province a)
    (province c)

    (planet a)
    (planet d)

    ;; initial cravings and global harmony
    (craves b d)
    (craves c b)
    (harmony)

    ;; stage bookkeeping: start at s0 and define allowed successor steps
    (at-stage s0)
    (succ s0 s1)
    (succ s1 s2)
    (succ s2 s3)
    (succ s3 s4)
    (succ s4 s5)
    (succ s5 s6)
  )

  (:goal (and (craves a c) (craves b a)))
)