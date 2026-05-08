(define (problem jack_of_all_trades_instance_problem)
  (:domain jack_of_all_trades_instance)

  (:objects
    a b c d - thing
  )

  (:init
    (craves a d)
    (craves c a)
    (harmony)
    (planet b)
    (planet d)
    (province b)
    (province c)
  )

  (:goal
    (and
      (craves a d)
      (craves b a)
      (craves d c)
    )
  )
)