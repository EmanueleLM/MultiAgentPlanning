(define (problem jack_of_all_trades_instance_problem)
  (:domain jack_of_all_trades_instance)

  (:objects
    a b c d - obj
  )

  (:init
    (craves b a)
    (harmony)
    (planet a)
    (planet c)
    (planet d)
    (province b)
    (province c)
    (province d)
  )

  (:goal
    (and
      (craves a b)
      (craves b c)
      (craves d a)
    )
  )
)