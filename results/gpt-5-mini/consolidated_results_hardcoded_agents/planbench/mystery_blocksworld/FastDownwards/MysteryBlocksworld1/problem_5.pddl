(define (problem craving-problem)
  (:domain craving-domain)
  (:objects
    a b c d - obj
    s1 s2 s3 - stage
  )
  (:init
    (craves b c)
    (craves c d)
    (craves d a)
    (harmony)
    (planet a)
    (province b)
    (next s1 s2)
    (next s2 s3)
    (at-stage s1)
  )
  (:goal
    (and
      (craves a c)
      (craves d a)
    )
  )
)