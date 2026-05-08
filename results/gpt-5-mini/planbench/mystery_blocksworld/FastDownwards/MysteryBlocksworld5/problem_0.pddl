(define (problem crave-problem)
  (:domain crave-domain)

  (:objects
    a b c - obj
    ph1 ph2 ph3 - phase
  )

  (:init
    ;; phases and ordering (explicit successor links enforce order)
    (phase-current ph1)
    (phase-successor ph1 ph2)
    (phase-successor ph2 ph3)

    ;; objects exist
    (object-exists a)
    (object-exists b)
    (object-exists c)

    ;; explicit "other object" relations (symmetric pairs enumerated)
    (other-object a b)
    (other-object a c)
    (other-object b a)
    (other-object b c)
    (other-object c a)
    (other-object c b)
  )

  ;; Goal fixes every required terminal condition:
  ;; - a must crave c
  ;; - the examination of a must have occurred
  ;; - the offering of c must have occurred
  ;; - the process must have reached the final phase ph3
  (:goal (and
    (craves a c)
    (examined a)
    (offered c)
    (phase-current ph3)
  ))
)