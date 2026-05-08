(define (problem jack_of_all_trades_instance_problem)
  (:domain jack_of_all_trades_instance)

  (:objects
    a b c d - obj
  )

  (:init
    (craves b d)
    (craves c b)
    (harmony)
    (planet a)
    (planet d)
    (province a)
    (province c)
  )

  (:goal
    (and
      (craves a c)
      (craves b a)
    )
  )
)