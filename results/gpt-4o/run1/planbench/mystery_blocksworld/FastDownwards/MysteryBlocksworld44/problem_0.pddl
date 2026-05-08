(define (problem instance)
  (:domain jack_of_all_trades)
  
  (:objects 
    a b c d - object
  )
  
  (:init
    (object_craves b d)
    (object_craves c a)
    (harmony)
    (planet a)
    (planet d)
    (province b)
    (province c)
  )
  
  (:goal
    (object_craves b c)
  )
)