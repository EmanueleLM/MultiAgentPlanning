(define (problem p12-542)
 (:domain floor-tile)
 (:objects tile_0-1 tile_0-2 tile_0-3 tile_0-4 
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
   
   ; Clear tiles (22 facts: all except tile_1-4 and tile_2-3, where robots start)
   (clear tile_0-1) (clear tile_0-2) (clear tile_0-3) (clear tile_0-4) 
   (clear tile_1-1) (clear tile_1-2) (clear tile_1-3) 
   (clear tile_2-1) (clear tile_2-2) (clear tile_2-4) 
   (clear tile_3-1) (clear tile_3-2) (clear tile_3-3) (clear tile_3-4) 
   (clear tile_4-1) (clear tile_4-2) (clear tile_4-3) (clear tile_4-4) 
   (clear tile_5-1) (clear tile_5-2) (clear tile_5-3) (clear tile_5-4)
   
   ; Connectivity (38 facts total, replacing 76 symmetric facts)
   
   ; Next Down (T1 T2) - T2 is below T1 (20 facts)
   (next-down tile_0-1 tile_1-1) (next-down tile_0-2 tile_1-2) (next-down tile_0-3 tile_1-3) (next-down tile_0-4 tile_1-4)
   (next-down tile_1-1 tile_2-1) (next-down tile_1-2 tile_2-2) (next-down tile_1-3 tile_2-3) (next-down tile_1-4 tile_2-4)
   (next-down tile_2-1 tile_3-1) (next-down tile_2-2 tile_3-2) (next-down tile_2-3 tile_3-3) (next-down tile_2-4 tile_3-4)
   (next-down tile_3-1 tile_4-1) (next-down tile_3-2 tile_4-2) (next-down tile_3-3 tile_4-3) (next-down tile_3-4 tile_4-4)
   (next-down tile_4-1 tile_5-1) (next-down tile_4-2 tile_5-2) (next-down tile_4-3 tile_5-3) (next-down tile_4-4 tile_5-4)

   ; Next Left (T1 T2) - T2 is left of T1 (18 facts)
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