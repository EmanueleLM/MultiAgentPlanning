(define (problem scenario1)
  (:domain blocks-world)
  ; Scenario 1 (planner_a)
  ; Blocks present: orange, yellow, blue, red
  ; Assumptions/notes:
  ; - "put-down" in the planner report was used to mean placing a block on the table.
  ; - No other predicates (e.g., extra clear facts) beyond those listed in the report are asserted.
  ; - Table is represented via the predicate (ontable ?b).
  (:objects orange yellow blue red - block)

  (:init
    ; Initial facts from planner_a report:
    (on orange blue)
    (on yellow red)
    (ontable red)
    (ontable blue)
    (clear orange)
    (clear yellow)
    (handempty)
    ; Note: clear(blue) and clear(red) are intentionally not asserted because
    ; orange is on blue and yellow is on red in the initial state.
  )

  (:goal
    (and
      (on red blue)
    )
  )
)