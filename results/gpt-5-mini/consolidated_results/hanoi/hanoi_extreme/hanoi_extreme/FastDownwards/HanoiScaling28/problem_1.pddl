(define (problem hanoi-7)
  (:domain hanoi)
  (:objects
    ;; disks ordered smallest->largest: a (smallest) ... g (largest)
    a b c d e f g - disk
    left middle right - peg

    ;; stages: allow up to 127 moves (2^7 - 1 = 127)
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 s16 s17 s18 s19 s20 s21 s22 s23 s24 s25 s26 s27 s28 s29 s30 s31 s32 s33 s34 s35 s36 s37 s38 s39 s40 s41 s42 s43 s44 s45 s46 s47 s48 s49 s50 s51 s52 s53 s54 s55 s56 s57 s58 s59 s60 s61 s62 s63 s64 s65 s66 s67 s68 s69 s70 s71 s72 s73 s74 s75 s76 s77 s78 s79 s80 s81 s82 s83 s84 s85 s86 s87 s88 s89 s90 s91 s92 s93 s94 s95 s96 s97 s98 s99 s100 s101 s102 s103 s104 s105 s106 s107 s108 s109 s110 s111 s112 s113 s114 s115 s116 s117 s118 s119 s120 s121 s122 s123 s124 s125 s126 s127 - stage
  )

  (:init
    ;; typing facts
    (disk a) (disk b) (disk c) (disk d) (disk e) (disk f) (disk g)
    (peg left) (peg middle) (peg right)
    (stage s0) (stage s1) (stage s2) (stage s3) (stage s4) (stage s5) (stage s6) (stage s7) (stage s8) (stage s9)
    (stage s10) (stage s11) (stage s12) (stage s13) (stage s14) (stage s15) (stage s16) (stage s17) (stage s18) (stage s19)
    (stage s20) (stage s21) (stage s22) (stage s23) (stage s24) (stage s25) (stage s26) (stage s27) (stage s28) (stage s29)
    (stage s30) (stage s31) (stage s32) (stage s33) (stage s34) (stage s35) (stage s36) (stage s37) (stage s38) (stage s39)
    (stage s40) (stage s41) (stage s42) (stage s43) (stage s44) (stage s45) (stage s46) (stage s47) (stage s48) (stage s49)
    (stage s50) (stage s51) (stage s52) (stage s53) (stage s54) (stage s55) (stage s56) (stage s57) (stage s58) (stage s59)
    (stage s60) (stage s61) (stage s62) (stage s63) (stage s64) (stage s65) (stage s66) (stage s67) (stage s68) (stage s69)
    (stage s70) (stage s71) (stage s72) (stage s73) (stage s74) (stage s75) (stage s76) (stage s77) (stage s78) (stage s79)
    (stage s80) (stage s81) (stage s82) (stage s83) (stage s84) (stage s85) (stage s86) (stage s87) (stage s88) (stage s89)
    (stage s90) (stage s91) (stage s92) (stage s93) (stage s94) (stage s95) (stage s96) (stage s97) (stage s98) (stage s99)
    (stage s100) (stage s101) (stage s102) (stage s103) (stage s104) (stage s105) (stage s106) (stage s107) (stage s108) (stage s109)
    (stage s110) (stage s111) (stage s112) (stage s113) (stage s114) (stage s115) (stage s116) (stage s117) (stage s118) (stage s119)
    (stage s120) (stage s121) (stage s122) (stage s123) (stage s124) (stage s125) (stage s126) (stage s127)

    ;; successor chain for stages
    (succ s0 s1) (succ s1 s2) (succ s2 s3) (succ s3 s4) (succ s4 s5) (succ s5 s6) (succ s6 s7) (succ s7 s8) (succ s8 s9)
    (succ s9 s10) (succ s10 s11) (succ s11 s12) (succ s12 s13) (succ s13 s14) (succ s14 s15) (succ s15 s16) (succ s16 s17) (succ s17 s18) (succ s18 s19)
    (succ s19 s20) (succ s20 s21) (succ s21 s22) (succ s22 s23) (succ s23 s24) (succ s24 s25) (succ s25 s26) (succ s26 s27) (succ s27 s28) (succ s28 s29)
    (succ s29 s30) (succ s30 s31) (succ s31 s32) (succ s32 s33) (succ s33 s34) (succ s34 s35) (succ s35 s36) (succ s36 s37) (succ s37 s38) (succ s38 s39)
    (succ s39 s40) (succ s40 s41) (succ s41 s42) (succ s42 s43) (succ s43 s44) (succ s44 s45) (succ s45 s46) (succ s46 s47) (succ s47 s48) (succ s48 s49)
    (succ s49 s50) (succ s50 s51) (succ s51 s52) (succ s52 s53) (succ s53 s54) (succ s54 s55) (succ s55 s56) (succ s56 s57) (succ s57 s58) (succ s58 s59)
    (succ s59 s60) (succ s60 s61) (succ s61 s62) (succ s62 s63) (succ s63 s64) (succ s64 s65) (succ s65 s66) (succ s66 s67) (succ s67 s68) (succ s68 s69)
    (succ s69 s70) (succ s70 s71) (succ s71 s72) (succ s72 s73) (succ s73 s74) (succ s74 s75) (succ s75 s76) (succ s76 s77) (succ s77 s78) (succ s78 s79)
    (succ s79 s80) (succ s80 s81) (succ s81 s82) (succ s82 s83) (succ s83 s84) (succ s84 s85) (succ s85 s86) (succ s86 s87) (succ s87 s88) (succ s88 s89)
    (succ s89 s90) (succ s90 s91) (succ s91 s92) (succ s92 s93) (succ s93 s94) (succ s94 s95) (succ s95 s96) (succ s96 s97) (succ s97 s98) (succ s98 s99)
    (succ s99 s100) (succ s100 s101) (succ s101 s102) (succ s102 s103) (succ s103 s104) (succ s104 s105) (succ s105 s106) (succ s106 s107) (succ s107 s108) (succ s108 s109)
    (succ s109 s110) (succ s110 s111) (succ s111 s112) (succ s112 s113) (succ s113 s114) (succ s114 s115) (succ s115 s116) (succ s116 s117) (succ s117 s118) (succ s118 s119)
    (succ s119 s120) (succ s120 s121) (succ s121 s122) (succ s122 s123) (succ s123 s124) (succ s124 s125) (succ s125 s126) (succ s126 s127)

    ;; initial active stage
    (active s0)

    ;; size ordering (static) - smaller x y means x < y in size
    (smaller a b) (smaller a c) (smaller a d) (smaller a e) (smaller a f) (smaller a g)
    (smaller b c) (smaller b d) (smaller b e) (smaller b f) (smaller b g)
    (smaller c d) (smaller c e) (smaller c f) (smaller c g)
    (smaller d e) (smaller d f) (smaller d g)
    (smaller e f) (smaller e g)
    (smaller f g)

    ;; Initial stacking on the right peg: top-to-bottom a, b, c, d, e, f, g
    ;; Representation: (on X Y) means X is immediately above Y (Y supports X).
    (on a b)
    (on b c)
    (on c d)
    (on d e)
    (on e f)
    (on f g)
    (on g right)

    ;; top disk on right is 'a'
    (top a right)

    ;; left and middle pegs initially empty
    (empty left)
    (empty middle)

    ;; right peg is not empty (by absence of (empty right))
  )

  ;; Goal: entire stack a (top) ... g (bottom) on middle peg; left and right empty.
  (:goal (and
    ;; desired stack (a immediately above b, etc., bottom g on middle peg)
    (on a b)
    (on b c)
    (on c d)
    (on d e)
    (on e f)
    (on f g)
    (on g middle)

    ;; top and emptiness conditions
    (top a middle)
    (empty left)
    (empty right)
  ))
)