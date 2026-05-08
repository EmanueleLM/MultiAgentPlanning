(define (problem sokoban-instance)
  (:domain sokoban)
  (:objects
    player box - entity
    loc1 loc2 loc3 loc4 loc5 loc6 loc7 loc8 loc9 loc10 loc11 loc12 loc13 loc14 loc15 loc16 loc17 loc18 loc19 loc20 loc21 loc22 loc23 loc24 loc25 loc26 loc27 loc28 loc29 loc30 loc31 loc32 loc33 loc34 loc35 loc36 loc37 loc38 loc39 loc40 loc41 loc42 loc43 loc44 loc45 loc46 loc47 loc48 loc49 loc50 loc51 loc52 loc53 loc54 loc55 loc56 loc57 loc58 loc59 loc60 loc61 loc62 loc63 loc64 loc65 loc66 loc67 loc68 loc69 loc70 loc71 loc72 loc73 loc74 loc75 loc76 loc77 loc78 loc79 loc80 loc81 loc82 loc83 loc84 loc85 loc86 loc87 loc88 loc89 loc90 loc91 loc92 loc93 loc94 loc95 loc96 loc97 - location
  )
  (:init
    (at player loc1)
    (at box loc47)
    (is_goal loc96)

    (free loc2) (free loc3) (free loc4) (free loc5) (free loc6)
    (free loc7) (free loc8) (free loc9) (free loc10) (free loc11)
    (free loc12) (free loc13) (free loc14) (free loc15) (free loc16)
    (free loc17) (free loc18) (free loc19) (free loc20) (free loc21)
    (free loc22) (free loc23) (free loc24) (free loc25) (free loc26)
    (free loc27) (free loc28) (free loc29) (free loc30) (free loc31)
    (free loc32) (free loc33) (free loc34) (free loc35) (free loc36)
    (free loc37) (free loc38) (free loc39) (free loc40) (free loc41)
    (free loc42) (free loc43) (free loc44) (free loc45) (free loc46)
    (free loc48) (free loc49) (free loc50) (free loc51) (free loc52)
    (free loc53) (free loc54) (free loc55) (free loc56) (free loc57)
    (free loc58) (free loc59) (free loc60) (free loc61) (free loc62)
    (free loc63) (free loc64) (free loc65) (free loc66) (free loc67)
    (free loc68) (free loc69) (free loc70) (free loc71) (free loc72)
    (free loc73) (free loc74) (free loc75) (free loc76) (free loc77)
    (free loc78) (free loc79) (free loc80) (free loc81) (free loc82)
    (free loc83) (free loc84) (free loc85) (free loc86) (free loc87)
    (free loc88) (free loc89) (free loc90) (free loc91) (free loc92)
    (free loc93) (free loc94) (free loc95) (free loc97)

    ; assuming all locations are adjacent to the next (linear path assumption)
    (adj loc1 loc2) (adj loc2 loc3) (adj loc3 loc4) (adj loc4 loc5)
    ... ; similar adjacencies should be added as per the structure
    (adj loc95 loc96) (adj loc96 loc97)
  )
  (:goal (and (at box loc96)))
)