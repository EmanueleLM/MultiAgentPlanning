(define (problem mystery_blocksworld_32)
  (:domain mystery_blocksworld)
  (:objects
    a b c d
  )
  (:init
    (craves a c)
    (craves b a)
    (harmony)
    (planet c)
    (planet d)
    (province b)
    (province d)
  )
  (:goal
    (and
      (craves a c)
      (craves d b)
    )
  )
)