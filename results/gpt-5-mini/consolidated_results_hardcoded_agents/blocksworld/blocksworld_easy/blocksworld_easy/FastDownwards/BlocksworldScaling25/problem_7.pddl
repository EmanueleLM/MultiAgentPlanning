(define (problem blocksworld_goal_blue_on_yellow_orange_on_red)
  (:domain blocksworld_strict)
  (:objects
    blue yellow orange red - block
    table0 - table
    s0 s1 s2 s3 s4 - stage
  )

  (:init
    ;; all blocks start on the table and are clear (no block on top and not held)
    (on-table blue table0)
    (on-table yellow table0)
    (on-table orange table0)
    (on-table red table0)

    (clear blue)
    (clear yellow)
    (clear orange)
    (clear red)

    ;; robot initially empty-handed
    (handempty)

    ;; explicit linear ordering of stages/timepoints and initial active stage
    (next s0 s1)
    (next s1 s2)
    (next s2 s3)
    (next s3 s4)
    (stage-active s0)
  )

  (:goal (and
    (on blue yellow)
    (on orange red)
  ))
)