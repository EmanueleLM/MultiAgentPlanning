(define (problem mystery_blocksworld_21)
  (:domain mystery_blocksworld)
  (:objects a b c d)
  (:init
    (craves a d)
    (craves d c)
    (harmony)
    (planet b)
    (planet c)
    (province a)
    (province b)
  )
  (:goal
    (and
      (craves b c)
      (craves d a)
    )
  )
)