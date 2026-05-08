(define (problem hanoi-7-problem)
  (:domain hanoi-7)

  (:objects
    A B C D E F G - disk
    left middle right - peg

    ; ordered steps to bound the plan length to 127 (optimal for 7 disks)
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
    s121 s122 s123 s124 s125 s126 s127 - step
  )

  (:init
    ; size ordering: A smallest ... G largest
    (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F) (smaller A G)
    (smaller B C) (smaller B D) (smaller B E) (smaller B F) (smaller B G)
    (smaller C D) (smaller C E) (smaller C F) (smaller C G)
    (smaller D E) (smaller D F) (smaller D G)
    (smaller E F) (smaller E G)
    (smaller F G)

    ; initial membership: all disks are on the middle peg (somewhere in the stack)
    (on A middle) (on B middle) (on C middle) (on D middle) (on E middle) (on F middle) (on G middle)

    ; direct stacking relations on the middle peg (top->...->bottom)
    (directly-on-disk A B middle)
    (directly-on-disk B C middle)
    (directly-on-disk C D middle)
    (directly-on-disk D E middle)
    (directly-on-disk E F middle)
    (directly-on-disk F G middle)
    (directly-on-peg G middle)

    ; top of pegs initially: middle top is A; left and right are empty
    (top middle A)
    (empty left)
    (empty right)

    ; step control: first step ready; others chained
    (step-ready s1)
    (step-next s1 s2) (step-next s2 s3) (step-next s3 s4) (step-next s4 s5) (step-next s5 s6)
    (step-next s6 s7) (step-next s7 s8) (step-next s8 s9) (step-next s9 s10) (step-next s10 s11)
    (step-next s11 s12) (step-next s12 s13) (step-next s13 s14) (step-next s14 s15) (step-next s15 s16)
    (step-next s16 s17) (step-next s17 s18) (step-next s18 s19) (step-next s19 s20) (step-next s20 s21)
    (step-next s21 s22) (step-next s22 s23) (step-next s23 s24) (step-next s24 s25) (step-next s25 s26)
    (step-next s26 s27) (step-next s27 s28) (step-next s28 s29) (step-next s29 s30) (step-next s30 s31)
    (step-next s31 s32) (step-next s32 s33) (step-next s33 s34) (step-next s34 s35) (step-next s35 s36)
    (step-next s36 s37) (step-next s37 s38) (step-next s38 s39) (step-next s39 s40) (step-next s40 s41)
    (step-next s41 s42) (step-next s42 s43) (step-next s43 s44) (step-next s44 s45) (step-next s45 s46)
    (step-next s46 s47) (step-next s47 s48) (step-next s48 s49) (step-next s49 s50) (step-next s50 s51)
    (step-next s51 s52) (step-next s52 s53) (step-next s53 s54) (step-next s54 s55) (step-next s55 s56)
    (step-next s56 s57) (step-next s57 s58) (step-next s58 s59) (step-next s59 s60) (step-next s60 s61)
    (step-next s61 s62) (step-next s62 s63) (step-next s63 s64) (step-next s64 s65) (step-next s65 s66)
    (step-next s66 s67) (step-next s67 s68) (step-next s68 s69) (step-next s69 s70) (step-next s70 s71)
    (step-next s71 s72) (step-next s72 s73) (step-next s73 s74) (step-next s74 s75) (step-next s75 s76)
    (step-next s76 s77) (step-next s77 s78) (step-next s78 s79) (step-next s79 s80) (step-next s80 s81)
    (step-next s81 s82) (step-next s82 s83) (step-next s83 s84) (step-next s84 s85) (step-next s85 s86)
    (step-next s86 s87) (step-next s87 s88) (step-next s88 s89) (step-next s89 s90) (step-next s90 s91)
    (step-next s91 s92) (step-next s92 s93) (step-next s93 s94) (step-next s94 s95) (step-next s95 s96)
    (step-next s96 s97) (step-next s97 s98) (step-next s98 s99) (step-next s99 s100) (step-next s100 s101)
    (step-next s101 s102) (step-next s102 s103) (step-next s103 s104) (step-next s104 s105) (step-next s105 s106)
    (step-next s106 s107) (step-next s107 s108) (step-next s108 s109) (step-next s109 s110) (step-next s110 s111)
    (step-next s111 s112) (step-next s112 s113) (step-next s113 s114) (step-next s114 s115) (step-next s115 s116)
    (step-next s116 s117) (step-next s117 s118) (step-next s118 s119) (step-next s119 s120) (step-next s120 s121)
    (step-next s121 s122) (step-next s122 s123) (step-next s123 s124) (step-next s124 s125) (step-next s125 s126)
    (step-next s126 s127)
  )

  (:goal (and
    ; all disks on the right peg
    (on A right) (on B right) (on C right) (on D right) (on E right) (on F right) (on G right)

    ; top of right is smallest disk A, other pegs empty
    (top right A)
    (empty left)
    (empty middle)

    ; terminal step executed to enforce ordered-step sequencing
    (done s127)
  ))