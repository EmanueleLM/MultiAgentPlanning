(define (problem mystery_blocksworld_29)
  (:domain mystery_blocksworld_29)
  (:objects
    a b c d - obj
  )
  (:init
    (craves a c)
    (craves b d)
    (harmony)
    (planet c)
    (planet d)
    (province a)
    (province b)
  )
  (:goal
    (and
      (craves a c)
      (craves b a)
    )
  )
)