(define (problem MysteryBlocksworld11_Problem)
  (:domain MysteryBlocksworld11)
  (:objects
    a b c d - object
  )
  (:init
    (Object_Craves c b)
    (Object_Craves d a)
    (Harmony)
    (Planet a)
    (Planet b)
    (Province c)
    (Province d)
  )
  (:goal (Object_Craves a b))
)