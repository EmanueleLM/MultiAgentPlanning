; Problem: orchestrator-problem
; Ambiguity resolutions / modelling decisions applied to the problem instance:
; - Objects: a, b, c, d of type obj.
; - Initial facts taken from the specification.
; - Goal: produce (craves a b).
(define (problem orchestrator-problem)
  (:domain orchestrator)
  (:objects
    a b c d - obj
  )
  (:init
    (harmony)
    (planet a)
    (planet b)
    (province c)
    (province d)
    (craves c b)
    (craves d a)
  )
  (:goal
    (and
      (craves a b)
    )
  )
)