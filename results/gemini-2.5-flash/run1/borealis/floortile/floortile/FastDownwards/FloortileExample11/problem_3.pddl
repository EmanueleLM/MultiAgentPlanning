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
   (robot-at robot1 tile_1-4)
   (robot-has robot1 white)
   (robot-at robot2 tile_2-3)
   (robot-has robot2 black)
   (available-color white)
   (available-color black)
   ; Tiles occupied by robots are initially NOT clear.
   (clear tile_0-1) (clear tile_0-2) (clear tile_0-3) (clear tile_0-4)
   (clear tile_1-1) (clear tile_1-2) (clear tile_1-3)
   (clear tile_2-1) (clear tile_2-2) (clear tile_2-4)
   (clear tile_3-1) (clear tile_3-2) (clear tile_3-3) (clear tile_3-4)
   (clear tile_4-1) (clear tile_4-2) (clear tile_4-3) (clear tile_4-4)
   (clear tile_5-1) (clear tile_5-2) (clear tile_5-3) (clear tile_5-4)

   ; Grid connectivity facts (reduced using base predicates)
   ; (adj-vertical ?lower-t ?upper-t) means ?upper-t is directly above ?lower-t
   (adj-vertical tile_1-1 tile_0-1) (adj-vertical tile_1-2 tile_0-2) (adj-vertical tile_1-3 tile_0-3) (adj-vertical tile_1-4 tile_0-4)
   (adj-vertical tile_2-1 tile_1-1) (adj-vertical tile_2-2 tile_1-2) (adj-vertical tile_2-3 tile_1-3) (adj-vertical tile_2-4 tile_1-4)
   (adj-vertical tile_3-1 tile_2-1) (adj-vertical tile_3-2 tile_2-2) (adj-vertical tile_3-3 tile_2-3) (adj-vertical tile_3-4 tile_2-4)
   (adj-vertical tile_4-1 tile_3-1) (adj-vertical tile_4-2 tile_3-2) (adj-vertical tile_4-3 tile_3-3) (adj-vertical tile_4-4 tile_3-4)
   (adj-vertical tile_5-1 tile_4-1) (adj-vertical tile_5-2 tile_4-2) (adj-vertical tile_5-3 tile_4-3) (adj-vertical tile_5-4 tile_4-4)

   ; (adj-horizontal ?right-t ?left-t) means ?left-t is directly to the left of ?right-t
   (adj-horizontal tile_0-1 tile_0-2) (adj-horizontal tile_0-2 tile_0-3) (adj-horizontal tile_0-3 tile_0-4)
   (adj-horizontal tile_1-1 tile_1-2) (adj-horizontal tile_1-2 tile_1-3) (adj-horizontal tile_1-3 tile_1-4)
   (adj-horizontal tile_2-1 tile_2-2) (adj-horizontal tile_2-2 tile_2-3) (adj-horizontal tile_2-3 tile_2-4)
   (adj-horizontal tile_3-1 tile_3-2) (adj-horizontal tile_3-2 tile_3-3) (adj-horizontal tile_3-3 tile_3-4)
   (adj-horizontal tile_4-1 tile_4-2) (adj-horizontal tile_4-2 tile_4-3) (adj-horizontal tile_4-3 tile_4-4)
   (adj-horizontal tile_5-1 tile_5-2) (adj-horizontal tile_5-2 tile_5-3) (adj-horizontal tile_5-3 tile_5-4)
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
    (painted tile_5-1 white)
    (painted tile_5-2 black)
    (painted tile_5-3 white)
    (painted tile_5-4 black)
))
 (:metric minimize (total-cost))
)