(define (problem harmony-problem)
  (:domain harmony-domain)
  (:objects
    a b c d - object
  )

  (:init
    ; initial craves relations
    (craves c a)
    (craves d c)

    ; global booleans
    (harmony)

    ; planet facts
    (planet a)
    (planet b)

    ; initial province facts
    (province b)
    (province d)

    ; distinct facts for all unequal ordered pairs (explicit inequality encoding)
    (distinct a b) (distinct a c) (distinct a d)
    (distinct b a) (distinct b c) (distinct b d)
    (distinct c a) (distinct c b) (distinct c d)
    (distinct d a) (distinct d b) (distinct d c)
  )

  (:goal (and
           (craves b c)
           (craves d a)
         )
  )
)