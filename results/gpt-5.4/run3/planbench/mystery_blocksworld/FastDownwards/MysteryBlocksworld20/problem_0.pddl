(define (problem jack_of_all_trades_problem_instance)
  (:domain jack_of_all_trades_instance)

  (:objects
    a b c d - thing
  )

  (:init
    (craves c a)
    (craves d c)
    (harmony)
    (planet a)
    (planet b)
    (province b)
    (province d)
  )

  (:goal
    (and
      (craves b c)
      (craves d a)
    )
  )
)