(define (problem hanoi-7-orchestration-problem)
  (:domain hanoi)
  (:objects
    a b c d e f g - disk
    left middle right - peg

    ;; 128 steps: s1 .. s128 (127 moves)
    s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 s16
    s17 s18 s19 s20 s21 s22 s23 s24 s25 s26 s27 s28 s29 s30
    s31 s32 s33 s34 s35 s36 s37 s38 s39 s40 s41 s42 s43 s44
    s45 s46 s47 s48 s49 s50 s51 s52 s53 s54 s55 s56 s57 s58
    s59 s60 s61 s62 s63 s64 s65 s66 s67 s68 s69 s70 s71 s72
    s73 s74 s75 s76 s77 s78 s79 s80 s81 s82 s83 s84 s85 s86
    s87 s88 s89 s90 s91 s92 s93 s94 s95 s96 s97 s98 s99 s100
    s101 s102 s103 s104 s105 s106 s107 s108 s109 s110 s111 s112
    s113 s114 s115 s116 s117 s118 s119 s120 s121 s122 s123 s124
    s125 s126 s127 s128 - step
  )

  (:init
    ;; Initial stacking on right peg: top A, then B, ..., bottom G
    (on-peg g right)
    (on-disk f g)
    (on-disk e f)
    (on-disk d e)
    (on-disk c d)
    (on-disk b c)
    (on-disk a b)

    ;; Clear predicates: top disk a is clear, left and middle pegs empty
    (clear-disk a)
    (clear-peg left)
    (clear-peg middle)

    ;; Size ordering: a < b < c < d < e < f < g
    ;; smaller X Y means X is smaller than Y
    (smaller a b) (smaller a c) (smaller a d) (smaller a e) (smaller a f) (smaller a g)
    (smaller b c) (smaller b d) (smaller b e) (smaller b f) (smaller b g)
    (smaller c d) (smaller c e) (smaller c f) (smaller c g)
    (smaller d e) (smaller d f) (smaller d g)
    (smaller e f) (smaller e g)
    (smaller f g)

    ;; Succession chain for 127 moves: s1 -> s2 -> ... -> s128
    (succ s1 s2) (succ s2 s3) (succ s3 s4) (succ s4 s5) (succ s5 s6) (succ s6 s7)
    (succ s7 s8) (succ s8 s9) (succ s9 s10) (succ s10 s11) (succ s11 s12) (succ s12 s13)
    (succ s13 s14) (succ s14 s15) (succ s15 s16) (succ s16 s17) (succ s17 s18) (succ s18 s19)
    (succ s19 s20) (succ s20 s21) (succ s21 s22) (succ s22 s23) (succ s23 s24) (succ s24 s25)
    (succ s25 s26) (succ s26 s27) (succ s27 s28) (succ s28 s29) (succ s29 s30) (succ s30 s31)
    (succ s31 s32) (succ s32 s33) (succ s33 s34) (succ s34 s35) (succ s35 s36) (succ s36 s37)
    (succ s37 s38) (succ s38 s39) (succ s39 s40) (succ s40 s41) (succ s41 s42) (succ s42 s43)
    (succ s43 s44) (succ s44 s45) (succ s45 s46) (succ s46 s47) (succ s47 s48) (succ s48 s49)
    (succ s49 s50) (succ s50 s51) (succ s51 s52) (succ s52 s53) (succ s53 s54) (succ s54 s55)
    (succ s55 s56) (succ s56 s57) (succ s57 s58) (succ s58 s59) (succ s59 s60) (succ s60 s61)
    (succ s61 s62) (succ s62 s63) (succ s63 s64) (succ s64 s65) (succ s65 s66) (succ s66 s67)
    (succ s67 s68) (succ s68 s69) (succ s69 s70) (succ s70 s71) (succ s71 s72) (succ s72 s73)
    (succ s73 s74) (succ s74 s75) (succ s75 s76) (succ s76 s77) (succ s77 s78) (succ s78 s79)
    (succ s79 s80) (succ s80 s81) (succ s81 s82) (succ s82 s83) (succ s83 s84) (succ s84 s85)
    (succ s85 s86) (succ s86 s87) (succ s87 s88) (succ s88 s89) (succ s89 s90) (succ s90 s91)
    (succ s91 s92) (succ s92 s93) (succ s93 s94) (succ s94 s95) (succ s95 s96) (succ s96 s97)
    (succ s97 s98) (succ s98 s99) (succ s99 s100) (succ s100 s101) (succ s101 s102) (succ s102 s103)
    (succ s103 s104) (succ s104 s105) (succ s105 s106) (succ s106 s107) (succ s107 s108) (succ s108 s109)
    (succ s109 s110) (succ s110 s111) (succ s111 s112) (succ s112 s113) (succ s113 s114) (succ s114 s115)
    (succ s115 s116) (succ s116 s117) (succ s117 s118) (succ s118 s119) (succ s119 s120) (succ s120 s121)
    (succ s121 s122) (succ s122 s123) (succ s123 s124) (succ s124 s125) (succ s125 s126) (succ s126 s127)
    (succ s127 s128)

    ;; All steps initially unmoved (only s1..s127 required for moves)
    (step-unmoved s1) (step-unmoved s2) (step-unmoved s3) (step-unmoved s4)
    (step-unmoved s5) (step-unmoved s6) (step-unmoved s7) (step-unmoved s8)
    (step-unmoved s9) (step-unmoved s10) (step-unmoved s11) (step-unmoved s12)
    (step-unmoved s13) (step-unmoved s14) (step-unmoved s15) (step-unmoved s16)
    (step-unmoved s17) (step-unmoved s18) (step-unmoved s19) (step-unmoved s20)
    (step-unmoved s21) (step-unmoved s22) (step-unmoved s23) (step-unmoved s24)
    (step-unmoved s25) (step-unmoved s26) (step-unmoved s27) (step-unmoved s28)
    (step-unmoved s29) (step-unmoved s30) (step-unmoved s31) (step-unmoved s32)
    (step-unmoved s33) (step-unmoved s34) (step-unmoved s35) (step-unmoved s36)
    (step-unmoved s37) (step-unmoved s38) (step-unmoved s39) (step-unmoved s40)
    (step-unmoved s41) (step-unmoved s42) (step-unmoved s43) (step-unmoved s44)
    (step-unmoved s45) (step-unmoved s46) (step-unmoved s47) (step-unmoved s48)
    (step-unmoved s49) (step-unmoved s50) (step-unmoved s51) (step-unmoved s52)
    (step-unmoved s53) (step-unmoved s54) (step-unmoved s55) (step-unmoved s56)
    (step-unmoved s57) (step-unmoved s58) (step-unmoved s59) (step-unmoved s60)
    (step-unmoved s61) (step-unmoved s62) (step-unmoved s63) (step-unmoved s64)
    (step-unmoved s65) (step-unmoved s66) (step-unmoved s67) (step-unmoved s68)
    (step-unmoved s69) (step-unmoved s70) (step-unmoved s71) (step-unmoved s72)
    (step-unmoved s73) (step-unmoved s74) (step-unmoved s75) (step-unmoved s76)
    (step-unmoved s77) (step-unmoved s78) (step-unmoved s79) (step-unmoved s80)
    (step-unmoved s81) (step-unmoved s82) (step-unmoved s83) (step-unmoved s84)
    (step-unmoved s85) (step-unmoved s86) (step-unmoved s87) (step-unmoved s88)
    (step-unmoved s89) (step-unmoved s90) (step-unmoved s91) (step-unmoved s92)
    (step-unmoved s93) (step-unmoved s94) (step-unmoved s95) (step-unmoved s96)
    (step-unmoved s97) (step-unmoved s98) (step-unmoved s99) (step-unmoved s100)
    (step-unmoved s101) (step-unmoved s102) (step-unmoved s103) (step-unmoved s104)
    (step-unmoved s105) (step-unmoved s106) (step-unmoved s107) (step-unmoved s108)
    (step-unmoved s109) (step-unmoved s110) (step-unmoved s111) (step-unmoved s112)
    (step-unmoved s113) (step-unmoved s114) (step-unmoved s115) (step-unmoved s116)
    (step-unmoved s117) (step-unmoved s118) (step-unmoved s119) (step-unmoved s120)
    (step-unmoved s121) (step-unmoved s122) (step-unmoved s123) (step-unmoved s124)
    (step-unmoved s125) (step-unmoved s126) (step-unmoved s127)

    ;; first step is ready
    (ready s1)
  )

  (:goal (and
    ;; All disks stacked on middle peg with same top-to-bottom ordering a..g
    (on-peg g middle)
    (on-disk f g)
    (on-disk e f)
    (on-disk d e)
    (on-disk c d)
    (on-disk b c)
    (on-disk a b)

    ;; left and right pegs empty at end
    (clear-peg left)
    (clear-peg right)

    ;; all 127 moves verified and final readiness
    (verified-step s1) (verified-step s2) (verified-step s3) (verified-step s4) (verified-step s5)
    (verified-step s6) (verified-step s7) (verified-step s8) (verified-step s9) (verified-step s10)
    (verified-step s11) (verified-step s12) (verified-step s13) (verified-step s14) (verified-step s15)
    (verified-step s16) (verified-step s17) (verified-step s18) (verified-step s19) (verified-step s20)
    (verified-step s21) (verified-step s22) (verified-step s23) (verified-step s24) (verified-step s25)
    (verified-step s26) (verified-step s27) (verified-step s28) (verified-step s29) (verified-step s30)
    (verified-step s31) (verified-step s32) (verified-step s33) (verified-step s34) (verified-step s35)
    (verified-step s36) (verified-step s37) (verified-step s38) (verified-step s39) (verified-step s40)
    (verified-step s41) (verified-step s42) (verified-step s43) (verified-step s44) (verified-step s45)
    (verified-step s46) (verified-step s47) (verified-step s48) (verified-step s49) (verified-step s50)
    (verified-step s51) (verified-step s52) (verified-step s53) (verified-step s54) (verified-step s55)
    (verified-step s56) (verified-step s57) (verified-step s58) (verified-step s59) (verified-step s60)
    (verified-step s61) (verified-step s62) (verified-step s63) (verified-step s64) (verified-step s65)
    (verified-step s66) (verified-step s67) (verified-step s68) (verified-step s69) (verified-step s70)
    (verified-step s71) (verified-step s72) (verified-step s73) (verified-step s74) (verified-step s75)
    (verified-step s76) (verified-step s77) (verified-step s78) (verified-step s79) (verified-step s80)
    (verified-step s81) (verified-step s82) (verified-step s83) (verified-step s84) (verified-step s85)
    (verified-step s86) (verified-step s87) (verified-step s88) (verified-step s89) (verified-step s90)
    (verified-step s91) (verified-step s92) (verified-step s93) (verified-step s94) (verified-step s95)
    (verified-step s96) (verified-step s97) (verified-step s98) (verified-step s99) (verified-step s100)
    (verified-step s101) (verified-step s102) (verified-step s103) (verified-step s104) (verified-step s105)
    (verified-step s106) (verified-step s107) (verified-step s108) (verified-step s109) (verified-step s110)
    (verified-step s111) (verified-step s112) (verified-step s113) (verified-step s114) (verified-step s115)
    (verified-step s116) (verified-step s117) (verified-step s118) (verified-step s119) (verified-step s120)
    (verified-step s121) (verified-step s122) (verified-step s123) (verified-step s124) (verified-step s125)
    (verified-step s126) (verified-step s127)

    (ready s128)
  ))