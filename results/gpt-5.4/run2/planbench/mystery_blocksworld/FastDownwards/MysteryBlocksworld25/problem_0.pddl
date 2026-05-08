(define (problem jack_of_all_trades_problem_instance)
  (:domain jack_of_all_trades_instance)

  (:objects
    a b c d - object
  )

  (:init
    (craves b d)
    (craves c a)
    (harmony)
    (planet a)
    (planet d)
    (province b)
    (province c)
  )

  (:goal
    (and
      (craves a c)
      (craves d a)
    )
  )
)