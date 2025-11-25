(define (problem move-yellow-on-orange)
  (:domain orchestrator-blocks)
  (:objects
    orange yellow blue red - block
  )
  (:init
    ;; initial spatial relations
    (on blue red)
    (on orange blue)
    (ontable red)
    (ontable yellow)

    ;; initial clear / holding / hand state
    (clear orange)
    (clear yellow)
    (handempty)

    ;; Note: any predicate not listed is false by closed-world assumption,
    ;; e.g., clear blue and clear red are false because things are on them.
  )
  (:goal (and
    (on blue red)
    (on yellow orange)
  ))
)