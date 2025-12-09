(define (problem hanoi-7-orchestration-problem)
  (:domain hanoi)
  (:objects
    a b c d e f g - disk
    left middle right - peg
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
    ;; initial stack on right: top a ... bottom g
    (on-peg g right)
    (on-disk f g)
    (on-disk e f)
    (on-disk d e)
    (on-disk c d)
    (on-disk b c)
    (on-disk a b)

    ;; clear flags: top disk a is clear; left and middle pegs are empty
    (clear-disk a)
    (clear-peg left)
    (clear-peg middle)

    ;; size ordering (smaller x y means x is smaller than y)
    (smaller a b) (smaller a c) (smaller a d) (smaller a e) (smaller a f) (smaller a g)
    (smaller b c) (smaller b d) (smaller b e) (smaller b f) (smaller b g)
    (smaller c d) (smaller c e) (smaller c f) (smaller c g)
    (smaller d e) (smaller d f) (smaller d g)
    (smaller e f) (smaller e g)
    (smaller f g)

    ;; step ordering: 127 moves require 128 step objects connected by succ
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

    (ready s1)
  )

  (:goal (and
    ;; goal stack on middle: top a ... bottom g
    (on-peg g middle)
    (on-disk f g)
    (on-disk e f)
    (on-disk d e)
    (on-disk c d)
    (on-disk b c)
    (on-disk a b)

    ;; both other pegs empty
    (clear-peg left)
    (clear-peg right)

    ;; all first 127 steps must be executed and final step ready
    (done s1) (done s2) (done s3) (done s4) (done s5) (done s6) (done s7) (done s8) (done s9) (done s10)
    (done s11) (done s12) (done s13) (done s14) (done s15) (done s16) (done s17) (done s18) (done s19) (done s20)
    (done s21) (done s22) (done s23) (done s24) (done s25) (done s26) (done s27) (done s28) (done s29) (done s30)
    (done s31) (done s32) (done s33) (done s34) (done s35) (done s36) (done s37) (done s38) (done s39) (done s40)
    (done s41) (done s42) (done s43) (done s44) (done s45) (done s46) (done s47) (done s48) (done s49) (done s50)
    (done s51) (done s52) (done s53) (done s54) (done s55) (done s56) (done s57) (done s58) (done s59) (done s60)
    (done s61) (done s62) (done s63) (done s64) (done s65) (done s66) (done s67) (done s68) (done s69) (done s70)
    (done s71) (done s72) (done s73) (done s74) (done s75) (done s76) (done s77) (done s78) (done s79) (done s80)
    (done s81) (done s82) (done s83) (done s84) (done s85) (done s86) (done s87) (done s88) (done s89) (done s90)
    (done s91) (done s92) (done s93) (done s94) (done s95) (done s96) (done s97) (done s98) (done s99) (done s100)
    (done s101) (done s102) (done s103) (done s104) (done s105) (done s106) (done s107) (done s108) (done s109) (done s110)
    (done s111) (done s112) (done s113) (done s114) (done s115) (done s116) (done s117) (done s118) (done s119) (done s120)
    (done s121) (done s122) (done s123) (done s124) (done s125) (done s126) (done s127)

    (ready s128)
  ))