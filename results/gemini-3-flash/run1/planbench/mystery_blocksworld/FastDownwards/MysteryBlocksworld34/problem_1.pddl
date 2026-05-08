(define (problem mystery_blocksworld_34)
  (:domain mystery_blocksworld)
  (:objects a b c d)
  (:init
    (craves b d)
    (craves d c)
    (harmony)
    (planet a)
    (planet c)
    (province a)
    (province b)
  )
  (:goal
    (and
      (craves b a)
      (craves c b)
    )
  )
)