(define (problem feast-attack-toggle-problem)
  (:domain feast-attack-toggle)
  (:objects
    a b c d - object
  )

  (:init
    ;; Initial crave relations and global state (as given in the human specification)
    (craves a b)
    (craves b d)
    (harmony)

    ;; Initial planet facts
    (planet c)
    (planet d)

    ;; Initial province holdings
    (province a)
    (province c)
  )

  (:goal (and
    (craves b d)
    (craves c a)
    (craves d c)
  ))
)