(define (problem hanoi-7-problem)
  (:domain hanoi-7)

  (:objects
    A B C D E F G    ; disks, A smallest ... G largest
    left middle right
    step0 step1 step2 step3 step4 step5 step6 step7 step8 step9
    step10 step11 step12 step13 step14 step15 step16 step17 step18 step19
    step20 step21 step22 step23 step24 step25 step26 step27 step28 step29
    step30 step31 step32 step33 step34 step35 step36 step37 step38 step39
    step40 step41 step42 step43 step44 step45 step46 step47 step48 step49
    step50 step51 step52 step53 step54 step55 step56 step57 step58 step59
    step60 step61 step62 step63 step64 step65 step66 step67 step68 step69
    step70 step71 step72 step73 step74 step75 step76 step77 step78 step79
    step80 step81 step82 step83 step84 step85 step86 step87 step88 step89
    step90 step91 step92 step93 step94 step95 step96 step97 step98 step99
    step100 step101 step102 step103 step104 step105 step106 step107 step108 step109
    step110 step111 step112 step113 step114 step115 step116 step117 step118 step119
    step120 step121 step122 step123 step124 step125 step126 step127
  )

  (:init
    ; initial stack on left peg: from top to bottom A, B, C, D, E, F, G
    (on A B)
    (on B C)
    (on C D)
    (on D E)
    (on E F)
    (on F G)
    (on G left)

    ; clear/top facts (only top disk A, and empty pegs middle and right are clear)
    (clear A)
    (clear middle)
    (clear right)

    ; size ordering: larger X Y means X is strictly larger than Y
    ; G largest
    (larger G F)
    (larger G E)
    (larger G D)
    (larger G C)
    (larger G B)
    (larger G A)
    ; F
    (larger F E)
    (larger F D)
    (larger F C)
    (larger F B)
    (larger F A)
    ; E
    (larger E D)
    (larger E C)
    (larger E B)
    (larger E A)
    ; D
    (larger D C)
    (larger D B)
    (larger D A)
    ; C
    (larger C B)
    (larger C A)
    ; B
    (larger B A)

    ; successor chain enforcing discrete ordered stages (127 moves)
    (succ step0 step1) (succ step1 step2) (succ step2 step3) (succ step3 step4)
    (succ step4 step5) (succ step5 step6) (succ step6 step7) (succ step7 step8)
    (succ step8 step9) (succ step9 step10) (succ step10 step11) (succ step11 step12)
    (succ step12 step13) (succ step13 step14) (succ step14 step15) (succ step15 step16)
    (succ step16 step17) (succ step17 step18) (succ step18 step19) (succ step19 step20)
    (succ step20 step21) (succ step21 step22) (succ step22 step23) (succ step23 step24)
    (succ step24 step25) (succ step25 step26) (succ step26 step27) (succ step27 step28)
    (succ step28 step29) (succ step29 step30) (succ step30 step31) (succ step31 step32)
    (succ step32 step33) (succ step33 step34) (succ step34 step35) (succ step35 step36)
    (succ step36 step37) (succ step37 step38) (succ step38 step39) (succ step39 step40)
    (succ step40 step41) (succ step41 step42) (succ step42 step43) (succ step43 step44)
    (succ step44 step45) (succ step45 step46) (succ step46 step47) (succ step47 step48)
    (succ step48 step49) (succ step49 step50) (succ step50 step51) (succ step51 step52)
    (succ step52 step53) (succ step53 step54) (succ step54 step55) (succ step55 step56)
    (succ step56 step57) (succ step57 step58) (succ step58 step59) (succ step59 step60)
    (succ step60 step61) (succ step61 step62) (succ step62 step63) (succ step63 step64)
    (succ step64 step65) (succ step65 step66) (succ step66 step67) (succ step67 step68)
    (succ step68 step69) (succ step69 step70) (succ step70 step71) (succ step71 step72)
    (succ step72 step73) (succ step73 step74) (succ step74 step75) (succ step75 step76)
    (succ step76 step77) (succ step77 step78) (succ step78 step79) (succ step79 step80)
    (succ step80 step81) (succ step81 step82) (succ step82 step83) (succ step83 step84)
    (succ step84 step85) (succ step85 step86) (succ step86 step87) (succ step87 step88)
    (succ step88 step89) (succ step89 step90) (succ step90 step91) (succ step91 step92)
    (succ step92 step93) (succ step93 step94) (succ step94 step95) (succ step95 step96)
    (succ step96 step97) (succ step97 step98) (succ step98 step99) (succ step99 step100)
    (succ step100 step101) (succ step101 step102) (succ step102 step103) (succ step103 step104)
    (succ step104 step105) (succ step105 step106) (succ step106 step107) (succ step107 step108)
    (succ step108 step109) (succ step109 step110) (succ step110 step111) (succ step111 step112)
    (succ step112 step113) (succ step113 step114) (succ step114 step115) (succ step115 step116)
    (succ step116 step117) (succ step117 step118) (succ step118 step119) (succ step119 step120)
    (succ step120 step121) (succ step121 step122) (succ step122 step123) (succ step123 step124)
    (succ step124 step125) (succ step125 step126) (succ step126 step127)

    ; initial current stage
    (current step0)
  )

  (:goal (and
    ; goal: entire stack replicated on middle peg in same order A..G (A top)
    (on A B)
    (on B C)
    (on C D)
    (on D E)
    (on E F)
    (on F G)
    (on G middle)

    ; left and right pegs must be empty (top clear)
    (clear left)
    (clear right)

    ; require that the final configuration is reached at the terminal step
    (current step127)
  ))
)