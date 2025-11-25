(define (problem blocks-problem-ordered)
  (:domain blocks-world-ordered)
  (:objects
    red orange blue yellow - block
  )
  (:init
    ;; initial block configuration
    (on blue yellow)
    (on orange blue)
    (ontable red)
    (ontable yellow)

    ;; clear semantics as given (clear means: no block on top AND not held)
    (clear red)
    (clear orange)

    ;; single hand initial state
    (handempty)

    ;; start at phase1 to force the domain's linear ordering of the six actions
    (phase1)
  )
  (:goal (and
    (on red orange)
    (on blue red)
    (phase7)
  ))
)