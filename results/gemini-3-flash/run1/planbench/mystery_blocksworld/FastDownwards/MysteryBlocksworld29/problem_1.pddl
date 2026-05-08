(define (problem mystery_blocksworld_29_problem)
  (:domain mystery_blocksworld_29)
  (:objects a b c d)
  (:init
    (craves a c)
    (craves b d)
    (harmony)
    (planet c)
    (planet d)
    (province a)
    (province b)
  )
  (:goal
    (and
      (craves a c)
      (craves b a)
    )
  )
)