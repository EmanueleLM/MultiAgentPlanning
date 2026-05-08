(define (problem jack_of_all_trades_problem)
  (:domain jack_of_all_trades_instance)

  (:objects
    a b c d - thing
  )

  (:init
    (craves c b)
    (craves d a)
    (harmony)
    (planet a)
    (planet b)
    (province c)
    (province d)
  )

  (:goal
    (and
      (craves a b)
    )
  )
)