(define (problem mystery_blocksworld_47)
  (:domain mystery_blocksworld)
  (:objects a b c d)
  (:init
    (craves a c)
    (craves c b)
    (craves b d)
    (planet d)
    (province a)
    (harmony)
  )
  (:goal
    (and
      (craves b d)
      (craves d c)
      (craves c a)
    )
  )
)