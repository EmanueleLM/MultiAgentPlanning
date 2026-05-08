(define (problem orchestrator-problem)
  (:domain orchestrator-domain)

  (:objects
    a b c d - thing
  )

  (:init
    ;; initial facts as provided
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