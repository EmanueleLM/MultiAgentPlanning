(define (problem blocks_instance)
  (:domain blocks_world)

  (:objects
    orange yellow red blue - block
    table - surface
    s0 s1 s2 s3 s4 - stage
  )

  (:init
    ;; initial placement (perception)
    (on orange blue)
    (on yellow red)
    (on red table)
    (on blue table)

    ;; clearness as perceived
    (clear orange)
    (clear yellow)

    ;; single shared hand is empty
    (handempty)

    ;; explicit stage/time progression: start at s0, actions advance along succ chain
    (at-stage s0)
    (succ s0 s1)
    (succ s1 s2)
    (succ s2 s3)
    (succ s3 s4)

    ;; mark the table surface
    (is-table table)
  )

  ;; Terminal conditions: require the goal configuration to hold at the final stage.
  ;; This enforces that the planner must reach the goal after a contiguous sequence
  ;; of stage-advancing actions (no backtracking in time).
  (:goal (and
    (on red blue)
    (at-stage s4)
  ))
)