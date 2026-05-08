(define (problem orchestrator-problem)
  (:domain orchestrator-domain)

  (:objects
    a b c d - obj
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