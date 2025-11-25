(define (problem blocks-unstacker-problem)
  (:domain blocks-multiagent)
  (:objects
    orange yellow red blue - block
  )
  (:init
    ;; single-hand initial condition
    (hand-empty)

    ;; table and stack initial configuration
    (on-table orange)
    (on-table blue)
    (on yellow red)
    (on red blue)

    ;; clear-status initial facts (consistent with the stacks above)
    (clear orange)
    (clear yellow)
  )
  (:goal (and
           (on red orange)
           (on orange blue)
         ))
)