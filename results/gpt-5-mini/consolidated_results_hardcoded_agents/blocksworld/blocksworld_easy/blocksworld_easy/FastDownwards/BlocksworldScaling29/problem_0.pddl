(define (problem blocks-task-orchestrator)
  (:domain blocks-world-orchestrator)
  (:objects blue orange yellow - block)

  (:init
    ;; initial layout: all blocks on the table and clear, single free hand
    (ontable blue)
    (ontable orange)
    (ontable yellow)
    (clear blue)
    (clear orange)
    (clear yellow)
    (handempty)
    ;; phase1-done is intentionally absent initially (false)
  )

  ;; Goal: blue on orange and yellow on blue. The domain enforces the required ordering
  ;; (blue on orange before yellow on blue) via phase1-done, which is produced only
  ;; by stack-blue-on-orange.
  (:goal (and
    (on blue orange)
    (on yellow blue)
  ))
)