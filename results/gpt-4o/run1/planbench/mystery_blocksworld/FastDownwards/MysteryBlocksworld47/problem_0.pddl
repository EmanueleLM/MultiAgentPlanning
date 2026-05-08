(define (problem jack_of_all_trades_instance)
  (:domain jack_of_all_trades)
  
  (:objects 
    a b c d - object
  )
  
  (:init 
    (object_craves a c)
    (object_craves b d)
    (object_craves c b)
    (harmony)
    (planet d)
    (province a)
  )
  
  (:goal 
    (and (object_craves b d)
         (object_craves c a)
         (object_craves d c))
  )
)