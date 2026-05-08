(define (problem sokoban_instance_row99)
  (:domain jack_of_all_trades_sokoban)
  (:objects
    p1 p2 p3 p4 p5 p6 p7 p8 p9 p10 p11 p12 p13 p14 p15 p16 p17 p18 p19 p20 p21 p22 p23 p24 p25 p26 p27 p28 p29 p30 p31 p32 p33 p34 p35 p36 p37 p38 p39 p40 p41 p42 p43 p44 p45 p46 p47 p48 p49 p50 p51 p52 p53 p54 p55 p56 p57 p58 p59 p60 p61 p62 p63 p64 p65 p66 p67 p68 p69 p70 p71 p72 p73 p74 p75 p76 p77 p78 p79 p80 p81 p82 p83 p84 p85 p86 p87 p88 p89 p90 p91 p92 p93 p94 p95 p96 p97 p98 p99 - cell
    box1 - box
    player1 - player
    goal_cell - goal_marker
  )

  (:init
    ; adjacency chain p1 -> p2 -> ... -> p99
    (adj p1 p2) (adj p2 p3) (adj p3 p4) (adj p4 p5) (adj p5 p6) (adj p6 p7) (adj p7 p8) (adj p8 p9) (adj p9 p10)
    (adj p10 p11) (adj p11 p12) (adj p12 p13) (adj p13 p14) (adj p14 p15) (adj p15 p16) (adj p16 p17) (adj p17 p18) (adj p18 p19) (adj p19 p20)
    (adj p20 p21) (adj p21 p22) (adj p22 p23) (adj p23 p24) (adj p24 p25) (adj p25 p26) (adj p26 p27) (adj p27 p28) (adj p28 p29) (adj p29 p30)
    (adj p30 p31) (adj p31 p32) (adj p32 p33) (adj p33 p34) (adj p34 p35) (adj p35 p36) (adj p36 p37) (adj p37 p38) (adj p38 p39) (adj p39 p40)
    (adj p40 p41) (adj p41 p42) (adj p42 p43) (adj p43 p44) (adj p44 p45) (adj p45 p46) (adj p46 p47) (adj p47 p48) (adj p48 p49) (adj p49 p50)
    (adj p50 p51) (adj p51 p52) (adj p52 p53) (adj p53 p54) (adj p54 p55) (adj p55 p56) (adj p56 p57) (adj p57 p58) (adj p58 p59) (adj p59 p60)
    (adj p60 p61) (adj p61 p62) (adj p62 p63) (adj p63 p64) (adj p64 p65) (adj p65 p66) (adj p66 p67) (adj p67 p68) (adj p68 p69) (adj p69 p70)
    (adj p70 p71) (adj p71 p72) (adj p72 p73) (adj p73 p74) (adj p74 p75) (adj p75 p76) (adj p76 p77) (adj p77 p78) (adj p78 p79) (adj p79 p80)
    (adj p80 p81) (adj p81 p82) (adj p82 p83) (adj p83 p84) (adj p84 p85) (adj p85 p86) (adj p86 p87) (adj p87 p88) (adj p88 p89) (adj p89 p90)
    (adj p90 p91) (adj p91 p92) (adj p92 p93) (adj p93 p94) (adj p94 p95) (adj p95 p96) (adj p96 p97) (adj p97 p98) (adj p98 p99)

    ; goal marker placement
    (is_goal goal_cell p1)

    ; initial positions
    (at_box box1 p50)
    (at_player player1 p99)

    ; cell_free for all cells except where the box is (p50)
    (cell_free p1) (cell_free p2) (cell_free p3) (cell_free p4) (cell_free p5) (cell_free p6) (cell_free p7) (cell_free p8) (cell_free p9) (cell_free p10)
    (cell_free p11) (cell_free p12) (cell_free p13) (cell_free p14) (cell_free p15) (cell_free p16) (cell_free p17) (cell_free p18) (cell_free p19) (cell_free p20)
    (cell_free p21) (cell_free p22) (cell_free p23) (cell_free p24) (cell_free p25) (cell_free p26) (cell_free p27) (cell_free p28) (cell_free p29) (cell_free p30)
    (cell_free p31) (cell_free p32) (cell_free p33) (cell_free p34) (cell_free p35) (cell_free p36) (cell_free p37) (cell_free p38) (cell_free p39) (cell_free p40)
    (cell_free p41) (cell_free p42) (cell_free p43) (cell_free p44) (cell_free p45) (cell_free p46) (cell_free p47) (cell_free p48) (cell_free p49)
    ; p50 is occupied by the box, so no (cell_free p50)
    (cell_free p51) (cell_free p52) (cell_free p53) (cell_free p54) (cell_free p55) (cell_free p56) (cell_free p57) (cell_free p58) (cell_free p59) (cell_free p60)
    (cell_free p61) (cell_free p62) (cell_free p63) (cell_free p64) (cell_free p65) (cell_free p66) (cell_free p67) (cell_free p68) (cell_free p69) (cell_free p70)
    (cell_free p71) (cell_free p72) (cell_free p73) (cell_free p74) (cell_free p75) (cell_free p76) (cell_free p77) (cell_free p78) (cell_free p79) (cell_free p80)
    (cell_free p81) (cell_free p82) (cell_free p83) (cell_free p84) (cell_free p85) (cell_free p86) (cell_free p87) (cell_free p88) (cell_free p89) (cell_free p90)
    (cell_free p91) (cell_free p92) (cell_free p93) (cell_free p94) (cell_free p95) (cell_free p96) (cell_free p97) (cell_free p98) (cell_free p99)
  )

  (:goal (and
    (at_box box1 p1)
  ))
)