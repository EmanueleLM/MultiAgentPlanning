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

   ; Initial clear tiles
   ; All tiles except tile_1-1 and tile_2-3 are clear and unpainted.
   ; tile_1-1 and tile_2-3 are occupied by robots, hence not clear.
   (clear tile_0-1) (clear tile_0-2) (clear tile_0-3)
   ; tile_1-1 is occupied
   (clear tile_1-2) (clear tile_1-3)
   (clear tile_2-1) (clear tile_2-2)
   ; tile_2-3 is occupied
   (clear tile_3-1) (clear tile_3-2) (clear tile_3-3)
   (clear tile_4-1) (clear tile_4-2) (clear tile_4-3)

   ; Grid connectivity
   ; Up relations (from tile_x to tile_y where tile_y is above tile_x)
   (up tile_1-1 tile_0-1) (up tile_1-2 tile_0-2) (up tile_1-3 tile_0-3)
   (up tile_2-1 tile_1-1) (up tile_2-2 tile_1-2) (up tile_2-3 tile_1-3)
   (up tile_3-1 tile_2-1) (up tile_3-2 tile_2-2) (up tile_3-3 tile_2-3)
   (up tile_4-1 tile_3-1) (up tile_4-2 tile_3-2) (up tile_4-3 tile_3-3)

   ; Down relations (from tile_x to tile_y where tile_y is below tile_x)
   (down tile_0-1 tile_1-1) (down tile_0-2 tile_1-2) (down tile_0-3 tile_1-3)
   (down tile_1-1 tile_2-1) (down tile_1-2 tile_2-2) (down tile_1-3 tile_2-3)
   (down tile_2-1 tile_3-1) (down tile_2-2 tile_3-2) (down tile_2-3 tile_3-3)
   (down tile_3-1 tile_4-1) (down tile_3-2 tile_4-2) (down tile_3-3 tile_4-3)

   ; Right relations (from tile_x to tile_y where tile_y is to the right of tile_x)
   ; The problem template seems to define (right tile_Y tile_X) meaning tile_X is to the right of tile_Y.
   ; Let's re-verify: "right tile_0-2 tile_0-1" -> if 0-1 is right of 0-2, this is consistent.
   ; (right current-tile adjacent-tile) where adjacent-tile is to the right.
   ; The input seems reversed for right/left compared to up/down. I'll follow the template's structure.
   ; For `right tile_0-2 tile_0-1`, if a robot is at 0-2, it moves to 0-1 (which is to its right).
   ; If the template implies (right A B) means B is to the right of A, then this is correct.
   ; Standard interpretation: (right ?from ?to) means ?to is to the right of ?from.
   ; The template has: (right tile_0-2 tile_0-1) (right tile_0-3 tile_0-2)
   ; This means if you are at 0-2, you can move to 0-1 (right). If at 0-3, you can move to 0-2 (right).
   ; This means the X coordinate is decreasing when moving "right" which seems counter-intuitive based on typical grid indexing.
   ; However, I must preserve object identity and relation exactness.
   ; Let's assume the template defines adjacency as given, not interpreting it geographically.
   (right tile_0-2 tile_0-1) (right tile_0-3 tile_0-2)
   (right tile_1-2 tile_1-1) (right tile_1-3 tile_1-2)
   (right tile_2-2 tile_2-1) (right tile_2-3 tile_2-2)
   (right tile_3-2 tile_3-1) (right tile_3-3 tile_3-2)
   (right tile_4-2 tile_4-1) (right tile_4-3 tile_4-2)

   ; Left relations (from tile_x to tile_y where tile_y is to the left of tile_x)
   ; (left current-tile adjacent-tile) where adjacent-tile is to the left.
   ; The template has: (left tile_0-1 tile_0-2) (left tile_0-2 tile_0-3)
   ; This means if you are at 0-1, you can move to 0-2 (left). If at 0-2, you can move to 0-3 (left).
   ; This means the X coordinate is increasing when moving "left" which is also counter-intuitive.
   ; I will keep it as defined in the template.
   (left tile_0-1 tile_0-2) (left tile_0-2 tile_0-3)
   (left tile_1-1 tile_1-2) (left tile_1-2 tile_1-3)
   (left tile_2-1 tile_2-2) (left tile_2-2 tile_2-3)
   (left tile_3-1 tile_3-2) (left tile_3-2 tile_3-3)
   (left tile_4-1 tile_4-2) (left tile_4-2 tile_4-3)
 )
 (:goal (and
    (painted tile_1-1 white)
    (painted tile_1-2 black)
    (painted tile_1-3 white)
    (painted tile_2-1 black)
    (painted tile_2-2 white)
    (painted tile_2-3 black)
    (painted tile_3-1 white)
    (painted tile_3-2 black)
    (painted tile_3-3 white)
    (painted tile_4-1 black)
    (painted tile_4-2 white)
    (painted tile_4-3 black)
 ))
 (:metric minimize (total-cost))
)