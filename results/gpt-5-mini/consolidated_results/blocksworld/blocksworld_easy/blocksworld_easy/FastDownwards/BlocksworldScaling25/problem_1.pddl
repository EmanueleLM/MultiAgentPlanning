(define (problem blocksworld_goal_blue_on_yellow_orange_on_red)
  (:domain blocksworld_merged)
  (:objects
    blue yellow orange red table s0 s1 s2 s3 s4 - obj
  )

  (:init
    ;; Identify blocks and table
    (block blue)
    (block yellow)
    (block orange)
    (block red)
    (table table)

    ;; Stage objects and ordering (explicit sequencing)
    (stage s0)
    (stage s1)
    (stage s2)
    (stage s3)
    (stage s4)
    (next s0 s1)
    (next s1 s2)
    (next s2 s3)
    (next s3 s4)
    (stage-active s0)

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
  )

  (:goal (and
    ;; Mandated terminal conditions: blue on yellow AND orange on red
    (on blue yellow)
    (on orange red)
  ))
)