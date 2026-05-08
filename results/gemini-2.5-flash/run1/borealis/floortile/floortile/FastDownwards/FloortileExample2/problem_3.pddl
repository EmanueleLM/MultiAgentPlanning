(define (problem p03-432)
 (:domain floor-tile)
 (:objects
   tile_0-1 tile_0-2 tile_0-3
   tile_1-1 tile_1-2 tile_1-3
   tile_2-1 tile_2-2 tile_2-3
   tile_3-1 tile_3-2 tile_3-3
   tile_4-1 tile_4-2 tile_4-3 - tile
   robot1 robot2 - robot
   white black - color
 )
 (:init
   (= (total-cost) 0)

   ; Robot initial positions and colors
   (robot-at robot1 tile_2-3)
   (robot-has robot1 white)
   (robot-at robot2 tile_1-1)
   (robot-has robot2 black)

   ; Available colors
   (available-color white)
   (available-color black)

   ; Tile paint status - All tiles are initially unpainted.
   (tile-unpainted tile_0-1) (tile-unpainted tile_0-2) (tile-unpainted tile_0-3)
   (tile-unpainted tile_1-1) (tile-unpainted tile_1-2) (tile-unpainted tile_1-3)
   (tile-unpainted tile_2-1) (tile-unpainted tile_2-2) (tile-unpainted tile_2-3)
   (tile-unpainted tile_3-1) (tile-unpainted tile_3-2) (tile-unpainted tile_3-3)
   (tile-unpainted tile_4-1) (tile-unpainted tile_4-2) (tile-unpainted tile_4-3)

   ; Tile occupancy status
   ; Tiles occupied by robots are not unoccupied initially
   (not (tile-unoccupied tile_1-1))
   (not (tile-unoccupied tile_2-3))
   ; All other tiles are unoccupied
   (tile-unoccupied tile_0-1) (tile-unoccupied tile_0-2) (tile-unoccupied tile_0-3)
   (tile-unoccupied tile_1-2) (tile-unoccupied tile_1-3)
   (tile-unoccupied tile_2-1) (tile-unoccupied tile_2-2)
   (tile-unoccupied tile_3-1) (tile-unoccupied tile_3-2) (tile-unoccupied tile_3-3)
   (tile-unoccupied tile_4-1) (tile-unoccupied tile_4-2) (tile-unoccupied tile_4-3)

   ; Grid connectivity (as provided in template)
   (up tile_1-1 tile_0-1) (up tile_1-2 tile_0-2) (up tile_1-3 tile_0-3)
   (up tile_2-1 tile_1-1) (up tile_2-2 tile_1-2) (up tile_2-3 tile_1-3)
   (up tile_3-1 tile_2-1) (up tile_3-2 tile_2-2) (up tile_3-3 tile_2-3)
   (up tile_4-1 tile_3-1) (up tile_4-2 tile_3-2) (up tile_4-3 tile_3-3)

   (down tile_0-1 tile_1-1) (down tile_0-2 tile_1-2) (down tile_0-3 tile_1-3)
   (down tile_1-1 tile_2-1) (down tile_1-2 tile_2-2) (down tile_1-3 tile_2-3)
   (down tile_2-1 tile_3-1) (down tile_2-2 tile_3-2) (down tile_2-3 tile_3-3)
   (down tile_3-1 tile_4-1) (down tile_3-2 tile_4-2) (down tile_3-3 tile_4-3)

   (right tile_0-2 tile_0-1) (right tile_0-3 tile_0-2)
   (right tile_1-2 tile_1-1) (right tile_1-3 tile_1-2)
   (right tile_2-2 tile_2-1) (right tile_2-3 tile_2-2)
   (right tile_3-2 tile_3-1) (right tile_3-3 tile_3-2)
   (right tile_4-2 tile_4-1) (right tile_4-3 tile_4-2)

   (left tile_0-1 tile_0-2) (left tile_0-2 tile_0-3)
   (left tile_1-1 tile_1-2) (left tile_1-2 tile_1-3)
   (left tile_2-1 tile_2-2) (left tile_2-2 tile_2-3)
   (left tile_3-1 tile_3-2) (left tile_3-2 tile_3-3)
   (left tile_4-1 tile_4-2) (left tile_4-2 tile_4-3)
 )
 (:goal (and
    (painted-with tile_1-1 white)
    (painted-with tile_1-2 black)
    (painted-with tile_1-3 white)
    (painted-with tile_2-1 black)
    (painted-with tile_2-2 white)
    (painted-with tile_2-3 black)
    (painted-with tile_3-1 white)
    (painted-with tile_3-2 black)
    (painted-with tile_3-3 white)
    (painted-with tile_4-1 black)
    (painted-with tile_4-2 white)
    (painted-with tile_4-3 black)
 ))
 (:metric minimize (total-cost))
)