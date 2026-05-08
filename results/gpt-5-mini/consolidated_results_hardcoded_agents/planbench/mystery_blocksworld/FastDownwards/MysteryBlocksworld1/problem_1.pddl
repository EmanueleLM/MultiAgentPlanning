(define (problem craving-problem)
  (:domain craving-domain)
  (:objects
    a b c d - obj
    s1 s2 s3 - stage
  )
  (:init
    ;; initial craving relations
    (craves b c)
    (craves c d)
    (craves d a)

    ;; initial global facts
    (harmony)
    (planet a)
    (province b)

    ;; explicit ordered stages to enforce monotonic progression of time/stages
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