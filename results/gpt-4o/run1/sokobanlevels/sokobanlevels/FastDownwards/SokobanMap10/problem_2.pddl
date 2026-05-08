(define (problem sokoban-instance)
  (:domain sokoban)

  (:objects
    p0 p1 p2 p3 p4 p5 p6 p7 p8 p9 p10 p11 p12 p13 p14 p15 p16 p17 p18 p19 p20 p21 p22 p23 p24 p25 p26
    p27 p28 p29 p30 p31 p32 p33 p34 p35 p36 p37 p38 p39 p40 p41 p42 p43 p44 p45 p46 p47 p48 p49 p50
    - position
  )

  (:init
    (at player p50)
    (at box p47)
    (goal_at p2)
    (empty p0) (empty p1) (empty p2) (empty p3) (empty p4) (empty p5) (empty p6) (empty p7) (empty p8) 
    (empty p9) (empty p10) (empty p11) (empty p12) (empty p13) (empty p14) (empty p15) (empty p16) 
    (empty p17) (empty p18) (empty p19) (empty p20) (empty p21) (empty p22) (empty p23) (empty p24) 
    (empty p25) (empty p26) (empty p27) (empty p28) (empty p29) (empty p30) (empty p31) (empty p32) 
    (empty p33) (empty p34) (empty p35) (empty p36) (empty p37) (empty p38) (empty p39) (empty p40) 
    (empty p41) (empty p42) (empty p43) (empty p44) (empty p45) (empty p46) (empty p48) (empty p49) 

    ;; Define adjacency to reflect the grid structure; for example:
    (adjacent p0 p1) (adjacent p1 p0) (adjacent p1 p2) (adjacent p2 p1)
    ;; Add all adjacency relations according to the grid map from the problem
  )

  (:goal
    (at box p2)
  )
)