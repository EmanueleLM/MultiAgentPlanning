(define (problem mystery_blocksworld_problem)
  (:domain mystery_blocksworld)
  (:objects a b c d)
  (:init
    (harmony)
    (planet a)
    (planet d)
    (province b)
    (province d)
    (craves b c)
    (craves c a)
  )
  (:goal
    (and
      (craves b d)
      (craves c a)
    )
  )
)