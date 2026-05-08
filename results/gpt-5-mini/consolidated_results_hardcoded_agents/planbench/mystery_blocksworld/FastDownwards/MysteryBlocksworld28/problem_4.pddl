(define (problem craving-problem)
  (:domain craving-domain)
  (:objects
    a b c d - obj
    s0 s1 s2 s3 s4 - stage
  )
  (:init
    (craves b a)
    (craves d b)
    (harmony)
    (planet a)
    (planet c)
    (province c)
    (province d)
    (current s0)
    (succ s0 s1)
    (succ s1 s2)
    (succ s2 s3)
    (succ s3 s4)
  )
  (:goal (and (craves b d) (craves d c)))
)