(define (problem jack_of_all_trades_problem_instance)
  (:domain jack_of_all_trades_instance)

  (:objects
    a b c d - obj
  )

  (:init
    (craves a b)
    (craves d a)
    (harmony)
    (planet b)
    (planet c)
    (province c)
    (province d)
  )

  (:goal
    (and
      (craves a c)
      (craves c b)
    )
  )
)