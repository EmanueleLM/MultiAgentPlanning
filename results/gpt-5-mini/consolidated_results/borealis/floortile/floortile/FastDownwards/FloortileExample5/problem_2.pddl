(define (problem p06-442)
  (:domain floor-tile)
  (:objects
    tile_0-1 tile_0-2 tile_0-3 tile_0-4
    tile_1-1 tile_1-2 tile_1-3 tile_1-4
    tile_2-1 tile_2-2 tile_2-3 tile_2-4
    tile_3-1 tile_3-2 tile_3-3 tile_3-4
    tile_4-1 tile_4-2 tile_4-3 tile_4-4 - tile
    robot1 robot2 - robot
    white black - color
  )

  (:init
    (= (total-cost) 0)

    ;; robot initial locations and colors
    (robot-at robot1 tile_1-1)
    (robot-has robot1 white)
    (robot-at robot2 tile_0-3)
    (robot-has robot2 black)

    ;; colors available
    (available-color white)
    (available-color black)

    ;; clear tiles: all tiles that are not occupied initially
    ;; (omit clear for occupied tiles tile_1-1 and tile_0-3)
    (clear tile_0-1)
    (clear tile_0-2)
    (clear tile_0-4)
    (clear tile_1-2)
    (clear tile_1-3)
    (clear tile_1-4)
    (clear tile_2-1)
    (clear tile_2-2)
    (clear tile_2-3)
    (clear tile_2-4)
    (clear tile_3-1)
    (clear tile_3-2)
    (clear tile_3-3)
    (clear tile_3-4)
    (clear tile_4-1)
    (clear tile_4-2)
    (clear tile_4-3)
    (clear tile_4-4)

    ;; adjacency: only 'up' and 'right' are enumerated.
    ;; other directions are handled by using these relations reversed in actions.

    ;; up relations (tile below -> tile above)
    (up tile_1-1 tile_0-1)
    (up tile_1-2 tile_0-2)
    (up tile_1-3 tile_0-3)
    (up tile_1-4 tile_0-4)
    (up tile_2-1 tile_1-1)
    (up tile_2-2 tile_1-2)
    (up tile_2-3 tile_1-3)
    (up tile_2-4 tile_1-4)
    (up tile_3-1 tile_2-1)
    (up tile_3-2 tile_2-2)
    (up tile_3-3 tile_2-3)
    (up tile_3-4 tile_2-4)
    (up tile_4-1 tile_3-1)
    (up tile_4-2 tile_3-2)
    (up tile_4-3 tile_3-3)
    (up tile_4-4 tile_3-4)

    ;; right relations (tile -> its right neighbor)
    (right tile_0-1 tile_0-2)
    (right tile_0-2 tile_0-3)
    (right tile_0-3 tile_0-4)
    (right tile_1-1 tile_1-2)
    (right tile_1-2 tile_1-3)
    (right tile_1-3 tile_1-4)
    (right tile_2-1 tile_2-2)
    (right tile_2-2 tile_2-3)
    (right tile_2-3 tile_2-4)
    (right tile_3-1 tile_3-2)
    (right tile_3-2 tile_3-3)
    (right tile_3-3 tile_3-4)
    (right tile_4-1 tile_4-2)
    (right tile_4-2 tile_4-3)
    (right tile_4-3 tile_4-4)
  )

  (:goal (and
    (painted tile_1-1 white)
    (painted tile_1-2 black)
    (painted tile_1-3 white)
    (painted tile_1-4 black)
    (painted tile_2-1 black)
    (painted tile_2-2 white)
    (painted tile_2-3 black)
    (painted tile_2-4 white)
    (painted tile_3-1 white)
    (painted tile_3-2 black)
    (painted tile_3-3 white)
    (painted tile_3-4 black)
    (painted tile_4-1 black)
    (painted tile_4-2 white)
    (painted tile_4-3 black)
    (painted tile_4-4 white)
  ))

  (:metric minimize (total-cost))
)