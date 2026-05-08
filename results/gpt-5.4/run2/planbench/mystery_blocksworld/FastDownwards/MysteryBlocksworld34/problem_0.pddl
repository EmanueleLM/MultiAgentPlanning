(define (problem jack_of_all_trades_instance_problem)
  (:domain jack_of_all_trades_instance)

  (:objects
    a b c d - thing
  )

  (:init
    (craves b d)
    (craves d c)
    (harmony)
    (planet a)
    (planet c)
    (province a)
    (province b)
  )

  (:goal
    (and
      (craves b a)
      (craves c b)
    )
  )
)