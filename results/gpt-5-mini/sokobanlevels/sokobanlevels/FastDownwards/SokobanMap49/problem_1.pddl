(define (problem sokoban_map49_instance)
  (:domain sokoban_map49)
  (:objects
    agent1 - agent
    box1 - box
    p1 p2 p3 p4 p5 p6 p7 p8 p9 p10
    p11 p12 p13 p14 p15 p16 p17 p18 p19 p20
    p21 p22 p23 p24 p25 p26 p27 p28 p29 p30
    p31 p32 p33 p34 p35 p36 p37 p38 p39 p40
    p41 p42 p43 p44 p45 p46 p47 p48 p49 p50
    p51 p52 p53 p54 p55 p56 p57 p58 p59 p60
    p61 p62 p63 p64 p65 p66 p67 p68 p69 p70
    p71 p72 p73 p74 p75 p76 p77 p78 p79 p80
    p81 p82 p83 p84 p85 p86 p87 p88 p89 p90
    p91 p92 p93 p94 p95 p96 p97 p98 p99 - position
  )

  (:init
    (right_of p2 p1)  (right_of p3 p2)  (right_of p4 p3)  (right_of p5 p4)
    (right_of p6 p5)  (right_of p7 p6)  (right_of p8 p7)  (right_of p9 p8)
    (right_of p10 p9) (right_of p11 p10)(right_of p12 p11)(right_of p13 p12)
    (right_of p14 p13)(right_of p15 p14)(right_of p16 p15)(right_of p17 p16)
    (right_of p18 p17)(right_of p19 p18)(right_of p20 p19)(right_of p21 p20)
    (right_of p22 p21)(right_of p23 p22)(right_of p24 p23)(right_of p25 p24)
    (right_of p26 p25)(right_of p27 p26)(right_of p28 p27)(right_of p29 p28)
    (right_of p30 p29)(right_of p31 p30)(right_of p32 p31)(right_of p33 p32)
    (right_of p34 p33)(right_of p35 p34)(right_of p36 p35)(right_of p37 p36)
    (right_of p38 p37)(right_of p39 p38)(right_of p40 p39)(right_of p41 p40)
    (right_of p42 p41)(right_of p43 p42)(right_of p44 p43)(right_of p45 p44)
    (right_of p46 p45)(right_of p47 p46)(right_of p48 p47)(right_of p49 p48)
    (right_of p50 p49)(right_of p51 p50)(right_of p52 p51)(right_of p53 p52)
    (right_of p54 p53)(right_of p55 p54)(right_of p56 p55)(right_of p57 p56)
    (right_of p58 p57)(right_of p59 p58)(right_of p60 p59)(right_of p61 p60)
    (right_of p62 p61)(right_of p63 p62)(right_of p64 p63)(right_of p65 p64)
    (right_of p66 p65)(right_of p67 p66)(right_of p68 p67)(right_of p69 p68)
    (right_of p70 p69)(right_of p71 p70)(right_of p72 p71)(right_of p73 p72)
    (right_of p74 p73)(right_of p75 p74)(right_of p76 p75)(right_of p77 p76)
    (right_of p78 p77)(right_of p79 p78)(right_of p80 p79)(right_of p81 p80)
    (right_of p82 p81)(right_of p83 p82)(right_of p84 p83)(right_of p85 p84)
    (right_of p86 p85)(right_of p87 p86)(right_of p88 p87)(right_of p89 p88)
    (right_of p90 p89)(right_of p91 p90)(right_of p92 p91)(right_of p93 p92)
    (right_of p94 p93)(right_of p95 p94)(right_of p96 p95)(right_of p97 p96)
    (right_of p98 p97)(right_of p99 p98)

    (at_agent agent1 p1)
    (at_box box1 p50)
    (goal_pos p99)

    (occupied p1)
    (occupied p50)
  )

  (:goal (and (at_box box1 p99)))
)