(define (problem mystery_blocksworld_28_problem)
  (:domain mystery_blocksworld_28)
  (:objects
    a b c d - object
  )
  (:init
    (harmony)
    (craves b a)
    (craves d b)
    (planet a)
    (planet c)
    (province c)
    (province d)
  )
  (:goal
    (and
      (craves b d)
      (craves d c)
    )
  )
)