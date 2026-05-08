(define (problem mysteryblocksworld27)
  (:domain mystery_blocksworld)
  (:objects
    a b c d - obj
  )

  (:init
    ;; initial craves and world fluents (from the human specification)
    (craves a d)
    (craves c b)
    (harmony)
    (planet b)
    (planet d)
    (province a)
    (province c)
    ;; no initial pain
  )

  (:goal (and
    (craves b a)
    (craves c b)
    (craves d c)
  ))
)