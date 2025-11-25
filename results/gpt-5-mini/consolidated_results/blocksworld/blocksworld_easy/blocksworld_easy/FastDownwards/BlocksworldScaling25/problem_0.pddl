(define (problem blocksworld_goal_blue_on_yellow_orange_on_red)
  (:domain blocksworld_merged)
  (:objects
    blue yellow orange red table - obj
  )

  (:init
    ;; Identify blocks and table
    (block blue)
    (block yellow)
    (block orange)
    (block red)
    (table table)

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