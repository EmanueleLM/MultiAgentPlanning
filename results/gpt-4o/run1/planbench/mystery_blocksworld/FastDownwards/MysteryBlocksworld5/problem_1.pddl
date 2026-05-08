(define (problem instance)
  (:domain jack_of_all_trades)
  (:objects
    a b c d - object
  )
  (:init
    (craves a d)
    (craves b c)
    (craves d b)
    (harmony)
    (planet c)
    (province a)
  )
  (:goal
    (craves a c)
  )
)