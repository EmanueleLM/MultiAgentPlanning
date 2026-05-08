(define (problem jack_of_all_trades_instance_problem)
  (:domain jack_of_all_trades_instance)

  (:objects
    a b c d - thing
  )

  (:init
    (craves a b)
    (craves b c)
    (craves c d)
    (harmony)
    (planet d)
    (province a)
  )

  (:goal
    (and
      (craves b c)
      (craves c d)
      (craves d a)
    )
  )
)