(define (problem hanoi7-problem)
  (:domain hanoi7)
  (:objects
    a b c d e f g - disk
    left middle right - peg
    s1 s2 s3 s4 s5 s6 s7 s8 s9 s10
    s11 s12 s13 s14 s15 s16 s17 s18 s19 s20
    s21 s22 s23 s24 s25 s26 s27 s28 s29 s30
    s31 s32 s33 s34 s35 s36 s37 s38 s39 s40
    s41 s42 s43 s44 s45 s46 s47 s48 s49 s50
    s51 s52 s53 s54 s55 s56 s57 s58 s59 s60
    s61 s62 s63 s64 s65 s66 s67 s68 s69 s70
    s71 s72 s73 s74 s75 s76 s77 s78 s79 s80
    s81 s82 s83 s84 s85 s86 s87 s88 s89 s90
    s91 s92 s93 s94 s95 s96 s97 s98 s99 s100
    s101 s102 s103 s104 s105 s106 s107 s108 s109 s110
    s111 s112 s113 s114 s115 s116 s117 s118 s119 s120
    s121 s122 s123 s124 s125 s126 s127 s128 - step
  )

  (:init
    ;; initial stack on left: top a on b on c on d on e on f on g on left
    (on a b)
    (on b c)
    (on c d)
    (on d e)
    (on e f)
    (on f g)
    (on g left)

    ;; only top-of-stack disk and empty pegs are clear initially
    (clear a)
    (clear middle)
    (clear right)

    ;; size relations (strict ordering: a < b < c < d < e < f < g)
    (smaller a b) (smaller a c) (smaller a d) (smaller a e) (smaller a f) (smaller a g)
    (smaller b c) (smaller b d) (smaller b e) (smaller b f) (smaller b g)
    (smaller c d) (smaller c e) (smaller c f) (smaller c g)
    (smaller d e) (smaller d f) (smaller d g)
    (smaller e f) (smaller e g)
    (smaller f g)

    ;; temporal progression: start at s1 and linear successor chain up to s128 (127 moves)
    (current s1)

    (next s1 s2) (next s2 s3) (next s3 s4) (next s4 s5) (next s5 s6) (next s6 s7) (next s7 s8) (next s8 s9) (next s9 s10)
    (next s10 s11) (next s11 s12) (next s12 s13) (next s13 s14) (next s14 s15) (next s15 s16) (next s16 s17) (next s17 s18) (next s18 s19) (next s19 s20)
    (next s20 s21) (next s21 s22) (next s22 s23) (next s23 s24) (next s24 s25) (next s25 s26) (next s26 s27) (next s27 s28) (next s28 s29) (next s29 s30)
    (next s30 s31) (next s31 s32) (next s32 s33) (next s33 s34) (next s34 s35) (next s35 s36) (next s36 s37) (next s37 s38) (next s38 s39) (next s39 s40)
    (next s40 s41) (next s41 s42) (next s42 s43) (next s43 s44) (next s44 s45) (next s45 s46) (next s46 s47) (next s47 s48) (next s48 s49) (next s49 s50)
    (next s50 s51) (next s51 s52) (next s52 s53) (next s53 s54) (next s54 s55) (next s55 s56) (next s56 s57) (next s57 s58) (next s58 s59) (next s59 s60)
    (next s60 s61) (next s61 s62) (next s62 s63) (next s63 s64) (next s64 s65) (next s65 s66) (next s66 s67) (next s67 s68) (next s68 s69) (next s69 s70)
    (next s70 s71) (next s71 s72) (next s72 s73) (next s73 s74) (next s74 s75) (next s75 s76) (next s76 s77) (next s77 s78) (next s78 s79) (next s79 s80)
    (next s80 s81) (next s81 s82) (next s82 s83) (next s83 s84) (next s84 s85) (next s85 s86) (next s86 s87) (next s87 s88) (next s88 s89) (next s89 s90)
    (next s90 s91) (next s91 s92) (next s92 s93) (next s93 s94) (next s94 s95) (next s95 s96) (next s96 s97) (next s97 s98) (next s98 s99) (next s99 s100)
    (next s100 s101) (next s101 s102) (next s102 s103) (next s103 s104) (next s104 s105) (next s105 s106) (next s106 s107) (next s107 s108) (next s108 s109) (next s109 s110)
    (next s110 s111) (next s111 s112) (next s112 s113) (next s113 s114) (next s114 s115) (next s115 s116) (next s116 s117) (next s117 s118) (next s118 s119) (next s119 s120)
    (next s120 s121) (next s121 s122) (next s122 s123) (next s123 s124) (next s124 s125) (next s125 s126) (next s126 s127) (next s127 s128)
  )

  (:goal (and
    ;; final stack on right: top a on b on c on d on e on f on g on right
    (on a b)
    (on b c)
    (on c d)
    (on d e)
    (on e f)
    (on f g)
    (on g right)
    ;; left and middle must be empty
    (clear left)
    (clear middle)
    ;; require reaching the final timestep after 127 moves
    (current s128)
  ))