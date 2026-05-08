(define (problem mystery_blocksworld_13)
  (:domain mystery_blocksworld)
  (:objects a b c d)
  (:init
    (craves b d)
    (craves c b)
    (harmony)
    (planet a)
    (planet d)
    (province a)
    (province c)
  )
  (:goal
    (and
      (craves a c)
      (craves b a)
    )
  )
)