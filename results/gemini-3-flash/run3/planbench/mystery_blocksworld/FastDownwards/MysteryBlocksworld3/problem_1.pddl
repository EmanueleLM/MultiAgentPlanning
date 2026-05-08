(define (problem mystery_blocksworld_3)
  (:domain mystery_blocksworld)
  (:objects
    a b c d - object
  )
  (:init
    (craves b a)
    (craves c b)
    (harmony)
    (planet a)
    (planet d)
    (province c)
    (province d)
  )
  (:goal
    (and
      (craves b a)
      (craves d c)
    )
  )
)