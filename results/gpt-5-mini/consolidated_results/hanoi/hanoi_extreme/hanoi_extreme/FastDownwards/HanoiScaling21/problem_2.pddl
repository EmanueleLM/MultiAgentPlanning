(define (problem hanoi-7)
  (:domain hanoi)
  (:objects
    a b c d e f g - disk
    left middle right - peg
    stage0 stage1 stage2 stage3 stage4 stage5 stage6 stage7
    stage8 stage9 stage10 stage11 stage12 stage13 stage14 stage15
    stage16 stage17 stage18 stage19 stage20 stage21 stage22 stage23
    stage24 stage25 stage26 stage27 stage28 stage29 stage30 stage31
    stage32 stage33 stage34 stage35 stage36 stage37 stage38 stage39
    stage40 stage41 stage42 stage43 stage44 stage45 stage46 stage47
    stage48 stage49 stage50 stage51 stage52 stage53 stage54 stage55
    stage56 stage57 stage58 stage59 stage60 stage61 stage62 stage63
    stage64 stage65 stage66 stage67 stage68 stage69 stage70 stage71
    stage72 stage73 stage74 stage75 stage76 stage77 stage78 stage79
    stage80 stage81 stage82 stage83 stage84 stage85 stage86 stage87
    stage88 stage89 stage90 stage91 stage92 stage93 stage94 stage95
    stage96 stage97 stage98 stage99 stage100 stage101 stage102 stage103
    stage104 stage105 stage106 stage107 stage108 stage109 stage110 stage111
    stage112 stage113 stage114 stage115 stage116 stage117 stage118 stage119
    stage120 stage121 stage122 stage123 stage124 stage125 stage126 stage127 - stage
  )

  (:init
    ;; initial stack on left: a on b on c on d on e on f on g on left
    (on a b)
    (on b c)
    (on c d)
    (on d e)
    (on e f)
    (on f g)
    (on g left)

    ;; only the topmost disk and empty pegs are clear initially
    (clear a)
    (clear middle)
    (clear right)

    ;; size ordering: a < b < c < d < e < f < g (enumerate all strict pairs)
    (smaller a b) (smaller a c) (smaller a d) (smaller a e) (smaller a f) (smaller a g)
    (smaller b c) (smaller b d) (smaller b e) (smaller b f) (smaller b g)
    (smaller c d) (smaller c e) (smaller c f) (smaller c g)
    (smaller d e) (smaller d f) (smaller d g)
    (smaller e f) (smaller e g)
    (smaller f g)

    ;; explicit stage successor chain to enforce one-move-per-stage and monotonic progression
    (next stage0 stage1)   (next stage1 stage2)   (next stage2 stage3)   (next stage3 stage4)
    (next stage4 stage5)   (next stage5 stage6)   (next stage6 stage7)   (next stage7 stage8)
    (next stage8 stage9)   (next stage9 stage10)  (next stage10 stage11) (next stage11 stage12)
    (next stage12 stage13) (next stage13 stage14) (next stage14 stage15) (next stage15 stage16)
    (next stage16 stage17) (next stage17 stage18) (next stage18 stage19) (next stage19 stage20)
    (next stage20 stage21) (next stage21 stage22) (next stage22 stage23) (next stage23 stage24)
    (next stage24 stage25) (next stage25 stage26) (next stage26 stage27) (next stage27 stage28)
    (next stage28 stage29) (next stage29 stage30) (next stage30 stage31) (next stage31 stage32)
    (next stage32 stage33) (next stage33 stage34) (next stage34 stage35) (next stage35 stage36)
    (next stage36 stage37) (next stage37 stage38) (next stage38 stage39) (next stage39 stage40)
    (next stage40 stage41) (next stage41 stage42) (next stage42 stage43) (next stage43 stage44)
    (next stage44 stage45) (next stage45 stage46) (next stage46 stage47) (next stage47 stage48)
    (next stage48 stage49) (next stage49 stage50) (next stage50 stage51) (next stage51 stage52)
    (next stage52 stage53) (next stage53 stage54) (next stage54 stage55) (next stage55 stage56)
    (next stage56 stage57) (next stage57 stage58) (next stage58 stage59) (next stage59 stage60)
    (next stage60 stage61) (next stage61 stage62) (next stage62 stage63) (next stage63 stage64)
    (next stage64 stage65) (next stage65 stage66) (next stage66 stage67) (next stage67 stage68)
    (next stage68 stage69) (next stage69 stage70) (next stage70 stage71) (next stage71 stage72)
    (next stage72 stage73) (next stage73 stage74) (next stage74 stage75) (next stage75 stage76)
    (next stage76 stage77) (next stage77 stage78) (next stage78 stage79) (next stage79 stage80)
    (next stage80 stage81) (next stage81 stage82) (next stage82 stage83) (next stage83 stage84)
    (next stage84 stage85) (next stage85 stage86) (next stage86 stage87) (next stage87 stage88)
    (next stage88 stage89) (next stage89 stage90) (next stage90 stage91) (next stage91 stage92)
    (next stage92 stage93) (next stage93 stage94) (next stage94 stage95) (next stage95 stage96)
    (next stage96 stage97) (next stage97 stage98) (next stage98 stage99) (next stage99 stage100)
    (next stage100 stage101) (next stage101 stage102) (next stage102 stage103) (next stage103 stage104)
    (next stage104 stage105) (next stage105 stage106) (next stage106 stage107) (next stage107 stage108)
    (next stage108 stage109) (next stage109 stage110) (next stage110 stage111) (next stage111 stage112)
    (next stage112 stage113) (next stage113 stage114) (next stage114 stage115) (next stage115 stage116)
    (next stage116 stage117) (next stage117 stage118) (next stage118 stage119) (next stage119 stage120)
    (next stage120 stage121) (next stage121 stage122) (next stage122 stage123) (next stage123 stage124)
    (next stage124 stage125) (next stage125 stage126) (next stage126 stage127)

    ;; start at stage0
    (current stage0)
  )

  (:goal (and
    ;; all disks stacked on middle in same order a on b on ... on g on middle
    (on a b)
    (on b c)
    (on c d)
    (on d e)
    (on e f)
    (on f g)
    (on g middle)

    ;; enforce terminal condition exactly at the final explicit stage:
    (current stage127)

    ;; left and right pegs empty at termination
    (clear left)
    (clear right)
  ))
)