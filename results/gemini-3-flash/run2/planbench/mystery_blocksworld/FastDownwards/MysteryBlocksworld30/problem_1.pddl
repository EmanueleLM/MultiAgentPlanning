(define (problem mystery_30)
  (:domain mystery_blocksworld)
  (:objects a b c d)
  (:init
    (craves a d)
    (craves c b)
    (harmony)
    (planet b)
    (planet d)
    (province a)
    (province c)
  )
  (:goal
    (and
      (craves a d)
      (craves d c)
    )
  )
)