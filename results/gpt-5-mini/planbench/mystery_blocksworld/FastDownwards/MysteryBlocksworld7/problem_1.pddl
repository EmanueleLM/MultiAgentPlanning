(define (problem craving-problem)
  (:domain craving-domain)
  (:objects a b c d - obj)
  (:init
  )
  (:goal
    (and
      (craves a c)
      (craves b a)
      (craves d b)
    )
  )
)