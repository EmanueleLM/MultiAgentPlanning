(define (problem mystery_blocksworld_10_problem)
  (:domain mystery_blocksworld_10)
  (:objects
    a b c d - block
  )
  (:init
    (craves b d)
    (harmony)
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