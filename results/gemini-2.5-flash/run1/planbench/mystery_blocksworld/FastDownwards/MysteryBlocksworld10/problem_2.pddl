(define (problem mystery_blocksworld10_problem)
  (:domain MysteryBlocksworld10)
  (:objects
    a b c d - object
  )
  (:init
    (object_craves b d)
    (harmony)
    (planet a)
    (planet c)
    (planet d)
    (province a)
    (province b)
    (province c)
    (= (total-cost) 0)
  )
  (:goal (and
    (object_craves b c)
    (object_craves d a)
  ))
  (:metric minimize (total-cost))
)