(define (problem hanoi-7-mover)
  (:domain hanoi-mover)

  (:objects
    A B C D E F G - disk
    left middle right - peg
    ;; stages s0 .. s127 (127 moves required for 7 disks)
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15
    s16 s17 s18 s19 s20 s21 s22 s23 s24 s25 s26 s27 s28 s29 s30
    s31 s32 s33 s34 s35 s36 s37 s38 s39 s40 s41 s42 s43 s44 s45
    s46 s47 s48 s49 s50 s51 s52 s53 s54 s55 s56 s57 s58 s59 s60
    s61 s62 s63 s64 s65 s66 s67 s68 s69 s70 s71 s72 s73 s74 s75
    s76 s77 s78 s79 s80 s81 s82 s83 s84 s85 s86 s87 s88 s89 s90
    s91 s92 s93 s94 s95 s96 s97 s98 s99 s100 s101 s102 s103 s104 s105
    s106 s107 s108 s109 s110 s111 s112 s113 s114 s115 s116 s117 s118 s119
    s120 s121 s122 s123 s124 s125 s126 s127 - stage
  )

  (:init
    ;; stages and successor relations
    (stage s0) (stage s1) (stage s2) (stage s3) (stage s4) (stage s5) (stage s6) (stage s7)
    (stage s8) (stage s9) (stage s10) (stage s11) (stage s12) (stage s13) (stage s14) (stage s15)
    (stage s16) (stage s17) (stage s18) (stage s19) (stage s20) (stage s21) (stage s22) (stage s23)
    (stage s24) (stage s25) (stage s26) (stage s27) (stage s28) (stage s29) (stage s30)
    (stage s31) (stage s32) (stage s33) (stage s34) (stage s35) (stage s36) (stage s37) (stage s38)
    (stage s39) (stage s40) (stage s41) (stage s42) (stage s43) (stage s44) (stage s45) (stage s46)
    (stage s47) (stage s48) (stage s49) (stage s50) (stage s51) (stage s52) (stage s53) (stage s54)
    (stage s55) (stage s56) (stage s57) (stage s58) (stage s59) (stage s60) (stage s61) (stage s62)
    (stage s63) (stage s64) (stage s65) (stage s66) (stage s67) (stage s68) (stage s69) (stage s70)
    (stage s71) (stage s72) (stage s73) (stage s74) (stage s75) (stage s76) (stage s77) (stage s78)
    (stage s79) (stage s80) (stage s81) (stage s82) (stage s83) (stage s84) (stage s85) (stage s86)
    (stage s87) (stage s88) (stage s89) (stage s90) (stage s91) (stage s92) (stage s93) (stage s94)
    (stage s95) (stage s96) (stage s97) (stage s98) (stage s99) (stage s100) (stage s101) (stage s102)
    (stage s103) (stage s104) (stage s105) (stage s106) (stage s107) (stage s108) (stage s109) (stage s110)
    (stage s111) (stage s112) (stage s113) (stage s114) (stage s115) (stage s116) (stage s117) (stage s118)
    (stage s119) (stage s120) (stage s121) (stage s122) (stage s123) (stage s124) (stage s125) (stage s126)
    (stage s127)

    (next s0 s1) (next s1 s2) (next s2 s3) (next s3 s4) (next s4 s5) (next s5 s6) (next s6 s7) (next s7 s8)
    (next s8 s9) (next s9 s10) (next s10 s11) (next s11 s12) (next s12 s13) (next s13 s14) (next s14 s15)
    (next s15 s16) (next s16 s17) (next s17 s18) (next s18 s19) (next s19 s20) (next s20 s21) (next s21 s22)
    (next s22 s23) (next s23 s24) (next s24 s25) (next s25 s26) (next s26 s27) (next s27 s28) (next s28 s29)
    (next s29 s30) (next s30 s31) (next s31 s32) (next s32 s33) (next s33 s34) (next s34 s35) (next s35 s36)
    (next s36 s37) (next s37 s38) (next s38 s39) (next s39 s40) (next s40 s41) (next s41 s42) (next s42 s43)
    (next s43 s44) (next s44 s45) (next s45 s46) (next s46 s47) (next s47 s48) (next s48 s49) (next s49 s50)
    (next s50 s51) (next s51 s52) (next s52 s53) (next s53 s54) (next s54 s55) (next s55 s56) (next s56 s57)
    (next s57 s58) (next s58 s59) (next s59 s60) (next s60 s61) (next s61 s62) (next s62 s63) (next s63 s64)
    (next s64 s65) (next s65 s66) (next s66 s67) (next s67 s68) (next s68 s69) (next s69 s70) (next s70 s71)
    (next s71 s72) (next s72 s73) (next s73 s74) (next s74 s75) (next s75 s76) (next s76 s77) (next s77 s78)
    (next s78 s79) (next s79 s80) (next s80 s81) (next s81 s82) (next s82 s83) (next s83 s84) (next s84 s85)
    (next s85 s86) (next s86 s87) (next s87 s88) (next s88 s89) (next s89 s90) (next s90 s91) (next s91 s92)
    (next s92 s93) (next s93 s94) (next s94 s95) (next s95 s96) (next s96 s97) (next s97 s98) (next s98 s99)
    (next s99 s100) (next s100 s101) (next s101 s102) (next s102 s103) (next s103 s104) (next s104 s105)
    (next s105 s106) (next s106 s107) (next s107 s108) (next s108 s109) (next s109 s110) (next s110 s111)
    (next s111 s112) (next s112 s113) (next s113 s114) (next s114 s115) (next s115 s116) (next s116 s117)
    (next s117 s118) (next s118 s119) (next s119 s120) (next s120 s121) (next s121 s122) (next s122 s123)
    (next s123 s124) (next s124 s125) (next s125 s126) (next s126 s127)

    ;; initially at first stage
    (at-stage s0)

    ;; initial stack on middle peg: from top to bottom A B C D E F G
    (on A B)
    (on B C)
    (on C D)
    (on D E)
    (on E F)
    (on F G)
    (on G middle)

    ;; top disk A is clear; others not listed as clear (false)
    (clear A)

    ;; left and right pegs are empty initially; middle is not listed as empty (false)
    (empty left)
    (empty right)

    ;; static size ordering
    (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F) (smaller A G)
    (smaller B C) (smaller B D) (smaller B E) (smaller B F) (smaller B G)
    (smaller C D) (smaller C E) (smaller C F) (smaller C G)
    (smaller D E) (smaller D F) (smaller D G)
    (smaller E F) (smaller E G)
    (smaller F G)
  )

  (:goal (and
    ;; all disks stacked on right peg from top to bottom A B C D E F G
    (on A B)
    (on B C)
    (on C D)
    (on D E)
    (on E F)
    (on F G)
    (on G right)
    (clear A)

    ;; left and middle pegs empty at the end
    (empty left)
    (empty middle)

    ;; final stage reached (ensures plan uses exactly the staged number of moves)
    (at-stage s127)
  ))
)