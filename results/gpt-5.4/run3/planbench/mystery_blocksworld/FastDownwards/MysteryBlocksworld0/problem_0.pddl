(define (problem jack_of_all_trades_problem)
  (:domain jack_of_all_trades_instance)

  (:objects
    a b c d - obj
  )

  (:init
    (craves a b)
    (craves d c)
    (harmony)
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