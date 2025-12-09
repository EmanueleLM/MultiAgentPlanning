(define (problem hanoi-7-problem)
  (:domain hanoi-7)
  (:objects
    a b c d e f g - disk
    left middle right - peg
    s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 s16 s17 s18 s19 s20
    s21 s22 s23 s24 s25 s26 s27 s28 s29 s30 s31 s32 s33 s34 s35 s36 s37 s38 s39 s40
    s41 s42 s43 s44 s45 s46 s47 s48 s49 s50 s51 s52 s53 s54 s55 s56 s57 s58 s59 s60
    s61 s62 s63 s64 s65 s66 s67 s68 s69 s70 s71 s72 s73 s74 s75 s76 s77 s78 s79 s80
    s81 s82 s83 s84 s85 s86 s87 s88 s89 s90 s91 s92 s93 s94 s95 s96 s97 s98 s99 s100
    s101 s102 s103 s104 s105 s106 s107 s108 s109 s110 s111 s112 s113 s114 s115 s116 s117 s118 s119 s120
    s121 s122 s123 s124 s125 s126 s127 - step
  )

  (:init
    ;; size ordering (from smallest to largest)
    (smaller a b) (smaller a c) (smaller a d) (smaller a e) (smaller a f) (smaller a g)
    (smaller b c) (smaller b d) (smaller b e) (smaller b f) (smaller b g)
    (smaller c d) (smaller c e) (smaller c f) (smaller c g)
    (smaller d e) (smaller d f) (smaller d g)
    (smaller e f) (smaller e g)
    (smaller f g)

    ;; initial stack on right peg: a on b, b on c, c on d, d on e, e on f, f on g, g on right
    (on-disk a b)
    (on-disk b c)
    (on-disk c d)
    (on-disk d e)
    (on-disk e f)
    (on-disk f g)
    (on-peg g right)

    ;; every disk belongs to the right peg initially
    (base-peg a right)
    (base-peg b right)
    (base-peg c right)
    (base-peg d right)
    (base-peg e right)
    (base-peg f right)
    (base-peg g right)

    ;; topmost disk and empty pegs
    (clear-disk a)
    (clear-peg left)
    (clear-peg middle)

    ;; ordered steps (127 moves => 127 step objects with next-step links)
    (next-step s1 s2) (next-step s2 s3) (next-step s3 s4) (next-step s4 s5) (next-step s5 s6)
    (next-step s6 s7) (next-step s7 s8) (next-step s8 s9) (next-step s9 s10) (next-step s10 s11)
    (next-step s11 s12) (next-step s12 s13) (next-step s13 s14) (next-step s14 s15) (next-step s15 s16)
    (next-step s16 s17) (next-step s17 s18) (next-step s18 s19) (next-step s19 s20) (next-step s20 s21)
    (next-step s21 s22) (next-step s22 s23) (next-step s23 s24) (next-step s24 s25) (next-step s25 s26)
    (next-step s26 s27) (next-step s27 s28) (next-step s28 s29) (next-step s29 s30) (next-step s30 s31)
    (next-step s31 s32) (next-step s32 s33) (next-step s33 s34) (next-step s34 s35) (next-step s35 s36)
    (next-step s36 s37) (next-step s37 s38) (next-step s38 s39) (next-step s39 s40) (next-step s40 s41)
    (next-step s41 s42) (next-step s42 s43) (next-step s43 s44) (next-step s44 s45) (next-step s45 s46)
    (next-step s46 s47) (next-step s47 s48) (next-step s48 s49) (next-step s49 s50) (next-step s50 s51)
    (next-step s51 s52) (next-step s52 s53) (next-step s53 s54) (next-step s54 s55) (next-step s55 s56)
    (next-step s56 s57) (next-step s57 s58) (next-step s58 s59) (next-step s59 s60) (next-step s60 s61)
    (next-step s61 s62) (next-step s62 s63) (next-step s63 s64) (next-step s64 s65) (next-step s65 s66)
    (next-step s66 s67) (next-step s67 s68) (next-step s68 s69) (next-step s69 s70) (next-step s70 s71)
    (next-step s71 s72) (next-step s72 s73) (next-step s73 s74) (next-step s74 s75) (next-step s75 s76)
    (next-step s76 s77) (next-step s77 s78) (next-step s78 s79) (next-step s79 s80) (next-step s80 s81)
    (next-step s81 s82) (next-step s82 s83) (next-step s83 s84) (next-step s84 s85) (next-step s85 s86)
    (next-step s86 s87) (next-step s87 s88) (next-step s88 s89) (next-step s89 s90) (next-step s90 s91)
    (next-step s91 s92) (next-step s92 s93) (next-step s93 s94) (next-step s94 s95) (next-step s95 s96)
    (next-step s96 s97) (next-step s97 s98) (next-step s98 s99) (next-step s99 s100) (next-step s100 s101)
    (next-step s101 s102) (next-step s102 s103) (next-step s103 s104) (next-step s104 s105) (next-step s105 s106)
    (next-step s106 s107) (next-step s107 s108) (next-step s108 s109) (next-step s109 s110) (next-step s110 s111)
    (next-step s111 s112) (next-step s112 s113) (next-step s113 s114) (next-step s114 s115) (next-step s115 s116)
    (next-step s116 s117) (next-step s117 s118) (next-step s118 s119) (next-step s119 s120) (next-step s120 s121)
    (next-step s121 s122) (next-step s122 s123) (next-step s123 s124) (next-step s124 s125) (next-step s125 s126)
    (next-step s126 s127)

    ;; start with the first step enabled
    (enabled s1)
  )

  (:goal (and
    ;; final stacking on left peg: a on b, b on c, ..., f on g, g on left
    (on-disk a b)
    (on-disk b c)
    (on-disk c d)
    (on-disk d e)
    (on-disk e f)
    (on-disk f g)
    (on-peg g left)

    ;; every disk belongs to left peg
    (base-peg a left)
    (base-peg b left)
    (base-peg c left)
    (base-peg d left)
    (base-peg e left)
    (base-peg f left)
    (base-peg g left)

    ;; middle and right pegs empty at goal
    (clear-peg middle)
    (clear-peg right)

    (clear-disk a)

    ;; require every step to be executed in order (contiguous progression)
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
  ))