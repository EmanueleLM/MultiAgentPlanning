(define (problem hanoi7)
  (:domain hanoi)
  (:objects
    a b c d e f g - disk
    left middle right - peg
    lvl0 lvl1 lvl2 lvl3 lvl4 lvl5 lvl6 lvl7 - level
    step1 step2 step3 step4 step5 step6 step7 step8 step9 step10
    step11 step12 step13 step14 step15 step16 step17 step18 step19 step20
    step21 step22 step23 step24 step25 step26 step27 step28 step29 step30
    step31 step32 step33 step34 step35 step36 step37 step38 step39 step40
    step41 step42 step43 step44 step45 step46 step47 step48 step49 step50
    step51 step52 step53 step54 step55 step56 step57 step58 step59 step60
    step61 step62 step63 step64 step65 step66 step67 step68 step69 step70
    step71 step72 step73 step74 step75 step76 step77 step78 step79 step80
    step81 step82 step83 step84 step85 step86 step87 step88 step89 step90
    step91 step92 step93 step94 step95 step96 step97 step98 step99 step100
    step101 step102 step103 step104 step105 step106 step107 step108 step109 step110
    step111 step112 step113 step114 step115 step116 step117 step118 step119 step120
    step121 step122 step123 step124 step125 step126 step127 - step
  )

  (:init
    ;; levels successor chain
    (succ lvl0 lvl1) (succ lvl1 lvl2) (succ lvl2 lvl3) (succ lvl3 lvl4)
    (succ lvl4 lvl5) (succ lvl5 lvl6) (succ lvl6 lvl7)

    ;; initial disk positions on right peg: bottom g at lvl1 ... top a at lvl7
    (at a right lvl7)
    (at b right lvl6)
    (at c right lvl5)
    (at d right lvl4)
    (at e right lvl3)
    (at f right lvl2)
    (at g right lvl1)

    ;; peg heights initially
    (height right lvl7)
    (height left lvl0)
    (height middle lvl0)

    ;; step sequencing: enable first step and chain all steps
    (enabled step1)
    (step-next step1 step2)   (step-next step2 step3)   (step-next step3 step4)   (step-next step4 step5)
    (step-next step5 step6)   (step-next step6 step7)   (step-next step7 step8)   (step-next step8 step9)
    (step-next step9 step10)  (step-next step10 step11) (step-next step11 step12) (step-next step12 step13)
    (step-next step13 step14) (step-next step14 step15) (step-next step15 step16) (step-next step16 step17)
    (step-next step17 step18) (step-next step18 step19) (step-next step19 step20) (step-next step20 step21)
    (step-next step21 step22) (step-next step22 step23) (step-next step23 step24) (step-next step24 step25)
    (step-next step25 step26) (step-next step26 step27) (step-next step27 step28) (step-next step28 step29)
    (step-next step29 step30) (step-next step30 step31) (step-next step31 step32) (step-next step32 step33)
    (step-next step33 step34) (step-next step34 step35) (step-next step35 step36) (step-next step36 step37)
    (step-next step37 step38) (step-next step38 step39) (step-next step39 step40) (step-next step40 step41)
    (step-next step41 step42) (step-next step42 step43) (step-next step43 step44) (step-next step44 step45)
    (step-next step45 step46) (step-next step46 step47) (step-next step47 step48) (step-next step48 step49)
    (step-next step49 step50) (step-next step50 step51) (step-next step51 step52) (step-next step52 step53)
    (step-next step53 step54) (step-next step54 step55) (step-next step55 step56) (step-next step56 step57)
    (step-next step57 step58) (step-next step58 step59) (step-next step59 step60) (step-next step60 step61)
    (step-next step61 step62) (step-next step62 step63) (step-next step63 step64) (step-next step64 step65)
    (step-next step65 step66) (step-next step66 step67) (step-next step67 step68) (step-next step68 step69)
    (step-next step69 step70) (step-next step70 step71) (step-next step71 step72) (step-next step72 step73)
    (step-next step73 step74) (step-next step74 step75) (step-next step75 step76) (step-next step76 step77)
    (step-next step77 step78) (step-next step78 step79) (step-next step79 step80) (step-next step80 step81)
    (step-next step81 step82) (step-next step82 step83) (step-next step83 step84) (step-next step84 step85)
    (step-next step85 step86) (step-next step86 step87) (step-next step87 step88) (step-next step88 step89)
    (step-next step89 step90) (step-next step90 step91) (step-next step91 step92) (step-next step92 step93)
    (step-next step93 step94) (step-next step94 step95) (step-next step95 step96) (step-next step96 step97)
    (step-next step97 step98) (step-next step98 step99) (step-next step99 step100) (step-next step100 step101)
    (step-next step101 step102) (step-next step102 step103) (step-next step103 step104) (step-next step104 step105)
    (step-next step105 step106) (step-next step106 step107) (step-next step107 step108) (step-next step108 step109)
    (step-next step109 step110) (step-next step110 step111) (step-next step111 step112) (step-next step112 step113)
    (step-next step113 step114) (step-next step114 step115) (step-next step115 step116) (step-next step116 step117)
    (step-next step117 step118) (step-next step118 step119) (step-next step119 step120) (step-next step120 step121)
    (step-next step121 step122) (step-next step122 step123) (step-next step123 step124) (step-next step124 step125)
    (step-next step125 step126) (step-next step126 step127)

    ;; final step marker
    (last-step step127)

    ;; size relations
    (larger g f) (larger g e) (larger g d) (larger g c) (larger g b) (larger g a)
    (larger f e) (larger f d) (larger f c) (larger f b) (larger f a)
    (larger e d) (larger e c) (larger e b) (larger e a)
    (larger d c) (larger d b) (larger d a)
    (larger c b) (larger c a)
    (larger b a)
  )

  (:goal
    (and
      ;; all disks on left peg with same level ordering: a top at lvl7 down to g at lvl1
      (at a left lvl7)
      (at b left lvl6)
      (at c left lvl5)
      (at d left lvl4)
      (at e left lvl3)
      (at f left lvl2)
      (at g left lvl1)
      ;; ensure left peg height is lvl7 and other pegs empty
      (height left lvl7)
      (height middle lvl0)
      (height right lvl0)
    )
  )
)