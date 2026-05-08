(define (problem jack_of_all_trades_instance_problem)
  (:domain jack_of_all_trades_instance)

  (:objects
    a b c d - object
  )

  (:init
    (craves b d)
    (harmony)
    (planet a)
    (planet c)
    (planet d)
    (province a)
    (province b)
    (province c)
  )

  (:goal
    (and
      (craves b c)
      (craves d a)
    )
  )
)