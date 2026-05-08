(define (problem mystery_blocksworld_6)
  (:domain mystery_blocksworld)
  (:objects
    a b c d - obj
  )
  (:init
    (craves b c)
    (harmony)
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