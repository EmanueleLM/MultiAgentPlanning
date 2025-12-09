(define (problem crave_problem)
  (:domain crave_domain)
  (:objects a b c d - obj
            s0 s1 s2 s3 s4 s5 s6 - stage)

  (:init
    ;; provinces
    (province a)
    (province c)

    ;; planets
    (planet a)
    (planet d)

    ;; initial cravings
    (craves b d)
    (craves c b)

    ;; harmony
    (harmony)

    ;; stage successor chain and current stage (s0 -> s1 -> ... -> s6)
    (succ s0 s1) (succ s1 s2) (succ s2 s3) (succ s3 s4) (succ s4 s5) (succ s5 s6)
    (current s0)

    ;; equality facts used with negative preconditions to enforce distinctness
    (same a a) (same b b) (same c c) (same d d)
  )

  (:goal (and (craves a c) (craves b a)))
)