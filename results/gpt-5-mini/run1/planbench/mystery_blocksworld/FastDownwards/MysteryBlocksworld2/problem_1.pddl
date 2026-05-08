(define (problem mysteryblocksworld2-instance)
  (:domain mystery-blocksworld)
  (:objects
    a b c d - obj
  )
  (:init
    ;; initial craves relations
    (craves a c)
    (craves c b)
    (craves d a)

    ;; initial structural facts
    (harmony)
    (planet b)
    (province d)
    ;; no pain facts initially
  )
  (:goal (and
    (craves a d)
    (craves d b)
  ))
)