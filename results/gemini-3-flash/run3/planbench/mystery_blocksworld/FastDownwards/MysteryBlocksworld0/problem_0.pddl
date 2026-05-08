(define (problem joat_problem)
  (:domain jack_of_all_trades)
  (:objects
    a b c d - entity
  )
  (:init
    (harmony)
    (craves a b)
    (craves d c)
    (planet b)
    (planet c)
    (province a)
    (province d)
  )
  (:goal
    (and
      (craves c a)
    )
  )
)