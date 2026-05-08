(define (problem jack_of_all_trades_problem)
  (:domain jack_of_all_trades)
  (:objects
    a b c d - object
  )
  (:init
    (craves b d)
    (craves d a)
    (harmony)
    (planet a)
    (planet c)
    (province b)
    (province c)
  )
  (:goal
    (and
      (craves b a)
      (craves c d)
    )
  )
)