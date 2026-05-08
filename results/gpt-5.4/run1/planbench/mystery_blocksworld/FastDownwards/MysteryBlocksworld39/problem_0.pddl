(define (problem jack_of_all_trades_problem)
  (:domain jack_of_all_trades_instance)

  (:objects
    a b c d - thing
  )

  (:init
    (craves b c)
    (craves c a)
    (harmony)
    (planet a)
    (planet d)
    (province b)
    (province d)
  )

  (:goal
    (and
      (craves b d)
      (craves c a)
    )
  )
)