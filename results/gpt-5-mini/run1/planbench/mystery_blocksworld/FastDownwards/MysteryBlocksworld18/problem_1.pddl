(define (problem mysteryblocksworld18)
  (:domain mystery_crave_domain)
  (:objects a b c d - object)
  (:init
    ;; initial cravings
    (craves b d)
    (craves c a)
    ;; global flags
    (harmony)
    ;; planets and provinces as given
    (planet a)
    (planet d)
    (province b)
    (province c)
  )
  (:goal (and
    (craves b a)
    (craves c d)
    (craves d b)
  ))
)