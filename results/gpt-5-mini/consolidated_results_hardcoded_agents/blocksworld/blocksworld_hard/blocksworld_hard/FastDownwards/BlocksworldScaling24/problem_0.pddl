(define (problem make-tower)
  (:domain stacking-multiagent)
  ;; Objects
  (:objects
    red blue orange yellow - block
    orchestrator - agent
  )

  ;; Initial state:
  ;; - All blocks are on the table and clear.
  ;; - The orchestrator's hand is empty.
  ;; Note: no initial on relations among blocks (all separate).
  (:init
    (ontable red)
    (ontable blue)
    (ontable orange)
    (ontable yellow)

    (clear red)
    (clear blue)
    (clear orange)
    (clear yellow)

    (handempty orchestrator)
  )

  ;; Goal: enforce the exact required stacking relationships as hard terminal conditions:
  ;; - red on top of yellow
  ;; - orange on top of red
  ;; - blue on top of orange
  ;; These three facts together produce the single tower (top to bottom): blue, orange, red, yellow.
  (:goal
    (and
      (on red yellow)
      (on orange red)
      (on blue orange)
    )
  )
)