(define (problem mystery-blocksworld-49)
  (:domain mystery-blocksworld)
  (:objects
    a b c d - object
  )
  (:init
    (craves a c)
    (craves d b)
    (harmony)
    (planet b)
    (planet c)
    (province a)
    (province d)
  )
  (:goal (and
    (craves a b)
    (craves b c)
    (craves c d)
  ))
)