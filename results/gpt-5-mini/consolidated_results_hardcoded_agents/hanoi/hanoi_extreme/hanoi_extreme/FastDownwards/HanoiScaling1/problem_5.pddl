(define (problem hanoi7-problem)
  (:domain hanoi7)
  (:objects
    A B C D E F G - disk
    left middle right - peg
    st0 st1 st2 st3 st4 st5 st6 st7 st8 st9 st10 st11 st12 st13 st14 st15
    st16 st17 st18 st19 st20 st21 st22 st23 st24 st25 st26 st27 st28 st29 st30 st31
    st32 st33 st34 st35 st36 st37 st38 st39 st40 st41 st42 st43 st44 st45 st46 st47
    st48 st49 st50 st51 st52 st53 st54 st55 st56 st57 st58 st59 st60 st61 st62 st63
    st64 st65 st66 st67 st68 st69 st70 st71 st72 st73 st74 st75 st76 st77 st78 st79
    st80 st81 st82 st83 st84 st85 st86 st87 st88 st89 st90 st91 st92 st93 st94 st95
    st96 st97 st98 st99 st100 st101 st102 st103 st104 st105 st106 st107 st108 st109 st110 st111
    st112 st113 st114 st115 st116 st117 st118 st119 st120 st121 st122 st123 st124 st125 st126 st127 - stage
  )

  (:init
    ; initial stack on right (top to bottom): A B C D E F G
    (on-disk A B)
    (on-disk B C)
    (on-disk C D)
    (on-disk D E)
    (on-disk E F)
    (on-disk F G)
    (on-peg G right)

    ; initial top facts and empty pegs
    (top A right)
    (clear-peg left)
    (clear-peg middle)

    ; size ordering (A < B < C < D < E < F < G)
    (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F) (smaller A G)
    (smaller B C) (smaller B D) (smaller B E) (smaller B F) (smaller B G)
    (smaller C D) (smaller C E) (smaller C F) (smaller C G)
    (smaller D E) (smaller D F) (smaller D G)
    (smaller E F) (smaller E G)
    (smaller F G)

    ; explicitly declare peg distinctness to forbid moves that use same peg as source and destination
    (different left middle) (different left right) (different middle left)
    (different middle right) (different right left) (different right middle)

    ; explicit stage successor chain (st0 .. st127) to enforce sequential single-action progression
    (succ st0 st1) (succ st1 st2) (succ st2 st3) (succ st3 st4) (succ st4 st5) (succ st5 st6) (succ st6 st7) (succ st7 st8)
    (succ st8 st9) (succ st9 st10) (succ st10 st11) (succ st11 st12) (succ st12 st13) (succ st13 st14) (succ st14 st15)
    (succ st15 st16) (succ st16 st17) (succ st17 st18) (succ st18 st19) (succ st19 st20) (succ st20 st21) (succ st21 st22)
    (succ st22 st23) (succ st23 st24) (succ st24 st25) (succ st25 st26) (succ st26 st27) (succ st27 st28) (succ st28 st29)
    (succ st29 st30) (succ st30 st31) (succ st31 st32) (succ st32 st33) (succ st33 st34) (succ st34 st35) (succ st35 st36)
    (succ st36 st37) (succ st37 st38) (succ st38 st39) (succ st39 st40) (succ st40 st41) (succ st41 st42) (succ st42 st43)
    (succ st43 st44) (succ st44 st45) (succ st45 st46) (succ st46 st47) (succ st47 st48) (succ st48 st49) (succ st49 st50)
    (succ st50 st51) (succ st51 st52) (succ st52 st53) (succ st53 st54) (succ st54 st55) (succ st55 st56) (succ st56 st57)
    (succ st57 st58) (succ st58 st59) (succ st59 st60) (succ st60 st61) (succ st61 st62) (succ st62 st63) (succ st63 st64)
    (succ st64 st65) (succ st65 st66) (succ st66 st67) (succ st67 st68) (succ st68 st69) (succ st69 st70) (succ st70 st71)
    (succ st71 st72) (succ st72 st73) (succ st73 st74) (succ st74 st75) (succ st75 st76) (succ st76 st77) (succ st77 st78)
    (succ st78 st79) (succ st79 st80) (succ st80 st81) (succ st81 st82) (succ st82 st83) (succ st83 st84) (succ st84 st85)
    (succ st85 st86) (succ st86 st87) (succ st87 st88) (succ st88 st89) (succ st89 st90) (succ st90 st91) (succ st91 st92)
    (succ st92 st93) (succ st93 st94) (succ st94 st95) (succ st95 st96) (succ st96 st97) (succ st97 st98) (succ st98 st99)
    (succ st99 st100) (succ st100 st101) (succ st101 st102) (succ st102 st103) (succ st103 st104) (succ st104 st105)
    (succ st105 st106) (succ st106 st107) (succ st107 st108) (succ st108 st109) (succ st109 st110) (succ st110 st111)
    (succ st111 st112) (succ st112 st113) (succ st113 st114) (succ st114 st115) (succ st115 st116) (succ st116 st117)
    (succ st117 st118) (succ st118 st119) (succ st119 st120) (succ st120 st121) (succ st121 st122) (succ st122 st123)
    (succ st123 st124) (succ st124 st125) (succ st125 st126) (succ st126 st127)

    ; initial current stage
    (current st0)
  )

  (:goal (and
    ; final ordered stack on left: top A, then B, C, D, E, F, G bottom
    (on-disk A B)
    (on-disk B C)
    (on-disk C D)
    (on-disk D E)
    (on-disk E F)
    (on-disk F G)
    (on-peg G left)
    (top A left)

    ; other pegs must be empty
    (clear-peg middle)
    (clear-peg right)

    ; require that the sequential progression consumed exactly 127 moves
    (current st127)
  ))