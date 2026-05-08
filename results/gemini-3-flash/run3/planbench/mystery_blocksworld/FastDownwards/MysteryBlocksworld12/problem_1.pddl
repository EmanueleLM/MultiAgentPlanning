(define (problem mystery_blocksworld_12)
  (:domain mystery_blocksworld)
  (:objects
    a b c d - object
  )
  (:init
    (craves a b)
    (craves b c)
    (craves c d)
    (harmony)
    (planet d)
    (province a)
  )
  (:goal
    (and
      (craves b c)
      (craves c d)
      (craves d a)
    )
  )
)