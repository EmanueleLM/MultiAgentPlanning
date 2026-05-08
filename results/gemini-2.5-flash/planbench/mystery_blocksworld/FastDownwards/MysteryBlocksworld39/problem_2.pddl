(define (problem mystery_blocksworld39_problem)
  (:domain mystery_blocksworld39)
  (:objects
    a b c d - object
  )
  (:init
    (craves b c)
    (craves c a)
    (harmony)
    (planet a)
    (planet d)
    (province b)
    (province d)
  )
  (:goal (and
    (craves b d)
    (craves c a)
  ))