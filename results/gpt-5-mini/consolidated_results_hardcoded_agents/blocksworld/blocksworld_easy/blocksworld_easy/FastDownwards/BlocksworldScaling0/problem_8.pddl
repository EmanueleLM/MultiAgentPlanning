(define (problem move-yellow-on-orange)
  (:domain orchestrator-blocks)
  (:objects
    orange yellow blue red - block
  )
  (:init
    ;; core tower relations (red <- blue <- orange) and the separated yellow
    (on blue red)
    (on orange blue)
    (ontable yellow)

    ;; required state flags (only those necessary to support reaching the goal)
    (clear orange)
    (clear yellow)
    (handempty)
  )
  (:goal (and
    (on blue red)
    (on yellow orange)
  ))
)