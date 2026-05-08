(define (problem jack_of_all_trades_problem_instance)
  (:domain jack_of_all_trades_instance)

  (:objects
    a b c d - entity
  )

  (:init
    (craves c d)
    (craves d a)
    (harmony)
    (planet a)
    (planet b)
    (province b)
    (province c)
  )

  (:goal
    (and
      (craves a c)
      (craves b a)
      (craves d b)
    )
  )
)