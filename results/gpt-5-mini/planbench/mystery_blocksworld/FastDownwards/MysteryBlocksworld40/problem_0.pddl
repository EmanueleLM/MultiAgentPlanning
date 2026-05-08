(define (problem jack_problem)
  (:domain jack_of_all_trades)
  (:objects
    a b c d - object
  )
  (:init
    (craves b a)
    (harmony)
    (planet a)
    (planet c)
    (planet d)
    (province b)
    (province c)
    (province d)
  )
  (:goal (and
    (craves a b)
    (craves b c)
    (craves d a)
  ))
)