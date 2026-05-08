(define (problem mystery_blocksworld_20)
  (:domain mystery_blocksworld)
  (:objects a b c d)
  (:init
    (craves c a)
    (craves d c)
    (harmony)
    (planet a)
    (planet b)
    (province b)
    (province d)
  )
  (:goal
    (and
      (craves b c)
      (craves d a)
    )
  )
)