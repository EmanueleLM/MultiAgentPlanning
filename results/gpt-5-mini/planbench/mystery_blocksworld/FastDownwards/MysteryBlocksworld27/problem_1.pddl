(define (problem mystery_blocksworld27-problem)
  (:domain mystery_blocksworld27)

  (:objects
    a b c d - obj
  )

  (:init
    ;; Initial craves relations
    (craves a d)
    (craves c b)

    ;; Global state
    (harmony)

    ;; Planets
    (planet b)
    (planet d)

    ;; Provinces
    (province a)
    (province c)
  )

  (:goal (and
    (craves b a)
    (craves c b)
    (craves d c)
  ))
)