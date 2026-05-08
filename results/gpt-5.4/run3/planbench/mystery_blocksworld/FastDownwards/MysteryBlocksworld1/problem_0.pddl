(define (problem jack_of_all_trades_problem)
  (:domain jack_of_all_trades_instance)

  (:objects
    a b c d - entity
  )

  (:init
    (craves b c)
    (craves c d)
    (craves d a)
    (harmony)
    (planet a)
    (province b)
  )

  (:goal
    (and
      (craves a c)
      (craves d a)
    )
  )
)