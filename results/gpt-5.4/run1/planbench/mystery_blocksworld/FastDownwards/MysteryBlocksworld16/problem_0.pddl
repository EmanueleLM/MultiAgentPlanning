(define (problem jack_of_all_trades_problem)
  (:domain jack_of_all_trades_instance)

  (:objects
    a b c d - object
  )

  (:init
    (craves a c)
    (craves b a)
    (craves d b)
    (harmony)
    (planet c)
    (province d)
  )

  (:goal
    (and
      (craves b c)
      (craves c d)
    )
  )
)