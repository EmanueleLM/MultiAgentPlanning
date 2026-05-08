(define (problem hanoi-7-staged)
  (:domain hanoi)

  (:objects
    A B C D E F G - disk
    left middle right - peg
    ;; stages: one initial plus one per move; 7 disks require 2^7 - 1 = 127 moves, so stages s0..s127
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 s16 s17 s18 s19
    s20 s21 s22 s23 s24 s25 s26 s27 s28 s29 s30 s31 s32 s33 s34 s35 s36 s37 s38 s39
    s40 s41 s42 s43 s44 s45 s46 s47 s48 s49 s50 s51 s52 s53 s54 s55 s56 s57 s58 s59
    s60 s61 s62 s63 s64 s65 s66 s67 s68 s69 s70 s71 s72 s73 s74 s75 s76 s77 s78 s79
    s80 s81 s82 s83 s84 s85 s86 s87 s88 s89 s90 s91 s92 s93 s94 s95 s96 s97 s98 s99
    s100 s101 s102 s103 s104 s105 s106 s107 s108 s109 s110 s111 s112 s113 s114 s115 s116 s117 s118 s119
    s120 s121 s122 s123 s124 s125 s126 s127 - stage
  )

  (:init
    ;; initial stack on middle: from top A on B, B on C, ..., F on G, and G on peg middle
    (on-disk A B)
    (on-disk B C)
    (on-disk C D)
    (on-disk D E)
    (on-disk E F)
    (on-disk F G)
    (on-peg  G middle)

    ;; top-of-stack and peg clear flags (only top A is clear; left and right pegs are empty)
    (clear-disk A)
    (clear-peg left)
    (clear-peg right)
    ;; middle peg is not clear initially (a disk is on it), so (clear-peg middle) is intentionally absent.

    ;; size ordering (A < B < C < D < E < F < G)
    (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F) (smaller A G)
    (smaller B C) (smaller B D) (smaller B E) (smaller B F) (smaller B G)
    (smaller C D) (smaller C E) (smaller C F) (smaller C G)
    (smaller D E) (smaller D F) (smaller D G)
    (smaller E F) (smaller E G)
    (smaller F G)

    ;; stage ordering: current s0 and linear succession s0->s1->...->s127
    (current s0)
    (succ s0 s1)   (succ s1 s2)   (succ s2 s3)   (succ s3 s4)   (succ s4 s5)   (succ s5 s6)   (succ s6 s7)
    (succ s7 s8)   (succ s8 s9)   (succ s9 s10)  (succ s10 s11) (succ s11 s12) (succ s12 s13) (succ s13 s14)
    (succ s14 s15) (succ s15 s16) (succ s16 s17) (succ s17 s18) (succ s18 s19) (succ s19 s20)
    (succ s20 s21) (succ s21 s22) (succ s22 s23) (succ s23 s24) (succ s24 s25) (succ s25 s26) (succ s26 s27)
    (succ s27 s28) (succ s28 s29) (succ s29 s30) (succ s30 s31) (succ s31 s32) (succ s32 s33) (succ s33 s34)
    (succ s34 s35) (succ s35 s36) (succ s36 s37) (succ s37 s38) (succ s38 s39) (succ s39 s40)
    (succ s40 s41) (succ s41 s42) (succ s42 s43) (succ s43 s44) (succ s44 s45) (succ s45 s46) (succ s46 s47)
    (succ s47 s48) (succ s48 s49) (succ s49 s50) (succ s50 s51) (succ s51 s52) (succ s52 s53) (succ s53 s54)
    (succ s54 s55) (succ s55 s56) (succ s56 s57) (succ s57 s58) (succ s58 s59) (succ s59 s60)
    (succ s60 s61) (succ s61 s62) (succ s62 s63) (succ s63 s64) (succ s64 s65) (succ s65 s66) (succ s66 s67)
    (succ s67 s68) (succ s68 s69) (succ s69 s70) (succ s70 s71) (succ s71 s72) (succ s72 s73) (succ s73 s74)
    (succ s74 s75) (succ s75 s76) (succ s76 s77) (succ s77 s78) (succ s78 s79) (succ s79 s80)
    (succ s80 s81) (succ s81 s82) (succ s82 s83) (succ s83 s84) (succ s84 s85) (succ s85 s86) (succ s86 s87)
    (succ s87 s88) (succ s88 s89) (succ s89 s90) (succ s90 s91) (succ s91 s92) (succ s92 s93) (succ s93 s94)
    (succ s94 s95) (succ s95 s96) (succ s96 s97) (succ s97 s98) (succ s98 s99) (succ s99 s100)
    (succ s100 s101) (succ s101 s102) (succ s102 s103) (succ s103 s104) (succ s104 s105) (succ s105 s106) (succ s106 s107)
    (succ s107 s108) (succ s108 s109) (succ s109 s110) (succ s110 s111) (succ s111 s112) (succ s112 s113) (succ s113 s114)
    (succ s114 s115) (succ s115 s116) (succ s116 s117) (succ s117 s118) (succ s118 s119) (succ s119 s120)
    (succ s120 s121) (succ s121 s122) (succ s122 s123) (succ s123 s124) (succ s124 s125) (succ s125 s126) (succ s126 s127)
  )

  (:goal (and
    ;; goal stack on right: G bottom and same immediate on-disk links above
    (on-disk A B)
    (on-disk B C)
    (on-disk C D)
    (on-disk D E)
    (on-disk E F)
    (on-disk F G)
    (on-peg  G right)

    ;; left and middle pegs empty
    (clear-peg left)
    (clear-peg middle)

    ;; final stage reached exactly after 127 moves
    (current s127)
  ))
)