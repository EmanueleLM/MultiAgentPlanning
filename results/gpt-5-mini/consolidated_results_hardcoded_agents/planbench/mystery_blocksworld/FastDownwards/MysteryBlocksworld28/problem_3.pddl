(define (problem craving-problem)
  (:domain craving-domain)
  (:objects
    a b c d - obj
    s0 s1 s2 s3 s4 s5 s6 - stage
  )
  (:init
    ;; initial craves relations
    (craves b a)
    (craves d b)

    ;; harmony initially true
    (harmony)

    ;; planet facts as given
    (planet a)
    (planet c)

    ;; province facts as given
    (province c)
    (province d)

    ;; explicit stage/time bookkeeping
    (current s0)
    (succ s0 s1)
    (succ s1 s2)
    (succ s2 s3)
    (succ s3 s4)
    (succ s4 s5)
    (succ s5 s6)
  )
  (:goal (and (craves b d) (craves d c)))
)