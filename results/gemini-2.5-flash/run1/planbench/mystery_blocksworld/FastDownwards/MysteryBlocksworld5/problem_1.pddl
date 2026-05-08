(define (problem MysteryBlocksworld5-Problem)
  (:domain MysteryBlocksworld5)
  (:objects
    a b c d - object
  )
  (:init
    (craves a d)
    (craves b c)
    (craves d b)
    (harmony)
    (planet c)
    (province a)
  )
  (:goal (craves a c))
)