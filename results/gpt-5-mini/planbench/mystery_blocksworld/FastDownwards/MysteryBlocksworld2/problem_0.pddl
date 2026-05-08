(define (problem craving-problem)
  (:domain craving-domain)
  (:objects
    a b d - creature
  )
  (:init
    (alive a)
    (alive b)
    (alive d)
  )
  (:goal (and
    (craves a d)
    (craves d b)
  ))
)