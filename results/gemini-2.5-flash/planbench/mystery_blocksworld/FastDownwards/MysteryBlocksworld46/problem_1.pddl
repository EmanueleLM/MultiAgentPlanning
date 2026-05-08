(define (problem MysteryBlocksworld46)
  (:domain mystery_blocksworld)
  (:objects
    a b c d - object
  )
  (:init
    (craves a d)
    (craves b a)
    (craves c b)
    (harmony)
    (planet d)
    (province c)
  )
  (:goal (craves a b))
)