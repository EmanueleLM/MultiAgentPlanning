(define (problem mystery_blocksworld48)
  (:domain mystery_blocksworld48)
  (:objects
    a b c d - object
  )
  (:init
    (craves b c)
    (harmony)
    (planet a)
    (planet c)
    (planet d)
    (province a)
    (province b)
    (province d)
  )
  (:goal (and
    (craves a b)
    (craves b c)
    (craves c d)
  ))
)