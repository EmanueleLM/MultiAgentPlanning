(define (problem jack_of_all_trades_problem)
  (:domain jack_of_all_trades_instance)

  (:objects
    a b c d - obj
  )

  (:init
    (craves b a)
    (craves c b)
    (harmony)
    (planet a)
    (planet d)
    (province c)
    (province d)
  )

  (:goal
    (and
      (craves b a)
      (craves d c)
    )
  )
)