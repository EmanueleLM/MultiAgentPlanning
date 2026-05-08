(define (problem mystery_blocksworld5_problem)
  (:domain mystery_blocksworld5)

  (:objects
    a b c d - obj
  )

  (:init
    ;; initial craving relations
    (craves a d)
    (craves b c)
    (craves d b)

    ;; global state and location/world facts
    (harmony)
    (planet c)
    (province a)
  )

  (:goal (craves a c))
)