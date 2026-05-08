(define (problem jack_of_all_trades_problem)
  (:domain jack_of_all_trades_instance)

  (:objects
    a b c d - object
  )

  (:init
    (craves a d)
    (craves b c)
    (craves d b)
    (harmony)
    (planet c)
    (province a)
  )

  (:goal
    (and
      (craves a c)
    )
  )
)