(define (problem jack_of_all_trades_problem)
  (:domain jack_of_all_trades_instance)

  (:objects
    a b c d - entity
  )

  (:init
    (craves a b)
    (craves b d)
    (craves d c)
    (harmony)
    (planet c)
    (province a)
  )

  (:goal
    (and
      (craves c a)
      (craves d b)
    )
  )
)