(define (problem jack_of_all_trades_problem)
  (:domain jack_of_all_trades_instance)

  (:objects
    a b c d - thing
  )

  (:init
    (craves a d)
    (craves b c)
    (harmony)
    (planet c)
    (planet d)
    (province a)
    (province b)
  )

  (:goal
    (and
      (craves b d)
      (craves d a)
    )
  )
)