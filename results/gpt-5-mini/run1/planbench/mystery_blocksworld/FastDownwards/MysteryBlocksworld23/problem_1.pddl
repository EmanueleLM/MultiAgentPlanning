(define (problem mysteryblocksworld23-instance)
  (:domain mystery_blocksworld)

  (:objects
    a b c d - obj
  )

  (:init
    (craves b a)
    (craves d b)
    (harmony)
    (planet a)
    (planet c)
    (province c)
    (province d)
  )

  (:goal
    (and
      (craves b d)
    )
  )
)