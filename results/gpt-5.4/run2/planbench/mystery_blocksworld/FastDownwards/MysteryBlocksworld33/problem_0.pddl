(define (problem jack_of_all_trades_instance_problem)
  (:domain jack_of_all_trades_instance)

  (:objects
    a b c d - object
  )

  (:init
    (craves a d)
    (craves c a)
    (craves d b)
    (harmony)
    (planet b)
    (province c)
  )

  (:goal
    (and
      (craves d c)
    )
  )
)