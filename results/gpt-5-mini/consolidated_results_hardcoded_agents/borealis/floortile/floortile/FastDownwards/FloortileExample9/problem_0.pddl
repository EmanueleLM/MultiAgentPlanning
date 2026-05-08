(define (problem p-floor-tile)
  (:domain floor-tile)

  (:objects
    tile_0-1 tile_0-2 tile_0-3 tile_0-4
    tile_1-1 tile_1-2 tile_1-3 tile_1-4
    tile_2-1 tile_2-2 tile_2-3 tile_2-4
    tile_3-1 tile_3-2 tile_3-3 tile_3-4
    tile_4-1 tile_4-2 tile_4-3 tile_4-4
    tile_5-1 tile_5-2 tile_5-3 tile_5-4 - tile
    robot1 robot2 - robot
    white black - color
  )

  (:init
    ;; available colors
    (available-color white)
    (available-color black)

    ;; initial robot locations and carried colors
    (robot-at robot1 tile_1-3)
    (robot-at robot2 tile_1-1)
    (occupied tile_1-3)
    (occupied tile_1-1)
    (robot-has robot1 white)
    (robot-has robot2 black)

    ;; all tiles initially clear (unpainted)
    (clear tile_0-1) (clear tile_0-2) (clear tile_0-3) (clear tile_0-4)
    (clear tile_1-1) (clear tile_1-2) (clear tile_1-3) (clear tile_1-4)
    (clear tile_2-1) (clear tile_2-2) (clear tile_2-3) (clear tile_2-4)
    (clear tile_3-1) (clear tile_3-2) (clear tile_3-3) (clear tile_3-4)
    (clear tile_4-1) (clear tile_4-2) (clear tile_4-3) (clear tile_4-4)
    (clear tile_5-1) (clear tile_5-2) (clear tile_5-3) (clear tile_5-4)

    ;; no tiles painted initially (painted facts absent)

    ;; adjacency: can-move-up (row r -> r+1) for rows 1..3, cols 0..5
    (can-move-up tile_0-1 tile_0-2) (can-move-up tile_0-2 tile_0-3) (can-move-up tile_0-3 tile_0-4)
    (can-move-up tile_1-1 tile_1-2) (can-move-up tile_1-2 tile_1-3) (can-move-up tile_1-3 tile_1-4)
    (can-move-up tile_2-1 tile_2-2) (can-move-up tile_2-2 tile_2-3) (can-move-up tile_2-3 tile_2-4)
    (can-move-up tile_3-1 tile_3-2) (can-move-up tile_3-2 tile_3-3) (can-move-up tile_3-3 tile_3-4)
    (can-move-up tile_4-1 tile_4-2) (can-move-up tile_4-2 tile_4-3) (can-move-up tile_4-3 tile_4-4)
    (can-move-up tile_5-1 tile_5-2) (can-move-up tile_5-2 tile_5-3) (can-move-up tile_5-3 tile_5-4)

    ;; adjacency: can-move-down (reverse)
    (can-move-down tile_0-2 tile_0-1) (can-move-down tile_0-3 tile_0-2) (can-move-down tile_0-4 tile_0-3)
    (can-move-down tile_1-2 tile_1-1) (can-move-down tile_1-3 tile_1-2) (can-move-down tile_1-4 tile_1-3)
    (can-move-down tile_2-2 tile_2-1) (can-move-down tile_2-3 tile_2-2) (can-move-down tile_2-4 tile_2-3)
    (can-move-down tile_3-2 tile_3-1) (can-move-down tile_3-3 tile_3-2) (can-move-down tile_3-4 tile_3-3)
    (can-move-down tile_4-2 tile_4-1) (can-move-down tile_4-3 tile_4-2) (can-move-down tile_4-4 tile_4-3)
    (can-move-down tile_5-2 tile_5-1) (can-move-down tile_5-3 tile_5-2) (can-move-down tile_5-4 tile_5-3)

    ;; adjacency: can-move-right (col c -> c+1) for cols 0..4, rows 1..4
    (can-move-right tile_0-1 tile_1-1) (can-move-right tile_0-2 tile_1-2) (can-move-right tile_0-3 tile_1-3) (can-move-right tile_0-4 tile_1-4)
    (can-move-right tile_1-1 tile_2-1) (can-move-right tile_1-2 tile_2-2) (can-move-right tile_1-3 tile_2-3) (can-move-right tile_1-4 tile_2-4)
    (can-move-right tile_2-1 tile_3-1) (can-move-right tile_2-2 tile_3-2) (can-move-right tile_2-3 tile_3-3) (can-move-right tile_2-4 tile_3-4)
    (can-move-right tile_3-1 tile_4-1) (can-move-right tile_3-2 tile_4-2) (can-move-right tile_3-3 tile_4-3) (can-move-right tile_3-4 tile_4-4)
    (can-move-right tile_4-1 tile_5-1) (can-move-right tile_4-2 tile_5-2) (can-move-right tile_4-3 tile_5-3) (can-move-right tile_4-4 tile_5-4)

    ;; adjacency: can-move-left (reverse)
    (can-move-left tile_1-1 tile_0-1) (can-move-left tile_1-2 tile_0-2) (can-move-left tile_1-3 tile_0-3) (can-move-left tile_1-4 tile_0-4)
    (can-move-left tile_2-1 tile_1-1) (can-move-left tile_2-2 tile_1-2) (can-move-left tile_2-3 tile_1-3) (can-move-left tile_2-4 tile_1-4)
    (can-move-left tile_3-1 tile_2-1) (can-move-left tile_3-2 tile_2-2) (can-move-left tile_3-3 tile_2-3) (can-move-left tile_3-4 tile_2-4)
    (can-move-left tile_4-1 tile_3-1) (can-move-left tile_4-2 tile_3-2) (can-move-left tile_4-3 tile_3-3) (can-move-left tile_4-4 tile_3-4)
    (can-move-left tile_5-1 tile_4-1) (can-move-left tile_5-2 tile_4-2) (can-move-left tile_5-3 tile_4-3) (can-move-left tile_5-4 tile_4-4)

    ;; initial total cost
    (= (total-cost) 0)
  )

  ;; GOAL: paint specific tiles with specified colors.
  ;; (This problem encodes the painting tasks that are explicitly referenced in agent reports:
  ;; tile_1-4 must be white-painted, and tile_1-2 must be black-painted.)
  (:goal (and
    (painted tile_1-4 white)
    (painted tile_1-2 black)
  ))

  (:metric minimize (total-cost))
)