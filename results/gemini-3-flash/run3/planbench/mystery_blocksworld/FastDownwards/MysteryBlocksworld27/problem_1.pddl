(define (problem mystery_blocksworld_27_problem)
  (:domain mystery_blocksworld_27)
  (:objects
    a b c d - obj
  )
  (:init
    (harmony)
    (craves a d)
    (craves c b)
    (planet b)
    (planet d)
    (province a)
    (province c)
  )
  (:goal
    (and
      (craves b a)
      (craves c b)
      (craves d c)
    )
  )
)