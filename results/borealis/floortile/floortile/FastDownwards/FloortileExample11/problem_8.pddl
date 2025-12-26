(define (problem p12-542)
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
   (= (total-cost) 0)
   
   ; Robot initial state (4 facts)
   (robot-at robot1 tile_1-4)
   (robot-has robot1 white)
   (robot-at robot2 tile_2-3)
   (robot-has robot2 black)
   
   ; Available colors (2 facts)
   (available-color white)
   (available-color black)
   
   ; Tiles that are NOT clear (occupied by robots) (2 facts)
   (not-clear tile_1-4)
   (not-clear tile_2-3)
   
   ; Connectivity: T2 is immediately below T1 (R+1, C) (20 facts)
   (next-down tile_0-1 tile_1-1) (next-down tile_0-2 tile_1-2) (next-down tile_0-3 tile_1-3) (next-down tile_0-4 tile_1-4)
   (next-down tile_1-1 tile_2-1) (next-down tile_1-2 tile_2-2) (next-down tile_1-3 tile_2-3) (next-down tile_1-4 tile_2-4)
   (next-down tile_2-1 tile_3-1) (next-down tile_2-2 tile_3-2) (next-down tile_2-3 tile_3-3) (next-down tile_2-4 tile_3-4)
   (next-down tile_3-1 tile_4-1) (next-down tile_3-2 tile_4-2) (next-down tile_3-3 tile_4-3) (next-down tile_3-4 tile_4-4)
   (next-down tile_4-1 tile_5-1) (next-down tile_4-2 tile_5-2) (next-down tile_4-3 tile_5-3) (next-down tile_4-4 tile_5-4)

   ; Connectivity: T2 is immediately left of T1 (R, C+1) (18 facts)
   (next-left tile_0-1 tile_0-2) (next-left tile_0-2 tile_0-3) (next-left tile_0-3 tile_0-4)
   (next-left tile_1-1 tile_1-2) (next-left tile_1-2 tile_1-3) (next-left tile_1-3 tile_1-4)
   (next-left tile_2-1 tile_2-2) (next-left tile_2-2 tile_2-3) (next-left tile_2-3 tile_2-4)
   (next-left tile_3-1 tile_3-2) (next-left tile_3-2 tile_3-3) (next-left tile_3-3 tile_3-4)
   (next-left tile_4-1 tile_4-2) (next-left tile_4-2 tile_4-3) (next-left tile_4-3 tile_4-4)
   (next-left tile_5-1 tile_5-2) (next-left tile_5-2 tile_5-3) (next-left tile_5-3 tile_5-4)
)
 (:goal (and
    (painted tile_1-1 white) (painted tile_1-2 black) (painted tile_1-3 white) (painted tile_1-4 black)
    (painted tile_2-1 black) (painted tile_2-2 white) (painted tile_2-3 black) (painted tile_2-4 white)
    (painted tile_3-1 white) (painted tile_3-2 black) (painted tile_3-3 white) (painted tile_3-4 black)
    (painted tile_4-1 black) (painted tile_4-2 white) (painted tile_4-3 black) (painted tile_4-4 white)
    (painted tile_5-1 white) (painted tile_5-2 black) (painted tile_5-3 white) (painted tile_5-4 black)
))
 (:metric minimize (total-cost))
)