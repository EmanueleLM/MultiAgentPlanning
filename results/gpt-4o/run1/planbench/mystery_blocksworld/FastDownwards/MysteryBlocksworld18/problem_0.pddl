(define (problem jack_of_all_trades_instance)
   (:domain jack_of_all_trades)
   (:objects
       a b c d - object_type
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
       (and
           (object_craves b a)
           (object_craves c d)
           (object_craves d b)
       )
   )
)