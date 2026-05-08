(define (problem mysteryblocksworld5-instance)
  (:domain mystery_blocksworld)
  (:objects
    a b c d - obj
  )
  (:init
    ;; initial craving relations
    (craves a d)
    (craves b c)
    (craves d b)

    ;; global facts
    (harmony)

    ;; initial planetary/provincial facts
    (planet c)
    (province a)
  )
  (:goal
    (craves a c)
  )
)