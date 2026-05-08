(define (problem jack_of_all_trades_instance_problem)
  (:domain jack_of_all_trades_instance)

  (:objects
    a b c d - object
  )

  (:init
    (craves a c)
    (craves d b)
    (harmony)
    (planet b)
    (planet c)
    (province a)
    (province d)
  )

  (:goal
    (and
      (craves a b)
      (craves b c)
      (craves c d)
    )
  )
)