(define (problem mystery_blocksworld_36)
  (:domain mystery_blocksworld)
  (:objects a b c d)
  (:init
    (craves a d)
    (craves d b)
    (craves b c)
    (harmony)
    (planet c)
    (province a)
  )
  (:goal
    (and
      (craves a b)
      (craves c a)
    )
  )
)