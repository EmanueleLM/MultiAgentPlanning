(define (problem scenario1)
  (:domain blocks-world)
  ; Scenario 1 (planner_a)
  ; Blocks present: orange, yellow, blue, red
  ; Assumptions / notes:
  ; - "put down" is interpreted as placing the block onto the table => (ontable ?b).
  ; - A block that has another block on it is not (clear). Clear facts below reflect that.
  (:objects orange yellow blue red - block)

  (:init
    ; Initial facts from scenario A:
    (on orange blue)
    (on yellow red)
    (ontable red)
    (ontable blue)
    (clear orange)
    (clear yellow)
    (handempty)
    ; Implicit negatives (not asserted): orange and yellow are not on the table,
    ; blue and red are not clear because they have blocks on them initially.
  )

  (:goal
    (and
      (on red blue)
    )
  )
)