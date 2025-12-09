(define (problem orchestrator-problem)
  (:domain orchestrator)
  (:objects
    a b c d - object
  )
  (:init
    (craves a d)
    (craves d c)
    (harmony)
    (planet b)
    (planet c)
    (province a)
    (province b)
  )
  (:goal (and
    (craves b c)
    (craves d a)
  ))
)