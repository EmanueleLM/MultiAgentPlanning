(define (problem jack_of_all_trades_problem_instance)
  (:domain jack_of_all_trades_instance)

  (:objects
    a b c d - thing
  )

  (:init
    (craves a d)
    (craves d c)
    (harmony)
    (planet b)
    (planet c)
    (province a)
    (province b)
  )

  (:goal
    (and
      (craves b c)
      (craves c d)
    )
  )
)