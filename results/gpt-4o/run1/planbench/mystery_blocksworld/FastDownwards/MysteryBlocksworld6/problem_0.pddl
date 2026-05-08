(define (problem jack_of_all_trades_instance)
  (:domain jack_of_all_trades)
  (:objects a b c d - object)

  (:init
    (object_craves b c)
    (harmony)
    (planet a)
    (planet c)
    (planet d)
    (province a)
    (province b)
    (province d)
  )

  (:goal (and
    (object_craves a b)
    (object_craves b d)
    (object_craves d c)
  ))
)