(define (problem sokoban_problem)
  (:domain sokoban_domain)
  (:objects
    agent_player - agent
    box_1 - box
    p1 p2 p3 p4 p5 p6 p7 p8 p9 p10 p11 p12 p13 p14 p15 p16 p17 p18 p19 p20
    p21 p22 p23 p24 p25 p26 p27 p28 p29 p30 p31 p32 p33 p34 p35 p36 p37 p38 p39 p40
    p41 p42 p43 p44 p45 p46 p47 p48 p49 p50 p51 p52 p53 p54 p55 p56 p57 p58 p59 p60
    p61 p62 p63 p64 p65 p66 p67 p68 p69 p70 p71 p72 p73 p74 p75 p76 p77 p78 p79 p80
    p81 p82 p83 p84 p85 p86 p87 p88 p89 p90 p91 p92 p93 p94 p95 p96 p97 p98 - position
  )

  (:init
    ; walls
    (wall p1)
    (wall p98)

    ; adjacency chain left-to-right
    (adj_right p1 p2) (adj_right p2 p3) (adj_right p3 p4) (adj_right p4 p5) (adj_right p5 p6)
    (adj_right p6 p7) (adj_right p7 p8) (adj_right p8 p9) (adj_right p9 p10) (adj_right p10 p11)
    (adj_right p11 p12) (adj_right p12 p13) (adj_right p13 p14) (adj_right p14 p15) (adj_right p15 p16)
    (adj_right p16 p17) (adj_right p17 p18) (adj_right p18 p19) (adj_right p19 p20) (adj_right p20 p21)
    (adj_right p21 p22) (adj_right p22 p23) (adj_right p23 p24) (adj_right p24 p25) (adj_right p25 p26)
    (adj_right p26 p27) (adj_right p27 p28) (adj_right p28 p29) (adj_right p29 p30) (adj_right p30 p31)
    (adj_right p31 p32) (adj_right p32 p33) (adj_right p33 p34) (adj_right p34 p35) (adj_right p35 p36)
    (adj_right p36 p37) (adj_right p37 p38) (adj_right p38 p39) (adj_right p39 p40) (adj_right p40 p41)
    (adj_right p41 p42) (adj_right p42 p43) (adj_right p43 p44) (adj_right p44 p45) (adj_right p45 p46)
    (adj_right p46 p47) (adj_right p47 p48) (adj_right p48 p49) (adj_right p49 p50) (adj_right p50 p51)
    (adj_right p51 p52) (adj_right p52 p53) (adj_right p53 p54) (adj_right p54 p55) (adj_right p55 p56)
    (adj_right p56 p57) (adj_right p57 p58) (adj_right p58 p59) (adj_right p59 p60) (adj_right p60 p61)
    (adj_right p61 p62) (adj_right p62 p63) (adj_right p63 p64) (adj_right p64 p65) (adj_right p65 p66)
    (adj_right p66 p67) (adj_right p67 p68) (adj_right p68 p69) (adj_right p69 p70) (adj_right p70 p71)
    (adj_right p71 p72) (adj_right p72 p73) (adj_right p73 p74) (adj_right p74 p75) (adj_right p75 p76)
    (adj_right p76 p77) (adj_right p77 p78) (adj_right p78 p79) (adj_right p79 p80) (adj_right p80 p81)
    (adj_right p81 p82) (adj_right p82 p83) (adj_right p83 p84) (adj_right p84 p85) (adj_right p85 p86)
    (adj_right p86 p87) (adj_right p87 p88) (adj_right p88 p89) (adj_right p89 p90) (adj_right p90 p91)
    (adj_right p91 p92) (adj_right p92 p93) (adj_right p93 p94) (adj_right p94 p95) (adj_right p95 p96)
    (adj_right p96 p97) (adj_right p97 p98)

    ; initial agent and box positions
    (player_at p2)
    (box_at p50)

    ; goal position
    (goal p97)
  )

  (:goal (and (box_at p97)))
)