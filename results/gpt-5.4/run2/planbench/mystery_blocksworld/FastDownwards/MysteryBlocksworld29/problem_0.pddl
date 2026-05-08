(define (problem jack_of_all_trades_problem)
  (:domain jack_of_all_trades_instance)

  (:objects
    a b c d - thing
  )

  (:init
    (craves a c)
    (craves b d)
    (harmony)
    (planet c)
    (planet d)
    (province a)
    (province b)
  )

  (:goal
    (and
      (craves a c)
      (craves b a)
    )
  )
)