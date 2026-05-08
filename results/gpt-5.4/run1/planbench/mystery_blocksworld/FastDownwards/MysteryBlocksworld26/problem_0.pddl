(define (problem jack_of_all_trades_instance_problem)
  (:domain jack_of_all_trades_instance)

  (:objects
    a b c d - object
  )

  (:init
    (craves a b)
    (craves b d)
    (harmony)
    (planet c)
    (planet d)
    (province a)
    (province c)
  )

  (:goal
    (and
      (craves b d)
      (craves c a)
      (craves d c)
    )
  )
)