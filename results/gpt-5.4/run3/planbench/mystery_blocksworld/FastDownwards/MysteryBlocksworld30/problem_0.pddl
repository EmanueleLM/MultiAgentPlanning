(define (problem jack_of_all_trades_problem_instance)
  (:domain jack_of_all_trades_instance)

  (:objects
    a b c d - obj
  )

  (:init
    (craves a d)
    (craves c b)
    (harmony)
    (planet b)
    (planet d)
    (province a)
    (province c)
  )

  (:goal
    (and
      (craves a d)
      (craves d c)
    )
  )
)