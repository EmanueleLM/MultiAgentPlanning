(define (problem mystery_blocksworld16_problem)
  (:domain mystery_blocksworld16)
  (:objects
    a b c d - object
  )
  (:init
    ;; initial craving relations
    (craves a c)
    (craves b a)
    (craves d b)

    ;; global state
    (harmony)

    ;; named planet and province facts as given
    (planet c)
    (province d)
  )
  (:goal (and
    (craves b c)
    (craves c d)
  ))
)