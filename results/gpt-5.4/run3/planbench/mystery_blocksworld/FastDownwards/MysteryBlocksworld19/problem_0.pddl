(define (problem jack_of_all_trades_problem_instance)
  (:domain jack_of_all_trades_instance)

  (:objects
    a b c d - thing
  )

  (:init
    (craves a c)
    (craves d a)
    (harmony)
    (planet b)
    (planet c)
    (province b)
    (province d)
  )

  (:goal
    (and
      (craves a c)
      (craves b d)
      (craves d a)
    )
  )
)