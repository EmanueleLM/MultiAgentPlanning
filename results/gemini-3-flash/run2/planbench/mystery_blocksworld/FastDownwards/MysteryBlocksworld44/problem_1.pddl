(define (problem mystery_blocksworld44)
  (:domain mystery_blocksworld)
  (:objects
    a b c d - obj
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
      (craves b c)
    )
  )
)