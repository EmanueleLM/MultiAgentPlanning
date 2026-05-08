(define (problem jack_of_all_trades_problem)
  (:domain jack_of_all_trades)

  (:objects
    a b c d - object
  )

  (:init
    (object_craves a b)
    (object_craves b d)
    (object_craves d c)
    (harmony)
    (planet c)
    (province a)
  )

  (:goal
    (and
      (object_craves c a)
      (object_craves d b)
    )
  )
)