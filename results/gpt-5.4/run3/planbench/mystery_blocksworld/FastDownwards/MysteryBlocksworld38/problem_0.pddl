(define (problem jack_of_all_trades_instance_problem)
  (:domain jack_of_all_trades_instance)

  (:objects
    a b c d - thing
  )

  (:init
    (craves a b)
    (craves c d)
    (craves d a)
    (harmony)
    (planet b)
    (province c)
  )

  (:goal
    (and
      (craves a c)
      (craves c d)
      (craves d b)
    )
  )
)