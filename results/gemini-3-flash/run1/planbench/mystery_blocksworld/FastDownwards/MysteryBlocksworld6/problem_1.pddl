(define (problem mystery_blocksworld_6)
  (:domain mystery_blocksworld)
  (:objects
    a b c d - item
  )
  (:init
    (harmony)
    (craves b c)
    (planet a)
    (planet c)
    (planet d)
    (province a)
    (province b)
    (province d)
  )
  (:goal
    (and
      (craves a b)
      (craves b d)
      (craves d c)
    )
  )
)