; Problem: orchestrator-problem
; Brief notes:
; - Initial facts taken from the provided specification.
; - Goal enforces the mandated terminal condition: craves(a b).
(define (problem orchestrator-problem)
  (:domain orchestration-domain)
  (:objects a b c d - entity)

  (:init
    (craves c b)
    (craves d a)
    (harmony)
    (planet a)
    (planet b)
    (province c)
    (province d)
  )

  (:goal (craves a b))
)