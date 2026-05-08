(define (problem sokoban_instance_row)
  (:domain sokoban_one_row)
  (:objects
    p0 p1 p2 p3 p4 p5 p6 p7 p8 p9 p10 p11 p12 p13 p14 p15 p16 p17 p18 p19 p20 p21 p22 p23 p24 p25 p26 p27 p28 p29 p30 p31 p32 p33 p34 p35 p36 p37 p38 p39 p40 p41 p42 p43 p44 p45 p46 p47 p48 p49 p50 p51 p52 p53 p54 p55 p56 p57 p58 p59 p60 p61 p62 p63 p64 p65 p66 p67 p68 p69 p70 p71 p72 p73 p74 p75 p76 p77 p78 p79 p80 p81 p82 p83 p84 p85 p86 p87 p88 p89 p90 p91 p92 p93 p94 p95 p96 - position
    box0 - box
  )
  (:init
    (goal p0)
    (box_at box0 p48)
    (player_at p96)
    (next p0 p1) (next p1 p2) (next p2 p3) (next p3 p4) (next p4 p5) (next p5 p6) (next p6 p7) (next p7 p8) (next p8 p9) (next p9 p10)
    (next p10 p11) (next p11 p12) (next p12 p13) (next p13 p14) (next p14 p15) (next p15 p16) (next p16 p17) (next p17 p18) (next p18 p19) (next p19 p20)
    (next p20 p21) (next p21 p22) (next p22 p23) (next p23 p24) (next p24 p25) (next p25 p26) (next p26 p27) (next p27 p28) (next p28 p29) (next p29 p30)
    (next p30 p31) (next p31 p32) (next p32 p33) (next p33 p34) (next p34 p35) (next p35 p36) (next p36 p37) (next p37 p38) (next p38 p39) (next p39 p40)
    (next p40 p41) (next p41 p42) (next p42 p43) (next p43 p44) (next p44 p45) (next p45 p46) (next p46 p47) (next p47 p48) (next p48 p49) (next p49 p50)
    (next p50 p51) (next p51 p52) (next p52 p53) (next p53 p54) (next p54 p55) (next p55 p56) (next p56 p57) (next p57 p58) (next p58 p59) (next p59 p60)
    (next p60 p61) (next p61 p62) (next p62 p63) (next p63 p64) (next p64 p65) (next p65 p66) (next p66 p67) (next p67 p68) (next p68 p69) (next p69 p70)
    (next p70 p71) (next p71 p72) (next p72 p73) (next p73 p74) (next p74 p75) (next p75 p76) (next p76 p77) (next p77 p78) (next p78 p79) (next p79 p80)
    (next p80 p81) (next p81 p82) (next p82 p83) (next p83 p84) (next p84 p85) (next p85 p86) (next p86 p87) (next p87 p88) (next p88 p89) (next p89 p90)
    (next p90 p91) (next p91 p92) (next p92 p93) (next p93 p94) (next p94 p95) (next p95 p96)
  )
  (:goal (and
    (box_at box0 p0)
  ))
)