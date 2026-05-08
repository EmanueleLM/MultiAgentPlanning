(define (problem jack_of_all_trades_problem)
  (:domain jack_of_all_trades_instance)

  (:objects
    a b c d - object
  )

  (:init
    (craves a d)
    (craves b a)
    (craves c b)
    (harmony)
    (planet d)
    (province c)
  )

  (:goal
    (and
      (craves a b)
    )
  )
)