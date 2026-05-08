(define (problem crave_goal)
  (:domain state_transitions)
  
  (:objects
    a b c d - object
  )

  (:init
    (object_craves b a)
    (object_craves d b)
    (harmony)
    (planet a)
    (planet c)
    (province c)
    (province d)
  )

  (:goal
    (object_craves b d)
  )
)