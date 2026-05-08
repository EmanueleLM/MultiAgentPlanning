(define (problem jack_of_all_trades_problem)
  (:domain jack_of_all_trades)
  (:objects
    a b c d - object
  )
  (:init
    (object_craves a d)
    (object_craves c a)
    (object_craves d b)
    (harmony)
    (planet b)
    (province c)
  )
  (:goal
    (object_craves d c)
  )
)