(define (problem mystery_blocksworld_15)
  (:domain mystery_blocksworld)
  (:objects
    a b c d
  )
  (:init
    (harmony)
    (craves a d)
    (craves d c)
    (planet b)
    (planet c)
    (province a)
    (province b)
  )
  (:goal
    (and
      (craves b c)
      (craves c d)
    )
  )
)