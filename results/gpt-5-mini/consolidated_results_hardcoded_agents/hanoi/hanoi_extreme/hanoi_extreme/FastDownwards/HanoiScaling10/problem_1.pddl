(define (problem hanoi-7-middle-to-right)
  (:domain hanoi)
  (:objects
    p_left p_middle p_right - peg
    d1 d2 d3 d4 d5 d6 d7 - disk
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
    step120 step121 step122 step123 step124 step125 step126 step127 - step
  )

  (:init
    (on d1 d2)
    (on d2 d3)
    (on d3 d4)
    (on d4 d5)
    (on d5 d6)
    (on d6 d7)
    (on d7 p_middle)

    (clear d1)
    (clear p_left)
    (clear p_right)

    (smaller d1 d2) (smaller d1 d3) (smaller d1 d4) (smaller d1 d5) (smaller d1 d6) (smaller d1 d7)
    (smaller d2 d3) (smaller d2 d4) (smaller d2 d5) (smaller d2 d6) (smaller d2 d7)
    (smaller d3 d4) (smaller d3 d5) (smaller d3 d6) (smaller d3 d7)
    (smaller d4 d5) (smaller d4 d6) (smaller d4 d7)
    (smaller d5 d6) (smaller d5 d7)
    (smaller d6 d7)

    (current step0)
    (next step0 step1) (next step1 step2) (next step2 step3) (next step3 step4)
    (next step4 step5) (next step5 step6) (next step6 step7) (next step7 step8)
    (next step8 step9) (next step9 step10) (next step10 step11) (next step11 step12)
    (next step12 step13) (next step13 step14) (next step14 step15) (next step15 step16)
    (next step16 step17) (next step17 step18) (next step18 step19) (next step19 step20)
    (next step20 step21) (next step21 step22) (next step22 step23) (next step23 step24)
    (next step24 step25) (next step25 step26) (next step26 step27) (next step27 step28)
    (next step28 step29) (next step29 step30) (next step30 step31) (next step31 step32)
    (next step32 step33) (next step33 step34) (next step34 step35) (next step35 step36)
    (next step36 step37) (next step37 step38) (next step38 step39) (next step39 step40)
    (next step40 step41) (next step41 step42) (next step42 step43) (next step43 step44)
    (next step44 step45) (next step45 step46) (next step46 step47) (next step47 step48)
    (next step48 step49) (next step49 step50) (next step50 step51) (next step51 step52)
    (next step52 step53) (next step53 step54) (next step54 step55) (next step55 step56)
    (next step56 step57) (next step57 step58) (next step58 step59) (next step59 step60)
    (next step60 step61) (next step61 step62) (next step62 step63) (next step63 step64)
    (next step64 step65) (next step65 step66) (next step66 step67) (next step67 step68)
    (next step68 step69) (next step69 step70) (next step70 step71) (next step71 step72)
    (next step72 step73) (next step73 step74) (next step74 step75) (next step75 step76)
    (next step76 step77) (next step77 step78) (next step78 step79) (next step79 step80)
    (next step80 step81) (next step81 step82) (next step82 step83) (next step83 step84)
    (next step84 step85) (next step85 step86) (next step86 step87) (next step87 step88)
    (next step88 step89) (next step89 step90) (next step90 step91) (next step91 step92)
    (next step92 step93) (next step93 step94) (next step94 step95) (next step95 step96)
    (next step96 step97) (next step97 step98) (next step98 step99) (next step99 step100)
    (next step100 step101) (next step101 step102) (next step102 step103) (next step103 step104)
    (next step104 step105) (next step105 step106) (next step106 step107) (next step107 step108)
    (next step108 step109) (next step109 step110) (next step110 step111) (next step111 step112)
    (next step112 step113) (next step113 step114) (next step114 step115) (next step115 step116)
    (next step116 step117) (next step117 step118) (next step118 step119) (next step119 step120)
    (next step120 step121) (next step121 step122) (next step122 step123) (next step123 step124)
    (next step124 step125) (next step125 step126) (next step126 step127)
  )

  (:goal (and
    (on d1 d2)
    (on d2 d3)
    (on d3 d4)
    (on d4 d5)
    (on d5 d6)
    (on d6 d7)
    (on d7 p_right)

    (clear p_left)
    (clear p_middle)

    (current step127)
  ))
)