(define (problem jack_of_all_trades_problem)
  (:domain jack_of_all_trades)
  (:objects 
    a - object
    b - object
    c - object
    d - object
  )
  (:init 
    (craves d c)
    (harmony)
    (planet a)
    (planet b)
    (planet c)
    (province a)
    (province b)
    (province d)
  )
  (:goal (and 
    (craves c b)
    (craves d a)
  ))
)