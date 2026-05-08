(define (problem mystery-craving-problem)
  (:domain mystery-craving)
  (:objects a b c d - object)
  (:init
    ;; compressed encoding of the chain: d -> a -> c -> b
    (crave-list d a c b)
    (harmony)
    (planet b)
    (province d)
  )
  (:goal (and
    (craves a d)
    (craves d b)
  ))
)