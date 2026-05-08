(define (problem mystery-blocksworld-19)
  (:domain mystery-blocksworld)
  (:objects
    a b c d - object
  )
  (:init
    (craves a c)
    (craves d a)
    (harmony)
    (planet b)
    (planet c)
    (province b)
    (province d)
  )
  (:goal (and
    (craves a c)
    (craves b d)
    (craves d a)
  ))
)