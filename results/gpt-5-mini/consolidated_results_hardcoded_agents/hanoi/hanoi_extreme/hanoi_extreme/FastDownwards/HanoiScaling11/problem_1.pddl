(define (problem hanoi7-problem)
  (:domain hanoi7)
  (:objects
    diskA diskB diskC diskD diskE diskF diskG - disk
    left mid right - peg
    T0 T1 T2 T3 T4 T5 T6 T7 T8 T9 T10 T11 T12 T13 T14 T15 T16 T17 T18 T19 T20 T21 T22 T23 T24 T25 T26 T27 T28 T29 T30 T31
    T32 T33 T34 T35 T36 T37 T38 T39 T40 T41 T42 T43 T44 T45 T46 T47 T48 T49 T50 T51 T52 T53 T54 T55 T56 T57 T58 T59 T60 T61 T62 T63
    T64 T65 T66 T67 T68 T69 T70 T71 T72 T73 T74 T75 T76 T77 T78 T79 T80 T81 T82 T83 T84 T85 T86 T87 T88 T89 T90 T91 T92 T93 T94 T95 T96 T97
    T98 T99 T100 T101 T102 T103 T104 T105 T106 T107 T108 T109 T110 T111 T112 T113 T114 T115 T116 T117 T118 T119 T120 T121 T122 T123 T124 T125 T126 T127
    - time
  )
  (:init
    ;; initial stack on peg mid (bottom to top: G F E D C B A)
    (on diskG mid)
    (on diskF diskG)
    (on diskE diskF)
    (on diskD diskE)
    (on diskC diskD)
    (on diskB diskC)
    (on diskA diskB)

    ;; clear predicates: only top diskA and empty pegs left and right are clear
    (clear diskA)
    (clear left)
    (clear right)

    ;; size ordering: disk A < B < C < D < E < F < G (disk to disk)
    (smaller diskA diskB) (smaller diskA diskC) (smaller diskA diskD) (smaller diskA diskE) (smaller diskA diskF) (smaller diskA diskG)
    (smaller diskB diskC) (smaller diskB diskD) (smaller diskB diskE) (smaller diskB diskF) (smaller diskB diskG)
    (smaller diskC diskD) (smaller diskC diskE) (smaller diskC diskF) (smaller diskC diskG)
    (smaller diskD diskE) (smaller diskD diskF) (smaller diskD diskG)
    (smaller diskE diskF) (smaller diskE diskG)
    (smaller diskF diskG)

    ;; every disk is allowed on every peg (peg treated as larger than any disk)
    (smaller diskA left) (smaller diskA mid) (smaller diskA right)
    (smaller diskB left) (smaller diskB mid) (smaller diskB right)
    (smaller diskC left) (smaller diskC mid) (smaller diskC right)
    (smaller diskD left) (smaller diskD mid) (smaller diskD right)
    (smaller diskE left) (smaller diskE mid) (smaller diskE right)
    (smaller diskF left) (smaller diskF mid) (smaller diskF right)
    (smaller diskG left) (smaller diskG mid) (smaller diskG right)

    ;; explicit successor chain for discrete stages T0 -> T1 -> ... -> T127
    (succ T0 T1) (succ T1 T2) (succ T2 T3) (succ T3 T4) (succ T4 T5) (succ T5 T6) (succ T6 T7) (succ T7 T8) (succ T8 T9) (succ T9 T10)
    (succ T10 T11) (succ T11 T12) (succ T12 T13) (succ T13 T14) (succ T14 T15) (succ T15 T16) (succ T16 T17) (succ T17 T18) (succ T18 T19) (succ T19 T20)
    (succ T20 T21) (succ T21 T22) (succ T22 T23) (succ T23 T24) (succ T24 T25) (succ T25 T26) (succ T26 T27) (succ T27 T28) (succ T28 T29) (succ T29 T30)
    (succ T30 T31) (succ T31 T32) (succ T32 T33) (succ T33 T34) (succ T34 T35) (succ T35 T36) (succ T36 T37) (succ T37 T38) (succ T38 T39) (succ T39 T40)
    (succ T40 T41) (succ T41 T42) (succ T42 T43) (succ T43 T44) (succ T44 T45) (succ T45 T46) (succ T46 T47) (succ T47 T48) (succ T48 T49) (succ T49 T50)
    (succ T50 T51) (succ T51 T52) (succ T52 T53) (succ T53 T54) (succ T54 T55) (succ T55 T56) (succ T56 T57) (succ T57 T58) (succ T58 T59) (succ T59 T60)
    (succ T60 T61) (succ T61 T62) (succ T62 T63) (succ T63 T64) (succ T64 T65) (succ T65 T66) (succ T66 T67) (succ T67 T68) (succ T68 T69) (succ T69 T70)
    (succ T70 T71) (succ T71 T72) (succ T72 T73) (succ T73 T74) (succ T74 T75) (succ T75 T76) (succ T76 T77) (succ T77 T78) (succ T78 T79) (succ T79 T80)
    (succ T80 T81) (succ T81 T82) (succ T82 T83) (succ T83 T84) (succ T84 T85) (succ T85 T86) (succ T86 T87) (succ T87 T88) (succ T88 T89) (succ T89 T90)
    (succ T90 T91) (succ T91 T92) (succ T92 T93) (succ T93 T94) (succ T94 T95) (succ T95 T96) (succ T96 T97) (succ T97 T98) (succ T98 T99) (succ T99 T100)
    (succ T100 T101) (succ T101 T102) (succ T102 T103) (succ T103 T104) (succ T104 T105) (succ T105 T106) (succ T106 T107) (succ T107 T108) (succ T108 T109) (succ T109 T110)
    (succ T110 T111) (succ T111 T112) (succ T112 T113) (succ T113 T114) (succ T114 T115) (succ T115 T116) (succ T116 T117) (succ T117 T118) (succ T118 T119) (succ T119 T120)
    (succ T120 T121) (succ T121 T122) (succ T122 T123) (succ T123 T124) (succ T124 T125) (succ T125 T126) (succ T126 T127)

    ;; start at the initial stage T0
    (current T0)
  )

  (:goal (and
    ;; final stack on right (bottom to top: G F E D C B A)
    (on diskG right)
    (on diskF diskG)
    (on diskE diskF)
    (on diskD diskE)
    (on diskC diskD)
    (on diskB diskC)
    (on diskA diskB)

    ;; ensure the other pegs are empty at the goal
    (clear left)
    (clear mid)

    ;; top disk at goal is clear
    (clear diskA)

    ;; final stage reached exactly (enforces exact number of sequential moves)
    (current T127)
  ))
)