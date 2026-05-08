(define (problem jack_of_all_trades_instance_problem)
  (:domain jack_of_all_trades_instance)

  (:objects
    a b c d - thing
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
    (and
      (craves a b)
      (craves c a)
    )
  )
)