(define (problem blocks-instance)
  (:domain blocks-orchestrator)
  (:objects
    orchestrator - agent
    red blue orange yellow - block
  )

  ;; Initial facts:
  ;; red clear, blue clear, orange clear, hand empty,
  ;; orange on yellow, red on table, blue on table, yellow on table
  (:init
    (clear red)
    (clear blue)
    (clear orange)
    (handempty orchestrator)
    (on orange yellow)
    (on-table red)
    (on-table blue)
    (on-table yellow)
  )

  ;; Goal: red on blue and orange on red
  (:goal (and (on red blue) (on orange red)))
)