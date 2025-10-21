(define (problem pa-scenario)
  (:domain orchestrated-domain)
  (:objects
    o0 o1 o2 - obj
  )
  (:init
    (hand o0)
    (cats o1)
    (texture o2)
    (vase o1)
    (next o0 o1)
  )
  (:goal (and
    (vase o2)
    (next o1 o2)
    (not (vase o1))
    (not (next o0 o1))
  ))
)