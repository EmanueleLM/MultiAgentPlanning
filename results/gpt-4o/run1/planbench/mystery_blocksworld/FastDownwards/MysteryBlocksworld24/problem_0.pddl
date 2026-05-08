(define (problem jack_of_all_trades_problem)
  (:domain jack_of_all_trades)
  (:objects 
    a b c d - object
  )
  (:init 
    (craves c d)
    (harmony)
    (planet a)
    (planet b)
    (planet d)
    (province a)
    (province b)
    (province c)
  )
  (:goal 
    (and (craves a b) (craves c a))
  )
)