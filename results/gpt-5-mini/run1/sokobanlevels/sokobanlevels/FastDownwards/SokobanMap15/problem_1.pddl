(define (problem sokoban_vertical_instance)
  (:domain sokoban_vertical)
  (:objects
    p1 p2 p3 p4 p5 p6 p7 p8 p9 p10 p11 p12 p13 p14 p15 p16 p17 p18 p19 p20
    p21 p22 p23 p24 p25 p26 p27 p28 p29 p30 p31 p32 p33 p34 p35 p36 p37 p38 p39 p40
    p41 p42 p43 p44 p45 p46 p47 p48 p49 p50 p51 p52 p53 p54 p55 p56 p57 p58 p59 p60
    p61 p62 p63 p64 p65 p66 p67 p68 p69 p70 p71 p72 p73 p74 p75 p76 p77 p78 p79 p80
    p81 p82 p83 p84 p85 p86 p87 p88 p89 p90 p91 p92 p93 p94 p95 - position
    player1 - agent
    box1 - box
  )

  (:init
    (at player1 p1)
    (box-at box1 p49)
    (goal p95)

    (succ p1 p2) (succ p2 p3) (succ p3 p4) (succ p4 p5) (succ p5 p6) (succ p6 p7)
    (succ p7 p8) (succ p8 p9) (succ p9 p10) (succ p10 p11) (succ p11 p12) (succ p12 p13)
    (succ p13 p14) (succ p14 p15) (succ p15 p16) (succ p16 p17) (succ p17 p18) (succ p18 p19)
    (succ p19 p20) (succ p20 p21) (succ p21 p22) (succ p22 p23) (succ p23 p24) (succ p24 p25)
    (succ p25 p26) (succ p26 p27) (succ p27 p28) (succ p28 p29) (succ p29 p30) (succ p30 p31)
    (succ p31 p32) (succ p32 p33) (succ p33 p34) (succ p34 p35) (succ p35 p36) (succ p36 p37)
    (succ p37 p38) (succ p38 p39) (succ p39 p40) (succ p40 p41) (succ p41 p42) (succ p42 p43)
    (succ p43 p44) (succ p44 p45) (succ p45 p46) (succ p46 p47) (succ p47 p48) (succ p48 p49)
    (succ p49 p50) (succ p50 p51) (succ p51 p52) (succ p52 p53) (succ p53 p54) (succ p54 p55)
    (succ p55 p56) (succ p56 p57) (succ p57 p58) (succ p58 p59) (succ p59 p60) (succ p60 p61)
    (succ p61 p62) (succ p62 p63) (succ p63 p64) (succ p64 p65) (succ p65 p66) (succ p66 p67)
    (succ p67 p68) (succ p68 p69) (succ p69 p70) (succ p70 p71) (succ p71 p72) (succ p72 p73)
    (succ p73 p74) (succ p74 p75) (succ p75 p76) (succ p76 p77) (succ p77 p78) (succ p78 p79)
    (succ p79 p80) (succ p80 p81) (succ p81 p82) (succ p82 p83) (succ p83 p84) (succ p84 p85)
    (succ p85 p86) (succ p86 p87) (succ p87 p88) (succ p88 p89) (succ p89 p90) (succ p90 p91)
    (succ p91 p92) (succ p92 p93) (succ p93 p94) (succ p94 p95)
  )

  (:goal (and (box-at box1 p95)))
)