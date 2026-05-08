(define (problem sokoban-instance)
  (:domain sokoban)
  (:objects
    p1 p2 p3 p4 p5 p6 p7 p8 p9 p10 - position
    p11 p12 p13 p14 p15 p16 p17 p18 p19 p20 - position
    p21 p22 p23 p24 p25 p26 p27 p28 p29 p30 - position
    p31 p32 p33 p34 p35 p36 p37 p38 p39 p40 - position
    p41 p42 p43 p44 p45 p46 p47 p48 p49 p50 - position
    p51 p52 p53 p54 p55 p56 p57 p58 p59 p60 - position
    p61 p62 p63 p64 p65 p66 p67 p68 p69 p70 - position
    p71 p72 p73 p74 p75 p76 p77 p78 p79 p80 - position
    player1 - agent
    box1 - box
  )
  (:init
    (at player1 p2)
    (at-box box1 p78)
    (clear p3)
    (adjacent p2 p3)
    (adjacent p3 p4)
    ;; more adjacencies to be added according to the grid structure
    (adjacent p78 p79)
    (clear p79) ; position to where the box is to be pushed
    (goal p80) ; goal position for the box
  )
  (:goal
    (at-box box1 p80)
  )
)