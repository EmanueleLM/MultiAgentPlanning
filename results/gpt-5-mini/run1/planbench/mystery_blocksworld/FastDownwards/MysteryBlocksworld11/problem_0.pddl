; Problem: orchestrator-problem
; Ambiguity resolutions / modelling decisions applied to the problem instance:
; - Objects are {a b c d} of type obj as used in the domain.
; - Initial fluents are set to reflect the example in the specification:
;     harmony, planet(a), planet(b), province(c), province(d), craves(c,b), craves(d,a)
; - Goal enforces the mandated terminal condition: (craves a b).
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