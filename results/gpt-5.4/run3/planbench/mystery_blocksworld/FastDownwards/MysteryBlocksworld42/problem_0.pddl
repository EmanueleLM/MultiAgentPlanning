(define (problem jack_of_all_trades_instance_problem)
  (:domain jack_of_all_trades_instance)

  (:objects
    a b c d - obj
  )

  (:init
    (craves a c)
    (craves b d)
    (craves c b)
    (harmony)
    (planet d)
    (province a)
  )

  (:goal
    (and
      (craves a d)
      (craves b a)
    )
  )
)