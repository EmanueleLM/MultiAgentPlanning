(define (problem instance_1_revised)

  (:domain object_state_transitions)

  (:objects
    a b c d - object
  )

  (:init
    (craves a b)
    (craves b c)
    (craves c d)
    (harmony)
    (planet d)
    (province a)
  )

  (:goal
    (and 
      (craves b c)
      (craves c d)
      (craves d a)
    )
  )
)