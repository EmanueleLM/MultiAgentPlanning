(define (problem mystery_blocksworld_39_problem)
  (:domain mystery_blocksworld_39)
  (:objects a b c d - obj)
  (:init
    (craves b c)
    (craves c a)
    (harmony)
    (planet a)
    (planet d)
    (province b)
    (province d)
  )
  (:goal
    (and
      (craves b d)
      (craves c a)
    )
  )
)