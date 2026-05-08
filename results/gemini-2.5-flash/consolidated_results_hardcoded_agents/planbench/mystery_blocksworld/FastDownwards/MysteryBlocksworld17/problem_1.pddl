(define (problem pb1)
  (:domain MysteryBlocksworld17)
  (:objects
    a b c d - object
  )
  (:init
    ;; Initial State: object a craves object d, object c craves object a, harmony, planet object b, planet object d, province object b, province object c.
    (craves a d)
    (craves c a)
    (harmony)
    (planet b)
    (planet d)
    (province b)
    (province c)
  )
  (:goal (and
    (craves a b)
    (craves c a)
    (craves d c)
  ))
)