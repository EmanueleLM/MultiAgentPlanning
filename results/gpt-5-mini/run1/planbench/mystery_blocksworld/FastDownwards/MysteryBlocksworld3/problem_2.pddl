(define (problem mystery_blocksworld3_problem)
  (:domain mystery_blocksworld3)
  (:objects a b c d - obj)

  (:init
    (craves b a)
    (craves c b)
    (harmony)
    (planet a)
    (planet d)
    (province c)
    (province d)
  )

  (:goal (and
    (craves b a)
    (craves d c)
  ))
)