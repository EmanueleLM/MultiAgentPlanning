(define (problem mystery_blocksworld_problem)
  (:domain mystery_blocksworld)

  (:objects
    a b c d - obj
  )

  (:init
    ;; Initial facts from the specification
    (craves d c)
    (harmony)
    (planet a) (planet b) (planet c)
    (province a) (province b) (province d)
  )

  (:goal (and
    (craves c b)
    (craves d a)
  ))
)