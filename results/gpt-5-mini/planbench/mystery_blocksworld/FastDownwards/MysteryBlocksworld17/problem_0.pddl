(define (problem struggle-instance)
  (:domain struggle)
  (:objects a b c d - obj)
  (:init
    (craves a d)
    (craves c a)
    (harmony)
    (planet b)
    (planet d)
    (province b)
    (province c)
  )
  ;; Goal: produce harmony and establish province for object a.
  (:goal (and
    (harmony)
    (province a)
  ))
)