(define (problem mystery_blocksworld_18)
  (:domain mystery_blocksworld)
  (:objects
    a b c d - object
  )
  (:init
    (harmony)
    (craves b d)
    (craves c a)
    (planet a)
    (planet d)
    (province b)
    (province c)
  )
  (:goal
    (and
      (craves b a)
      (craves c d)
      (craves d b)
    )
  )
)