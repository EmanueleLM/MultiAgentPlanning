(define (problem jack_of_all_trades_problem_instance)
  (:domain jack_of_all_trades_instance)

  (:objects
    a b c d - thing
  )

  (:init
    (craves b a)
    (craves d b)
    (harmony)
    (planet a)
    (planet c)
    (province c)
    (province d)
  )

  (:goal
    (and
      (craves b d)
    )
  )
)