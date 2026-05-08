(define (problem jack_of_all_trades_problem_instance)
  (:domain jack_of_all_trades_instance)

  (:objects
    a b c d - obj
  )

  (:init
    (craves b c)
    (harmony)
    (planet a)
    (planet c)
    (planet d)
    (province a)
    (province b)
    (province d)
  )

  (:goal
    (and
      (craves a b)
      (craves b c)
      (craves c d)
    )
  )
)