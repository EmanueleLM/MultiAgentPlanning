(define (problem jack_of_all_trades_instance)
  (:domain jack_of_all_trades)
  (:objects a b c d - object)
  (:init
    (object_craves a d)
    (object_craves d c)
    (harmony)
    (planet b)
    (planet c)
    (province a)
    (province b)
  )
  (:goal
    (and
      (object_craves b c)
      (object_craves d a)
    )
  )
)