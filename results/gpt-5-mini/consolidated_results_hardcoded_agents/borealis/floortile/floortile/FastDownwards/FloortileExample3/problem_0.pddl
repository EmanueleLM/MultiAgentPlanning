(define (problem p04-442)
  (:domain floor-tile)

  (:objects
    robot1 robot2 - robot
    tile_0-0 tile_0-1 tile_0-2 tile_0-3 tile_0-4
    tile_1-0 tile_1-1 tile_1-2 tile_1-3 tile_1-4
    tile_2-0 tile_2-1 tile_2-2 tile_2-3 tile_2-4
    tile_3-0 tile_3-1 tile_3-2 tile_3-3 tile_3-4
    tile_4-0 tile_4-1 tile_4-2 tile_4-3 tile_4-4 - tile
    white black - color
  )

  (:init
    ; robot initial positions
    (at robot1 tile_0-0)
    (at robot2 tile_4-4)

    ; robot held colors
    (hascolor robot1 white)
    (hascolor robot2 white)

    ; available colors
    (color white)
    (color black)

    ; clear tiles (all except occupied tile_0-0 and tile_4-4)
    (clear tile_0-1) (clear tile_0-2) (clear tile_0-3) (clear tile_0-4)
    (clear tile_1-0) (clear tile_1-1) (clear tile_1-2) (clear tile_1-3) (clear tile_1-4)
    (clear tile_2-0) (clear tile_2-1) (clear tile_2-2) (clear tile_2-3) (clear tile_2-4)
    (clear tile_3-0) (clear tile_3-1) (clear tile_3-2) (clear tile_3-3) (clear tile_3-4)
    (clear tile_4-0) (clear tile_4-1) (clear tile_4-2) (clear tile_4-3)

    ; adjacency facts expanded (as provided)
    ; Row 0
    (right tile_0-0 tile_0-1)
    (right tile_0-1 tile_0-2)
    (right tile_0-2 tile_0-3)
    (right tile_0-3 tile_0-4)
    (down tile_0-0 tile_1-0)
    (down tile_0-1 tile_1-1)
    (down tile_0-2 tile_1-2)
    (down tile_0-3 tile_1-3)
    (down tile_0-4 tile_1-4)

    ; Row 1
    (left tile_1-1 tile_1-0)
    (right tile_1-0 tile_1-1)
    (right tile_1-1 tile_1-2)
    (right tile_1-2 tile_1-3)
    (right tile_1-3 tile_1-4)
    (up tile_1-0 tile_0-0)
    (up tile_1-1 tile_0-1)
    (up tile_1-2 tile_0-2)
    (up tile_1-3 tile_0-3)
    (up tile_1-4 tile_0-4)
    (down tile_1-0 tile_2-0)
    (down tile_1-1 tile_2-1)
    (down tile_1-2 tile_2-2)
    (down tile_1-3 tile_2-3)
    (down tile_1-4 tile_2-4)

    ; Row 2
    (left tile_2-1 tile_2-0)
    (right tile_2-0 tile_2-1)
    (right tile_2-1 tile_2-2)
    (right tile_2-2 tile_2-3)
    (right tile_2-3 tile_2-4)
    (up tile_2-0 tile_1-0)
    (up tile_2-1 tile_1-1)
    (up tile_2-2 tile_1-2)
    (up tile_2-3 tile_1-3)
    (up tile_2-4 tile_1-4)
    (down tile_2-0 tile_3-0)
    (down tile_2-1 tile_3-1)
    (down tile_2-2 tile_3-2)
    (down tile_2-3 tile_3-3)
    (down tile_2-4 tile_3-4)

    ; Row 3
    (left tile_3-1 tile_3-0)
    (right tile_3-0 tile_3-1)
    (right tile_3-1 tile_3-2)
    (right tile_3-2 tile_3-3)
    (right tile_3-3 tile_3-4)
    (up tile_3-0 tile_2-0)
    (up tile_3-1 tile_2-1)
    (up tile_3-2 tile_2-2)
    (up tile_3-3 tile_2-3)
    (up tile_3-4 tile_2-4)
    (down tile_3-0 tile_4-0)
    (down tile_3-1 tile_4-1)
    (down tile_3-2 tile_4-2)
    (down tile_3-3 tile_4-3)
    (down tile_3-4 tile_4-4)

    ; Row 4
    (left tile_4-1 tile_4-0)
    (right tile_4-0 tile_4-1)
    (right tile_4-1 tile_4-2)
    (right tile_4-2 tile_4-3)
    (right tile_4-3 tile_4-4)
    (up tile_4-0 tile_3-0)
    (up tile_4-1 tile_3-1)
    (up tile_4-2 tile_3-2)
    (up tile_4-3 tile_3-3)
    (up tile_4-4 tile_3-4)

    ; numeric resource: available tokens for each tile (1 means paintable / not yet consumed)
    (= (available tile_0-0) 1)
    (= (available tile_0-1) 1)
    (= (available tile_0-2) 1)
    (= (available tile_0-3) 1)
    (= (available tile_0-4) 1)
    (= (available tile_1-0) 1)
    (= (available tile_1-1) 1)
    (= (available tile_1-2) 1)
    (= (available tile_1-3) 1)
    (= (available tile_1-4) 1)
    (= (available tile_2-0) 1)
    (= (available tile_2-1) 1)
    (= (available tile_2-2) 1)
    (= (available tile_2-3) 1)
    (= (available tile_2-4) 1)
    (= (available tile_3-0) 1)
    (= (available tile_3-1) 1)
    (= (available tile_3-2) 1)
    (= (available tile_3-3) 1)
    (= (available tile_3-4) 1)
    (= (available tile_4-0) 1)
    (= (available tile_4-1) 1)
    (= (available tile_4-2) 1)
    (= (available tile_4-3) 1)
    (= (available tile_4-4) 1)

    ; total-cost starts at 0
    (= (total-cost) 0)
  )

  ; Goal: paint the subgrid tile_1-1 .. tile_4-4 in a checkerboard pattern.
  ; Pattern: (row + col) even -> white, odd -> black
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