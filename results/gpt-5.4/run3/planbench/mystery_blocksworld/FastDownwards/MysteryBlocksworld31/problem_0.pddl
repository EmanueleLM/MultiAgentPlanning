(define (problem jack_of_all_trades_problem)
  (:domain jack_of_all_trades_instance)

  (:objects
    a b c d - obj
  )

  (:init
    (craves a c)
    (craves b a)
    (harmony)
    (planet c)
    (planet d)
    (province b)
    (province d)
  )

  (:goal
    (and
      (craves a b)
      (craves b d)
      (craves d c)
    )
  )
)