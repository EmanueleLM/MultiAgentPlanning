(define (problem floortile-checkerboard)
    (:domain floortile)
    
    (:objects
        robot1 robot2 - robot
        white black - color
        tile_0-5 tile_1-1 tile_1-2 tile_1-3 tile_1-4 tile_1-5
        tile_2-1 tile_2-2 tile_2-3 tile_2-4 tile_2-5
        tile_3-1 tile_3-2 tile_3-3 tile_3-4 tile_3-5
        tile_4-1 tile_4-2 tile_4-3 tile_4-4 tile_4-5
        tile_5-1 tile_5-2 tile_5-3 tile_5-4 tile_5-5 - tile
    )

    (:init
        (= (total-cost) 0)
        
        ; Robot initial states
        (robot-at robot1 tile_0-5)
        (robot-has robot1 white)
        (robot-at robot2 tile_3-3)
        (robot-has robot2 black)

        ; Tile clearance (T3-3 and T0-5 occupied, hence not clear implicitly)
        (clear tile_1-1) (clear tile_1-2) (clear tile_1-3) (clear tile_1-4) (clear tile_1-5)
        (clear tile_2-1) (clear tile_2-2) (clear tile_2-3) (clear tile_2-4) (clear tile_2-5)
        (clear tile_3-1) (clear tile_3-2) (clear tile_3-4) (clear tile_3-5)
        (clear tile_4-1) (clear tile_4-2) (clear tile_4-3) (clear tile_4-4) (clear tile_4-5)
        (clear tile_5-1) (clear tile_5-2) (clear tile_5-3) (clear tile_5-4) (clear tile_5-5)

        ; Connectivity (5x5 grid plus R1 entry point)
        
        ; R1 entry connections
        (down tile_0-5 tile_1-5)
        (up tile_1-5 tile_0-5)

        ; --- Internal Grid Connectivity ---
        ; R1 (Row 1 connections)
        (down tile_1-1 tile_2-1) (up tile_2-1 tile_1-1)
        (down tile_1-2 tile_2-2) (up tile_2-2 tile_1-2)
        (down tile_1-3 tile_2-3) (up tile_2-3 tile_1-3)
        (down tile_1-4 tile_2-4) (up tile_2-4 tile_1-4)
        (down tile_1-5 tile_2-5) (up tile_2-5 tile_1-5)
        
        (right tile_1-1 tile_1-2) (left tile_1-2 tile_1-1)
        (right tile_1-2 tile_1-3) (left tile_1-3 tile_1-2)
        (right tile_1-3 tile_1-4) (left tile_1-4 tile_1-3)
        (right tile_1-4 tile_1-5) (left tile_1-5 tile_1-4)
        
        ; R2 (Row 2 connections)
        (down tile_2-1 tile_3-1) (up tile_3-1 tile_2-1)
        (down tile_2-2 tile_3-2) (up tile_3-2 tile_2-2)
        (down tile_2-3 tile_3-3) (up tile_3-3 tile_2-3)
        (down tile_2-4 tile_3-4) (up tile_3-4 tile_2-4)
        (down tile_2-5 tile_3-5) (up tile_3-5 tile_2-5)

        (right tile_2-1 tile_2-2) (left tile_2-2 tile_2-1)
        (right tile_2-2 tile_2-3) (left tile_2-3 tile_2-2)
        (right tile_2-3 tile_2-4) (left tile_2-4 tile_2-3)
        (right tile_2-4 tile_2-5) (left tile_2-5 tile_2-4)
        
        ; R3 (Row 3 connections)
        (down tile_3-1 tile_4-1) (up tile_4-1 tile_3-1)
        (down tile_3-2 tile_4-2) (up tile_4-2 tile_3-2)
        (down tile_3-3 tile_4-3) (up tile_4-3 tile_3-3)
        (down tile_3-4 tile_4-4) (up tile_4-4 tile_3-4)
        (down tile_3-5 tile_4-5) (up tile_4-5 tile_3-5)
        
        (right tile_3-1 tile_3-2) (left tile_3-2 tile_3-1)
        (right tile_3-2 tile_3-3) (left tile_3-3 tile_3-2)
        (right tile_3-3 tile_3-4) (left tile_3-4 tile_3-3)
        (right tile_3-4 tile_3-5) (left tile_3-5 tile_3-4)
        
        ; R4 (Row 4 connections)
        (down tile_4-1 tile_5-1) (up tile_5-1 tile_4-1)
        (down tile_4-2 tile_5-2) (up tile_5-2 tile_4-2)
        (down tile_4-3 tile_5-3) (up tile_5-3 tile_4-3)
        (down tile_4-4 tile_5-4) (up tile_5-4 tile_4-4)
        (down tile_4-5 tile_5-5) (up tile_5-5 tile_4-5)
        
        (right tile_4-1 tile_4-2) (left tile_4-2 tile_4-1)
        (right tile_4-2 tile_4-3) (left tile_4-3 tile_4-2)
        (right tile_4-3 tile_4-4) (left tile_4-4 tile_4-3)
        (right tile_4-4 tile_4-5) (left tile_4-5 tile_4-4)

        ; R5 (Row 5 connections)
        (up tile_5-1 tile_4-1)
        (up tile_5-2 tile_4-2)
        (up tile_5-3 tile_4-3)
        (up tile_5-4 tile_4-4)
        (up tile_5-5 tile_4-5)
        
        (right tile_5-1 tile_5-2) (left tile_5-2 tile_5-1)
        (right tile_5-2 tile_5-3) (left tile_5-3 tile_5-2)
        (right tile_5-3 tile_5-4) (left tile_5-4 tile_5-3)
        (right tile_5-4 tile_5-5) (left tile_5-5 tile_5-4)
    )

    (:goal (and
        ; Row 1: W B W B W
        (painted tile_1-1 white) (painted tile_1-2 black) (painted tile_1-3 white) (painted tile_1-4 black) (painted tile_1-5 white)

        ; Row 2: B W B W B
        (painted tile_2-1 black) (painted tile_2-2 white) (painted tile_2-3 black) (painted tile_2-4 white) (painted tile_2-5 black)

        ; Row 3: W B W B W
        (painted tile_3-1 white) (painted tile_3-2 black) (painted tile_3-3 white) (painted tile_3-4 black) (painted tile_3-5 white)

        ; Row 4: B W B W B
        (painted tile_4-1 black) (painted tile_4-2 white) (painted tile_4-3 black) (painted tile_4-4 white) (painted tile_4-5 black)

        ; Row 5: W B W B W
        (painted tile_5-1 white) (painted tile_5-2 black) (painted tile_5-3 white) (painted tile_5-4 black) (painted tile_5-5 white)
    ))

    (:metric minimize (total-cost))
)