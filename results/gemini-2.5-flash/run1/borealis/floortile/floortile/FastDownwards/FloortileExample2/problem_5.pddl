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

   (robot-at robot1 tile_2-3)
   (robot-has robot1 white)
   (robot-at robot2 tile_1-1)
   (robot-has robot2 black)

   (available-color white)
   (available-color black)

   (unpainted tile_0-1) (unpainted tile_0-2) (unpainted tile_0-3)
   (unpainted tile_1-1) (unpainted tile_1-2) (unpainted tile_1-3)
   (unpainted tile_2-1) (unpainted tile_2-2) (unpainted tile_2-3)
   (unpainted tile_3-1) (unpainted tile_3-2) (unpainted tile_3-3)
   (unpainted tile_4-1) (unpainted tile_4-2) (unpainted tile_4-3)

   (unoccupied tile_0-1) (unoccupied tile_0-2) (unoccupied tile_0-3)
   (unoccupied tile_1-2) (unoccupied tile_1-3)
   (unoccupied tile_2-1) (unoccupied tile_2-2)
   (unoccupied tile_3-1) (unoccupied tile_3-2) (unoccupied tile_3-3)
   (unoccupied tile_4-1) (unoccupied tile_4-2) (unoccupied tile_4-3)

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