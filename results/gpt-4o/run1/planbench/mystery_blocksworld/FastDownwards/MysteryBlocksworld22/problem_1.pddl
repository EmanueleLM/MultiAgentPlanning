(define (problem mystery_blocksworld_problem)
  (:domain mystery_blocksworld)

  (:objects
    a b c d - object
  )

  (:init
    (object_craves a b)
    (object_craves b d)
    (object_craves d c)
    (harmony)
    (planet c)
    (province a)
  )

  (:goal
    (and
      (object_craves c a)
      (object_craves d b)
    )
  )
)