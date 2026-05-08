(define (problem jack_of_all_trades_problem_instance)
  (:domain jack_of_all_trades_instance)

  (:objects
    a b c d - entity
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