(define (problem make-tower)
  (:domain stacking-multiagent)
  (:objects
    red blue orange yellow - block
    orchestrator - agent
  )

  ;; Minimal initial facts consistent with the specified initial stacking:
  ;; orange is clear, the hand is empty,
  ;; blue on yellow, orange on blue, yellow on red, and red on the table.
  (:init
    (on blue yellow)
    (on orange blue)
    (on yellow red)
    (ontable red)

    (clear orange)

    (handempty orchestrator)
  )

  (:goal
    (and
      (on red yellow)
      (on orange red)
      (on blue orange)
    )
  )
)