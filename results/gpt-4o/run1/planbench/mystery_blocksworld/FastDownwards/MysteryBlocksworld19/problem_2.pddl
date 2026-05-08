(define (problem jack_of_all_trades_problem)
  (:domain jack_of_all_trades)
  (:objects
    a b c d - object
  )
  (:init
    (craves a c)
    (craves d a)
    (harmony)
    (planet b)
    (planet c)
    (province b)
    (province d)
  )
  (:goal
    (and
      (craves a c)
      (craves b d)
      (craves d a)
    )
  )
)