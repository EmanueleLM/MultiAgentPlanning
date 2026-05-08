(define (problem establish_craving)
  (:domain spiritual_transitions)
  (:objects
    a b c d - entity
  )
  (:init
    (craves a b)
    (craves d c)
    (harmony)
    (planet b)
    (planet c)
    (province a)
    (province d)
  )
  (:goal
    (craves c a)
  )
)