(define (problem jack_of_all_trades_problem)
  (:domain jack_of_all_trades)
  (:objects 
    a b c d - object
  )
  (:init 
    (object_craves c b)
    (object_craves d c)
    (harmony)
    (planet a)
    (planet b)
    (province a)
    (province d)
  )
  (:goal 
    (and 
      (object_craves a b)
      (object_craves c d)
      (object_craves d a)
    )
  )
)