(define (problem sokoban_instance)
  (:domain sokoban_vertical_corridor)
  (:objects
    player_agent - agent
    box_1 - box
    loc1 loc2 loc3 loc4 loc5 loc6 loc7 loc8 loc9 loc10
    loc11 loc12 loc13 loc14 loc15 loc16 loc17 loc18 loc19 loc20
    loc21 loc22 loc23 loc24 loc25 loc26 loc27 loc28 loc29 loc30
    loc31 loc32 loc33 loc34 loc35 loc36 loc37 loc38 loc39 loc40
    loc41 loc42 loc43 loc44 loc45 loc46 loc47 loc48 loc49 loc50
    loc51 loc52 loc53 loc54 loc55 loc56 loc57 loc58 loc59 loc60
    loc61 loc62 loc63 loc64 loc65 loc66 loc67 loc68 loc69 loc70
    loc71 loc72 loc73 loc74 loc75 loc76 loc77 loc78 loc79 loc80
    loc81 loc82 loc83 loc84 loc85 loc86 loc87 loc88 loc89 loc90
    loc91 loc92 loc93 loc94 loc95 loc96 loc97 loc98 loc99 loc100
    loc101 loc102 loc103 loc104 loc105 loc106 loc107 loc108 loc109 loc110 - location
  )
  (:init
    ; adjacency chain (adjacent_up loc_i loc_{i+1}) meaning moving up from loc_i goes to loc_{i+1}
    (adjacent_up loc1 loc2) (adjacent_up loc2 loc3) (adjacent_up loc3 loc4) (adjacent_up loc4 loc5)
    (adjacent_up loc5 loc6) (adjacent_up loc6 loc7) (adjacent_up loc7 loc8) (adjacent_up loc8 loc9)
    (adjacent_up loc9 loc10) (adjacent_up loc10 loc11) (adjacent_up loc11 loc12) (adjacent_up loc12 loc13)
    (adjacent_up loc13 loc14) (adjacent_up loc14 loc15) (adjacent_up loc15 loc16) (adjacent_up loc16 loc17)
    (adjacent_up loc17 loc18) (adjacent_up loc18 loc19) (adjacent_up loc19 loc20) (adjacent_up loc20 loc21)
    (adjacent_up loc21 loc22) (adjacent_up loc22 loc23) (adjacent_up loc23 loc24) (adjacent_up loc24 loc25)
    (adjacent_up loc25 loc26) (adjacent_up loc26 loc27) (adjacent_up loc27 loc28) (adjacent_up loc28 loc29)
    (adjacent_up loc29 loc30) (adjacent_up loc30 loc31) (adjacent_up loc31 loc32) (adjacent_up loc32 loc33)
    (adjacent_up loc33 loc34) (adjacent_up loc34 loc35) (adjacent_up loc35 loc36) (adjacent_up loc36 loc37)
    (adjacent_up loc37 loc38) (adjacent_up loc38 loc39) (adjacent_up loc39 loc40) (adjacent_up loc40 loc41)
    (adjacent_up loc41 loc42) (adjacent_up loc42 loc43) (adjacent_up loc43 loc44) (adjacent_up loc44 loc45)
    (adjacent_up loc45 loc46) (adjacent_up loc46 loc47) (adjacent_up loc47 loc48) (adjacent_up loc48 loc49)
    (adjacent_up loc49 loc50) (adjacent_up loc50 loc51) (adjacent_up loc51 loc52) (adjacent_up loc52 loc53)
    (adjacent_up loc53 loc54) (adjacent_up loc54 loc55) (adjacent_up loc55 loc56) (adjacent_up loc56 loc57)
    (adjacent_up loc57 loc58) (adjacent_up loc58 loc59) (adjacent_up loc59 loc60) (adjacent_up loc60 loc61)
    (adjacent_up loc61 loc62) (adjacent_up loc62 loc63) (adjacent_up loc63 loc64) (adjacent_up loc64 loc65)
    (adjacent_up loc65 loc66) (adjacent_up loc66 loc67) (adjacent_up loc67 loc68) (adjacent_up loc68 loc69)
    (adjacent_up loc69 loc70) (adjacent_up loc70 loc71) (adjacent_up loc71 loc72) (adjacent_up loc72 loc73)
    (adjacent_up loc73 loc74) (adjacent_up loc74 loc75) (adjacent_up loc75 loc76) (adjacent_up loc76 loc77)
    (adjacent_up loc77 loc78) (adjacent_up loc78 loc79) (adjacent_up loc79 loc80) (adjacent_up loc80 loc81)
    (adjacent_up loc81 loc82) (adjacent_up loc82 loc83) (adjacent_up loc83 loc84) (adjacent_up loc84 loc85)
    (adjacent_up loc85 loc86) (adjacent_up loc86 loc87) (adjacent_up loc87 loc88) (adjacent_up loc88 loc89)
    (adjacent_up loc89 loc90) (adjacent_up loc90 loc91) (adjacent_up loc91 loc92) (adjacent_up loc92 loc93)
    (adjacent_up loc93 loc94) (adjacent_up loc94 loc95) (adjacent_up loc95 loc96) (adjacent_up loc96 loc97)
    (adjacent_up loc97 loc98) (adjacent_up loc98 loc99) (adjacent_up loc99 loc100) (adjacent_up loc100 loc101)
    (adjacent_up loc101 loc102) (adjacent_up loc102 loc103) (adjacent_up loc103 loc104) (adjacent_up loc104 loc105)
    (adjacent_up loc105 loc106) (adjacent_up loc106 loc107) (adjacent_up loc107 loc108) (adjacent_up loc108 loc109)
    (adjacent_up loc109 loc110)

    ; initial positions
    (player_at player_agent loc1)
    (box_at box_1 loc107)

    ; goal location (the '.' in the map)
    (goal loc109)

    ; free locations: all locations except those initially occupied by the player or the box
    (free loc2) (free loc3) (free loc4) (free loc5) (free loc6) (free loc7) (free loc8) (free loc9) (free loc10)
    (free loc11) (free loc12) (free loc13) (free loc14) (free loc15) (free loc16) (free loc17) (free loc18) (free loc19) (free loc20)
    (free loc21) (free loc22) (free loc23) (free loc24) (free loc25) (free loc26) (free loc27) (free loc28) (free loc29) (free loc30)
    (free loc31) (free loc32) (free loc33) (free loc34) (free loc35) (free loc36) (free loc37) (free loc38) (free loc39) (free loc40)
    (free loc41) (free loc42) (free loc43) (free loc44) (free loc45) (free loc46) (free loc47) (free loc48) (free loc49) (free loc50)
    (free loc51) (free loc52) (free loc53) (free loc54) (free loc55) (free loc56) (free loc57) (free loc58) (free loc59) (free loc60)
    (free loc61) (free loc62) (free loc63) (free loc64) (free loc65) (free loc66) (free loc67) (free loc68) (free loc69) (free loc70)
    (free loc71) (free loc72) (free loc73) (free loc74) (free loc75) (free loc76) (free loc77) (free loc78) (free loc79) (free loc80)
    (free loc81) (free loc82) (free loc83) (free loc84) (free loc85) (free loc86) (free loc87) (free loc88) (free loc89) (free loc90)
    (free loc91) (free loc92) (free loc93) (free loc94) (free loc95) (free loc96) (free loc97) (free loc98) (free loc99) (free loc100)
    (free loc101) (free loc102) (free loc103) (free loc104) (free loc105) (free loc106) (free loc108) (free loc109) (free loc110)
  )

  (:goal (and
    (box_at box_1 loc109)
  ))
)