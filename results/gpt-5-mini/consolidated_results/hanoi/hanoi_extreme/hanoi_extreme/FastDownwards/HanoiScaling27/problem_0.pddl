(define (problem hanoi7-instance)
  (:domain hanoi_multiagent)
  (:objects
    A B C D E F G - disk
    left middle right - peg
    ;; steps
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
    ;; initial stack on right peg: G bottom ... A top
    (on G right)
    (on F G)
    (on E F)
    (on D E)
    (on C D)
    (on B C)
    (on A B)

    ;; clear facts: top disk and empty pegs
    (clear A)
    (clear left)
    (clear middle)

    ;; initial enabled step
    (enabled step1)

    ;; step mapping (step-from, step-to) per provided sequence
    ;; 1..10
    (step-from step1 right)  (step-to step1 left)
    (step-from step2 right)  (step-to step2 middle)
    (step-from step3 left)   (step-to step3 middle)
    (step-from step4 right)  (step-to step4 left)
    (step-from step5 middle) (step-to step5 right)
    (step-from step6 middle) (step-to step6 left)
    (step-from step7 right)  (step-to step7 left)
    (step-from step8 right)  (step-to step8 middle)
    (step-from step9 left)   (step-to step9 middle)
    (step-from step10 left)  (step-to step10 right)

    ;; 11..20
    (step-from step11 middle) (step-to step11 right)
    (step-from step12 left)   (step-to step12 middle)
    (step-from step13 right)  (step-to step13 left)
    (step-from step14 right)  (step-to step14 middle)
    (step-from step15 left)   (step-to step15 middle)
    (step-from step16 right)  (step-to step16 left)
    (step-from step17 middle) (step-to step17 right)
    (step-from step18 middle) (step-to step18 left)
    (step-from step19 right)  (step-to step19 left)
    (step-from step20 middle) (step-to step20 right)

    ;; 21..30
    (step-from step21 left)   (step-to step21 middle)
    (step-from step22 left)   (step-to step22 right)
    (step-from step23 middle) (step-to step23 right)
    (step-from step24 middle) (step-to step24 left)
    (step-from step25 right)  (step-to step25 left)
    (step-from step26 right)  (step-to step26 middle)
    (step-from step27 left)   (step-to step27 middle)
    (step-from step28 right)  (step-to step28 left)
    (step-from step29 middle) (step-to step29 right)
    (step-from step30 middle) (step-to step30 left)

    ;; 31..40
    (step-from step31 right)  (step-to step31 left)
    (step-from step32 right)  (step-to step32 middle)
    (step-from step33 left)   (step-to step33 middle)
    (step-from step34 left)   (step-to step34 right)
    (step-from step35 middle) (step-to step35 right)
    (step-from step36 left)   (step-to step36 middle)
    (step-from step37 right)  (step-to step37 left)
    (step-from step38 right)  (step-to step38 middle)
    (step-from step39 left)   (step-to step39 middle)
    (step-from step40 left)   (step-to step40 right)

    ;; 41..50
    (step-from step41 middle) (step-to step41 right)
    (step-from step42 middle) (step-to step42 left)
    (step-from step43 right)  (step-to step43 left)
    (step-from step44 middle) (step-to step44 right)
    (step-from step45 left)   (step-to step45 middle)
    (step-from step46 left)   (step-to step46 right)
    (step-from step47 middle) (step-to step47 right)
    (step-from step48 left)   (step-to step48 middle)
    (step-from step49 right)  (step-to step49 left)
    (step-from step50 right)  (step-to step50 middle)

    ;; 51..60
    (step-from step51 left)   (step-to step51 middle)
    (step-from step52 right)  (step-to step52 left)
    (step-from step53 middle) (step-to step53 right)
    (step-from step54 middle) (step-to step54 left)
    (step-from step55 right)  (step-to step55 left)
    (step-from step56 right)  (step-to step56 middle)
    (step-from step57 left)   (step-to step57 middle)
    (step-from step58 left)   (step-to step58 right)
    (step-from step59 middle) (step-to step59 right)
    (step-from step60 left)   (step-to step60 middle)

    ;; 61..70
    (step-from step61 right)  (step-to step61 left)
    (step-from step62 right)  (step-to step62 middle)
    (step-from step63 left)   (step-to step63 middle)
    (step-from step64 right)  (step-to step64 left)
    (step-from step65 middle) (step-to step65 right)
    (step-from step66 middle) (step-to step66 left)
    (step-from step67 right)  (step-to step67 left)
    (step-from step68 middle) (step-to step68 right)
    (step-from step69 left)   (step-to step69 middle)
    (step-from step70 left)   (step-to step70 right)

    ;; 71..80
    (step-from step71 middle) (step-to step71 right)
    (step-from step72 middle) (step-to step72 left)
    (step-from step73 right)  (step-to step73 left)
    (step-from step74 right)  (step-to step74 middle)
    (step-from step75 left)   (step-to step75 middle)
    (step-from step76 right)  (step-to step76 left)
    (step-from step77 middle) (step-to step77 right)
    (step-from step78 middle) (step-to step78 left)
    (step-from step79 right)  (step-to step79 left)
    (step-from step80 middle) (step-to step80 right)

    ;; 81..90
    (step-from step81 left)   (step-to step81 middle)
    (step-from step82 left)   (step-to step82 right)
    (step-from step83 middle) (step-to step83 right)
    (step-from step84 left)   (step-to step84 middle)
    (step-from step85 right)  (step-to step85 left)
    (step-from step86 right)  (step-to step86 middle)
    (step-from step87 left)   (step-to step87 middle)
    (step-from step88 left)   (step-to step88 right)
    (step-from step89 middle) (step-to step89 right)
    (step-from step90 middle) (step-to step90 left)

    ;; 91..100
    (step-from step91 right)  (step-to step91 left)
    (step-from step92 middle) (step-to step92 right)
    (step-from step93 left)   (step-to step93 middle)
    (step-from step94 left)   (step-to step94 right)
    (step-from step95 middle) (step-to step95 right)
    (step-from step96 middle) (step-to step96 left)
    (step-from step97 right)  (step-to step97 left)
    (step-from step98 right)  (step-to step98 middle)
    (step-from step99 left)   (step-to step99 middle)
    (step-from step100 right) (step-to step100 left)

    ;; 101..110
    (step-from step101 middle) (step-to step101 right)
    (step-from step102 middle) (step-to step102 left)
    (step-from step103 right)  (step-to step103 left)
    (step-from step104 right)  (step-to step104 middle)
    (step-from step105 left)   (step-to step105 middle)
    (step-from step106 left)   (step-to step106 right)
    (step-from step107 middle) (step-to step107 right)
    (step-from step108 left)   (step-to step108 middle)
    (step-from step109 right)  (step-to step109 left)
    (step-from step110 right)  (step-to step110 middle)

    ;; 111..120
    (step-from step111 left)   (step-to step111 middle)
    (step-from step112 right)  (step-to step112 left)
    (step-from step113 middle) (step-to step113 right)
    (step-from step114 middle) (step-to step114 left)
    (step-from step115 right)  (step-to step115 left)
    (step-from step116 middle) (step-to step116 right)
    (step-from step117 left)   (step-to step117 middle)
    (step-from step118 left)   (step-to step118 right)
    (step-from step119 middle) (step-to step119 right)
    (step-from step120 middle) (step-to step120 left)

    ;; 121..127
    (step-from step121 right)  (step-to step121 left)
    (step-from step122 right)  (step-to step122 middle)
    (step-from step123 left)   (step-to step123 middle)
    (step-from step124 right)  (step-to step124 left)
    (step-from step125 middle) (step-to step125 right)
    (step-from step126 middle) (step-to step126 left)
    (step-from step127 right)  (step-to step127 left)

    ;; step sequencing
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

    ;; size relations (larger) -- complete ordering relations
    ;; G larger than F,E,D,C,B,A
    (larger G F) (larger G E) (larger G D) (larger G C) (larger G B) (larger G A)
    ;; F larger than E,D,C,B,A
    (larger F E) (larger F D) (larger F C) (larger F B) (larger F A)
    ;; E larger than D,C,B,A
    (larger E D) (larger E C) (larger E B) (larger E A)
    ;; D larger than C,B,A
    (larger D C) (larger D B) (larger D A)
    ;; C larger than B,A
    (larger C B) (larger C A)
    ;; B larger than A
    (larger B A)
  )

  (:goal
    (and
      ;; final stack on left: G bottom then F,E,D,C,B,A above
      (on G left)
      (on F G)
      (on E F)
      (on D E)
      (on C D)
      (on B C)
      (on A B)
      ;; ensure middle and right pegs are empty (implicitly satisfied if all disks on left,
      ;; but make it explicit by requiring no disk directly on those pegs)
      ;; We assert that no disk is directly on middle or right by enumerating negatives:
      (not (on A middle)) (not (on B middle)) (not (on C middle)) (not (on D middle)) (not (on E middle)) (not (on F middle)) (not (on G middle))
      (not (on A right))  (not (on B right))  (not (on C right))  (not (on D right))  (not (on E right))  (not (on F right))  (not (on G right))
      ;; optionally ensure left is not clear (because stack occupies it), and top A is clear
      (clear A)
    )
  )
)