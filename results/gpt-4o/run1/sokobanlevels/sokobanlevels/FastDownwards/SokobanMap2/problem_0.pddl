(define (problem sokoban_instance)
  (:domain sokoban)
  (:objects
    p1 p2 p3 p4 p5
    p6 p7 p8 p9 p10
    p11 p12 p13 p14 p15
    p16 p17 p18 p19 p20
    p21 p22 p23 p24 p25
    p26 p27 p28 p29 p30
    p31 p32 p33 p34 p35
    p36 p37 p38 p39 p40
    p41 p42 p43 p44 p45
    p46 p47 p48 p49 p50
    p51 p52 p53 p54 p55
    p56 p57 p58 p59 p60
    p61 p62 p63 p64 p65
    p66 p67 p68 p69 p70
    p71 p72 p73 p74 p75
    p76 p77 p78 p79 p80
    p81 p82 p83 p84 p85
    p86 p87 p88 p89 p90
    p91 p92 p93 p94 p95
    p96 p97 p98 p99 p100
    - position
    wall_p1 wall_p2 wall_p3
    wall_p4 wall_p5 wall_p6
    wall_p7 wall_p8 wall_p9
    - wall
  )
  (:init
    (at_player p93)
    (at_box p97)
    (is_goal p3)
    (wall p1) (wall p2) (wall p3)
    (wall p4) (wall p5) (wall p6)
    (wall p7) (wall p8) (wall p9)
    (adjacent p93 p92) (adjacent p92 p91)
    (adjacent p91 p96) (adjacent p96 p97)
    (adjacent p97 p98) (adjacent p98 p99)
    (adjacent p99 p94) (adjacent p94 p95)
    (adjacent p95 p100)
  )
  (:goal
    (at_box p3)
  )
)