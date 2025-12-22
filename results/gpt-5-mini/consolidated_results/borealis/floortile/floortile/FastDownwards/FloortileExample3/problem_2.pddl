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
   (= (total-cost) 0)

   ; robot initial positions and held colors (occupied maintained for those tiles)
   (at robot1 tile_0-3)
   (hascolor robot1 white)
   (occupied tile_0-3)

   (at robot2 tile_3-4)
   (hascolor robot2 black)
   (occupied tile_3-4)

   ; adjacency: only canonical directions (up and right); inverse moves use these facts with swapped args
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