(define (problem jack_of_all_trades_instance_problem)
  (:domain jack_of_all_trades_instance)

  (:objects
    a b c d - thing
  )

  (:init
    (craves c b)
    (craves d c)
    (harmony)
    (planet a)
    (planet b)
    (province a)
    (province d)
  )

  (:goal
    (and
      (craves a b)
      (craves c d)
      (craves d a)
    )
  )
)