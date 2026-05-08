(define (problem MysteryBlocksworld10-problem)
  (:domain MysteryBlocksworld10)
  (:objects
    a b c d - object
  )
  (:init
    (ObjectCraves b d)
    (Harmony)
    (Planet a)
    (Planet c)
    (Planet d)
    (Province a)
    (Province b)
    (Province c)
    (= (total-cost) 0)
  )
  (:goal (and
    (ObjectCraves b c)
    (ObjectCraves d a)
  ))
  (:metric minimize (total-cost))
)