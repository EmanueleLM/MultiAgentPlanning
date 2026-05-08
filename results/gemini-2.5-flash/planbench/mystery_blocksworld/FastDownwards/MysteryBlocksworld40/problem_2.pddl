(define (problem mystery-blocksworld40-problem)
  (:domain mystery-blocksworld40)
  (:objects
    a b c d - object
  )
  (:init
    (object_craves b a)
    (harmony)
    (planet a)
    (planet c)
    (planet d)
    (province b)
    (province c)
    (province d)
  )
  (:goal (and
    (object_craves a b)
    (object_craves b c)
    (object_craves d a)
  ))