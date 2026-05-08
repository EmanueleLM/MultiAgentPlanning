(define (problem mystery_blocksworld_45)
  (:domain mystery_blocksworld)
  (:objects
    a b c d - obj
  )
  (:init
    (craves a d)
    (craves c a)
    (harmony)
    (planet b)
    (planet d)
    (province b)
    (province c)
  )
  (:goal
    (and
      (craves a d)
      (craves b a)
      (craves d c)
    )
  )
)