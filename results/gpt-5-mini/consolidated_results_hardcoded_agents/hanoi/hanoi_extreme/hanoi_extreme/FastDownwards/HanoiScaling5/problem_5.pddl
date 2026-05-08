(define (problem hanoi-7-staged-problem)
  (:domain hanoi-7-staged)

  (:objects
    a b c d e f g - disk
    left middle right - peg

    ;; discrete stages: s0 .. s127 (127 moves maximum for 7 disks)
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15
    s16 s17 s18 s19 s20 s21 s22 s23 s24 s25 s26 s27 s28 s29 s30 s31
    s32 s33 s34 s35 s36 s37 s38 s39 s40 s41 s42 s43 s44 s45 s46 s47
    s48 s49 s50 s51 s52 s53 s54 s55 s56 s57 s58 s59 s60 s61 s62 s63
    s64 s65 s66 s67 s68 s69 s70 s71 s72 s73 s74 s75 s76 s77 s78 s79
    s80 s81 s82 s83 s84 s85 s86 s87 s88 s89 s90 s91 s92 s93 s94 s95
    s96 s97 s98 s99 s100 s101 s102 s103 s104 s105 s106 s107 s108 s109 s110 s111
    s112 s113 s114 s115 s116 s117 s118 s119 s120 s121 s122 s123 s124 s125 s126 s127
    - step
  )

  (:init
    ;; step declarations
    (step s0) (step s1) (step s2) (step s3) (step s4) (step s5) (step s6) (step s7)
    (step s8) (step s9) (step s10) (step s11) (step s12) (step s13) (step s14) (step s15)
    (step s16) (step s17) (step s18) (step s19) (step s20) (step s21) (step s22) (step s23)
    (step s24) (step s25) (step s26) (step s27) (step s28) (step s29) (step s30) (step s31)
    (step s32) (step s33) (step s34) (step s35) (step s36) (step s37) (step s38) (step s39)
    (step s40) (step s41) (step s42) (step s43) (step s44) (step s45) (step s46) (step s47)
    (step s48) (step s49) (step s50) (step s51) (step s52) (step s53) (step s54) (step s55)
    (step s56) (step s57) (step s58) (step s59) (step s60) (step s61) (step s62) (step s63)
    (step s64) (step s65) (step s66) (step s67) (step s68) (step s69) (step s70) (step s71)
    (step s72) (step s73) (step s74) (step s75) (step s76) (step s77) (step s78) (step s79)
    (step s80) (step s81) (step s82) (step s83) (step s84) (step s85) (step s86) (step s87)
    (step s88) (step s89) (step s90) (step s91) (step s92) (step s93) (step s94) (step s95)
    (step s96) (step s97) (step s98) (step s99) (step s100) (step s101) (step s102) (step s103)
    (step s104) (step s105) (step s106) (step s107) (step s108) (step s109) (step s110) (step s111)
    (step s112) (step s113) (step s114) (step s115) (step s116) (step s117) (step s118) (step s119)
    (step s120) (step s121) (step s122) (step s123) (step s124) (step s125) (step s126) (step s127)

    ;; successor (next) relation to enforce contiguous stage progression
    (next s0 s1) (next s1 s2) (next s2 s3) (next s3 s4) (next s4 s5) (next s5 s6) (next s6 s7) (next s7 s8)
    (next s8 s9) (next s9 s10) (next s10 s11) (next s11 s12) (next s12 s13) (next s13 s14) (next s14 s15) (next s15 s16)
    (next s16 s17) (next s17 s18) (next s18 s19) (next s19 s20) (next s20 s21) (next s21 s22) (next s22 s23) (next s23 s24)
    (next s24 s25) (next s25 s26) (next s26 s27) (next s27 s28) (next s28 s29) (next s29 s30) (next s30 s31) (next s31 s32)
    (next s32 s33) (next s33 s34) (next s34 s35) (next s35 s36) (next s36 s37) (next s37 s38) (next s38 s39) (next s39 s40)
    (next s40 s41) (next s41 s42) (next s42 s43) (next s43 s44) (next s44 s45) (next s45 s46) (next s46 s47) (next s47 s48)
    (next s48 s49) (next s49 s50) (next s50 s51) (next s51 s52) (next s52 s53) (next s53 s54) (next s54 s55) (next s55 s56)
    (next s56 s57) (next s57 s58) (next s58 s59) (next s59 s60) (next s60 s61) (next s61 s62) (next s62 s63) (next s63 s64)
    (next s64 s65) (next s65 s66) (next s66 s67) (next s67 s68) (next s68 s69) (next s69 s70) (next s70 s71) (next s71 s72)
    (next s72 s73) (next s73 s74) (next s74 s75) (next s75 s76) (next s76 s77) (next s77 s78) (next s78 s79) (next s79 s80)
    (next s80 s81) (next s81 s82) (next s82 s83) (next s83 s84) (next s84 s85) (next s85 s86) (next s86 s87) (next s87 s88)
    (next s88 s89) (next s89 s90) (next s90 s91) (next s91 s92) (next s92 s93) (next s93 s94) (next s94 s95) (next s95 s96)
    (next s96 s97) (next s97 s98) (next s98 s99) (next s99 s100) (next s100 s101) (next s101 s102) (next s102 s103) (next s103 s104)
    (next s104 s105) (next s105 s106) (next s106 s107) (next s107 s108) (next s108 s109) (next s109 s110) (next s110 s111) (next s111 s112)
    (next s112 s113) (next s113 s114) (next s114 s115) (next s115 s116) (next s116 s117) (next s117 s118) (next s118 s119) (next s119 s120)
    (next s120 s121) (next s121 s122) (next s122 s123) (next s123 s124) (next s124 s125) (next s125 s126) (next s126 s127)

    ;; initial current stage
    (current s0)

    ;; explicit static size ordering (smaller facts)
    (smaller a b) (smaller a c) (smaller a d) (smaller a e) (smaller a f) (smaller a g)
    (smaller b c) (smaller b d) (smaller b e) (smaller b f) (smaller b g)
    (smaller c d) (smaller c e) (smaller c f) (smaller c g)
    (smaller d e) (smaller d f) (smaller d g)
    (smaller e f) (smaller e g)
    (smaller f g)

    ;; pairwise inequality facts for pegs (ordered pairs)
    (diff-peg left middle) (diff-peg left right)
    (diff-peg middle left) (diff-peg middle right)
    (diff-peg right left) (diff-peg right middle)

    ;; pairwise inequality facts for disks (ordered pairs; all unequal pairs)
    (diff-disk a b) (diff-disk a c) (diff-disk a d) (diff-disk a e) (diff-disk a f) (diff-disk a g)
    (diff-disk b a) (diff-disk b c) (diff-disk b d) (diff-disk b e) (diff-disk b f) (diff-disk b g)
    (diff-disk c a) (diff-disk c b) (diff-disk c d) (diff-disk c e) (diff-disk c f) (diff-disk c g)
    (diff-disk d a) (diff-disk d b) (diff-disk d c) (diff-disk d e) (diff-disk d f) (diff-disk d g)
    (diff-disk e a) (diff-disk e b) (diff-disk e c) (diff-disk e d) (diff-disk e f) (diff-disk e g)
    (diff-disk f a) (diff-disk f b) (diff-disk f c) (diff-disk f d) (diff-disk f e) (diff-disk f g)
    (diff-disk g a) (diff-disk g b) (diff-disk g c) (diff-disk g d) (diff-disk g e) (diff-disk g f)

    ;; initial stack on the right peg: top a on b, b on c, ..., f on g, bottom g on right
    (on-disk a b)
    (on-disk b c)
    (on-disk c d)
    (on-disk d e)
    (on-disk e f)
    (on-disk f g)
    (on-peg g right)

    ;; top/peg occupancy facts consistent with above
    (clear a)
    (empty left)
    (empty middle)
    ;; right is non-empty (no (empty right) fact)
  )

  (:goal (and
    ;; require completion at final stage s127 to enforce contiguous progression
    (current s127)

    ;; full stack moved to left peg with same internal ordering (top a ...)
    (on-disk a b)
    (on-disk b c)
    (on-disk c d)
    (on-disk d e)
    (on-disk e f)
    (on-disk f g)
    (on-peg g left)

    ;; intermediate and original pegs must be empty in the final stage
    (empty middle)
    (empty right)
  ))