(define (problem mystery_blocksworld_42)
  (:domain mystery_blocksworld)
  (:objects a b c d)
  (:init
    (harmony)
    (province a)
    (planet d)
    (craves a c)
    (craves c b)
    (craves b d)
  )
  (:goal
    (and
      (craves a d)
      (craves b a)
    )
  )
)