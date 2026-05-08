(define (problem hanoi7-problem)
  (:domain hanoi7)

  (:objects
    A B C D E F G - disk
    left middle right - peg
    ;; stages 0 .. 127 (2^7 - 1 = 127 moves required)
    stage0 stage1 stage2 stage3 stage4 stage5 stage6 stage7 stage8 stage9 stage10 stage11 stage12 stage13 stage14 stage15 stage16 stage17 stage18 stage19 stage20 stage21 stage22 stage23 stage24 stage25 stage26 stage27 stage28 stage29 stage30 stage31 stage32 stage33 stage34 stage35 stage36 stage37 stage38 stage39 stage40 stage41 stage42 stage43 stage44 stage45 stage46 stage47 stage48 stage49 stage50 stage51 stage52 stage53 stage54 stage55 stage56 stage57 stage58 stage59 stage60 stage61 stage62 stage63 stage64 stage65 stage66 stage67 stage68 stage69 stage70 stage71 stage72 stage73 stage74 stage75 stage76 stage77 stage78 stage79 stage80 stage81 stage82 stage83 stage84 stage85 stage86 stage87 stage88 stage89 stage90 stage91 stage92 stage93 stage94 stage95 stage96 stage97 stage98 stage99 stage100 stage101 stage102 stage103 stage104 stage105 stage106 stage107 stage108 stage109 stage110 stage111 stage112 stage113 stage114 stage115 stage116 stage117 stage118 stage119 stage120 stage121 stage122 stage123 stage124 stage125 stage126 stage127 - stage
  )

  (:init
    ;; initial stack on the right peg: bottom G, then F, E, D, C, B, top A
    (on-peg G right)
    (on F G)
    (on E F)
    (on D E)
    (on C D)
    (on B C)
    (on A B)

    ;; bookkeeping: top disk on the right peg is A; left and middle are empty
    (top A right)
    (empty left)
    (empty middle)

    ;; static size ordering (A < B < C < D < E < F < G)
    (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F) (smaller A G)
    (smaller B C) (smaller B D) (smaller B E) (smaller B F) (smaller B G)
    (smaller C D) (smaller C E) (smaller C F) (smaller C G)
    (smaller D E) (smaller D F) (smaller D G)
    (smaller E F) (smaller E G)
    (smaller F G)

    ;; distinctness facts for pegs
    (diff left middle) (diff left right) (diff middle left) (diff middle right) (diff right left) (diff right middle)

    ;; stage successor chain
    (succ stage0 stage1) (succ stage1 stage2) (succ stage2 stage3) (succ stage3 stage4)
    (succ stage4 stage5) (succ stage5 stage6) (succ stage6 stage7) (succ stage7 stage8)
    (succ stage8 stage9) (succ stage9 stage10) (succ stage10 stage11) (succ stage11 stage12)
    (succ stage12 stage13) (succ stage13 stage14) (succ stage14 stage15) (succ stage15 stage16)
    (succ stage16 stage17) (succ stage17 stage18) (succ stage18 stage19) (succ stage19 stage20)
    (succ stage20 stage21) (succ stage21 stage22) (succ stage22 stage23) (succ stage23 stage24)
    (succ stage24 stage25) (succ stage25 stage26) (succ stage26 stage27) (succ stage27 stage28)
    (succ stage28 stage29) (succ stage29 stage30) (succ stage30 stage31) (succ stage31 stage32)
    (succ stage32 stage33) (succ stage33 stage34) (succ stage34 stage35) (succ stage35 stage36)
    (succ stage36 stage37) (succ stage37 stage38) (succ stage38 stage39) (succ stage39 stage40)
    (succ stage40 stage41) (succ stage41 stage42) (succ stage42 stage43) (succ stage43 stage44)
    (succ stage44 stage45) (succ stage45 stage46) (succ stage46 stage47) (succ stage47 stage48)
    (succ stage48 stage49) (succ stage49 stage50) (succ stage50 stage51) (succ stage51 stage52)
    (succ stage52 stage53) (succ stage53 stage54) (succ stage54 stage55) (succ stage55 stage56)
    (succ stage56 stage57) (succ stage57 stage58) (succ stage58 stage59) (succ stage59 stage60)
    (succ stage60 stage61) (succ stage61 stage62) (succ stage62 stage63) (succ stage63 stage64)
    (succ stage64 stage65) (succ stage65 stage66) (succ stage66 stage67) (succ stage67 stage68)
    (succ stage68 stage69) (succ stage69 stage70) (succ stage70 stage71) (succ stage71 stage72)
    (succ stage72 stage73) (succ stage73 stage74) (succ stage74 stage75) (succ stage75 stage76)
    (succ stage76 stage77) (succ stage77 stage78) (succ stage78 stage79) (succ stage79 stage80)
    (succ stage80 stage81) (succ stage81 stage82) (succ stage82 stage83) (succ stage83 stage84)
    (succ stage84 stage85) (succ stage85 stage86) (succ stage86 stage87) (succ stage87 stage88)
    (succ stage88 stage89) (succ stage89 stage90) (succ stage90 stage91) (succ stage91 stage92)
    (succ stage92 stage93) (succ stage93 stage94) (succ stage94 stage95) (succ stage95 stage96)
    (succ stage96 stage97) (succ stage97 stage98) (succ stage98 stage99) (succ stage99 stage100)
    (succ stage100 stage101) (succ stage101 stage102) (succ stage102 stage103) (succ stage103 stage104)
    (succ stage104 stage105) (succ stage105 stage106) (succ stage106 stage107) (succ stage107 stage108)
    (succ stage108 stage109) (succ stage109 stage110) (succ stage110 stage111) (succ stage111 stage112)
    (succ stage112 stage113) (succ stage113 stage114) (succ stage114 stage115) (succ stage115 stage116)
    (succ stage116 stage117) (succ stage117 stage118) (succ stage118 stage119) (succ stage119 stage120)
    (succ stage120 stage121) (succ stage121 stage122) (succ stage122 stage123) (succ stage123 stage124)
    (succ stage124 stage125) (succ stage125 stage126) (succ stage126 stage127)

    ;; initial current stage
    (current stage0)
  )

  (:goal (and
    ;; full stack on left peg: bottom G ... top A
    (on-peg G left)
    (on F G)
    (on E F)
    (on D E)
    (on C D)
    (on B C)
    (on A B)

    ;; bookkeeping: top A on left; other pegs must be empty
    (top A left)
    (empty middle)
    (empty right)

    ;; require exact stage progression: finish at stage127
    (current stage127)
  ))