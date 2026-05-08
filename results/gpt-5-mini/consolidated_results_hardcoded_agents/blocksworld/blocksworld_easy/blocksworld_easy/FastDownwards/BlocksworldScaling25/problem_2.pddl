(define (problem blocksworld_goal_blue_on_yellow_orange_on_red)
  (:domain blocksworld_merged)
  (:objects
    blue yellow orange red - block
    table - table
    s0 s1 s2 s3 s4 - stage
  )

  (:init
    ;; Initial placements: all blocks start on the table and are clear
    (on blue table)
    (on yellow table)
    (on orange table)
    (on red table)

    (clear blue)
    (clear yellow)
    (clear orange)
    (clear red)

    ;; Robot initially empty-handed
    (handempty)

    ;; Stage objects and ordering (explicit sequencing)
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