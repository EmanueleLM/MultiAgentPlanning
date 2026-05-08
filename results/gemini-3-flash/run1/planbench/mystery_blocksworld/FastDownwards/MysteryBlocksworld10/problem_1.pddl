(define (problem mystery_blocksworld_10)
  (:domain mystery_blocksworld)
  (:objects
    a b c d
  )
  (:init
    (harmony)
    (craves b d)
    (planet a)
    (planet c)
    (planet d)
    (province a)
    (province b)
    (province c)
  )
  (:goal
    (and
      (craves b c)
      (craves d a)
    )
  )
)