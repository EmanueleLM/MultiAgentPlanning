(define (problem orchestrator-problem)
  (:domain orchestrator)
  (:objects a b c d - entity)
  (:init
    ;; Initial cravings
    (craves a d)
    (craves d c)

    ;; Initial global harmony
    (harmony)

    ;; Initial planet status
    (planet b)
    (planet c)

    ;; Initial province status
    (province a)
    (province b)
  )
  (:goal (and
    (craves b c)
    (craves d a)
  ))
)