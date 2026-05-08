(define (problem mystery_blocksworld_43)
  (:domain mystery_blocksworld)
  (:objects
    a b c d - obj
  )
  (:init
    (harmony)
    (craves c a)
    (planet a)
    (planet b)
    (planet d)
    (province b)
    (province c)
    (province d)
  )
  (:goal
    (and
      (craves b c)
      (craves d b)
    )
  )
)