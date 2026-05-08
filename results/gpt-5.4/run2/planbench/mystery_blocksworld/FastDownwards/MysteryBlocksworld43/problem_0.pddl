(define (problem jack_of_all_trades_problem)
  (:domain jack_of_all_trades_instance)

  (:objects
    a b c d - thing
  )

  (:init
    (craves c a)
    (harmony)
    (planet a)
    (planet b)
    (planet d)
    (province b)
    (province c)
    (province d)
  )

  (:goal
    (and
      (craves b c)
      (craves d b)
    )
  )
)