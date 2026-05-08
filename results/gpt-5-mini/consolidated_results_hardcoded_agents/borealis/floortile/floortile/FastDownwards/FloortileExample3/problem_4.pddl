(define (problem p04-442)
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
   ;; numeric fluent
   (= (total-cost) 0)

   ;; robot initial positions and colors
   (at robot1 tile_0-3)
   (hascolor robot1 white)
   (at robot2 tile_3-4)
   (hascolor robot2 black)

   ;; available colors
   (available-color white)
   (available-color black)

   ;; clear tiles: all tiles except those currently occupied by robots are clear
   (clear tile_0-1)
   (clear tile_0-2)
   ; tile_0-3 has robot1 -> not clear
   (clear tile_0-4)

   (clear tile_1-1)
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
   ; tile_3-4 has robot2 -> not clear

   (clear tile_4-1)
   (clear tile_4-2)
   (clear tile_4-3)
   (clear tile_4-4)

   ;; adjacency relations (up: ?to is above ?from)
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

   ;; adjacency relations (right: ?to is to the right of ?from)
   (right tile_0-2 tile_0-1)
   (right tile_0-3 tile_0-2)
   (right tile_0-4 tile_0-3)
   (right tile_1-2 tile_1-1)
   (right tile_1-3 tile_1-2)
   (right tile_1-4 tile_1-3)
   (right tile_2-2 tile_2-1)
   (right tile_2-3 tile_2-2)
   (right tile_2-4 tile_2-3)
   (right tile_3-2 tile_3-1)
   (right tile_3-3 tile_3-2)
   (right tile_3-4 tile_3-3)
   (right tile_4-2 tile_4-1)
   (right tile_4-3 tile_4-2)
   (right tile_4-4 tile_4-3)
 )

 (:goal (and
    (painted-with tile_1-1 white)
    (painted-with tile_1-2 black)
    (painted-with tile_1-3 white)
    (painted-with tile_1-4 black)
    (painted-with tile_2-1 black)
    (painted-with tile_2-2 white)
    (painted-with tile_2-3 black)
    (painted-with tile_2-4 white)
    (painted-with tile_3-1 white)
    (painted-with tile_3-2 black)
    (painted-with tile_3-3 white)
    (painted-with tile_3-4 black)
    (painted-with tile_4-1 black)
    (painted-with tile_4-2 white)
    (painted-with tile_4-3 black)
    (painted-with tile_4-4 white)
 ))

 (:metric minimize (total-cost))
)