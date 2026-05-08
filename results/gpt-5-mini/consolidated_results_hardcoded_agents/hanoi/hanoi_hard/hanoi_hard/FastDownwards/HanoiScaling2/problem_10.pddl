(define (problem hanoi-6disk-problem)
  (:domain hanoi-6disk)

  (:objects
    pega pegb pegc - peg
    diska diskb diskc diskd diske diskf - disk
    ;; steps: need 2^6 - 1 = 63 moves -> 64 stages (step0 .. step63)
    step0 step1 step2 step3 step4 step5 step6 step7 step8 step9
    step10 step11 step12 step13 step14 step15 step16 step17 step18 step19
    step20 step21 step22 step23 step24 step25 step26 step27 step28 step29
    step30 step31 step32 step33 step34 step35 step36 step37 step38 step39
    step40 step41 step42 step43 step44 step45 step46 step47 step48 step49
    step50 step51 step52 step53 step54 step55 step56 step57 step58 step59
    step60 step61 step62 step63 - step
  )

  (:init
    ;; initial stacking on left peg (pega) from top to bottom: A, B, C, D, E, F
    ;; top-most is diska
    (top diska)

    ;; links: diska on diskb, diskb on diskc, diskc on diskd, diskd on diske, diske on diskf, diskf on peg
    (on-disk diska diskb)
    (on-disk diskb diskc)
    (on-disk diskc diskd)
    (on-disk diskd diske)
    (on-disk diske diskf)
    (on-peg diskf pega)

    ;; membership: all disks are in pega initially
    (in diska pega) (in diskb pega) (in diskc pega) (in diskd pega) (in diske pega) (in diskf pega)

    ;; other pegs empty initially
    (empty pegb)
    (empty pegc)

    ;; size ordering (smaller -> larger)
    (smaller diska diskb) (smaller diska diskc) (smaller diska diskd) (smaller diska diske) (smaller diska diskf)
    (smaller diskb diskc) (smaller diskb diskd) (smaller diskb diske) (smaller diskb diskf)
    (smaller diskc diskd) (smaller diskc diske) (smaller diskc diskf)
    (smaller diskd diske) (smaller diskd diskf)
    (smaller diske diskf)

    ;; temporal next relations (contiguous stages)
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
    (next step60 step61) (next step61 step62) (next step62 step63)

    ;; start stage
    (current step0)

    ;; distinct peg pairs
    (diff pega pegb) (diff pegb pega)
    (diff pega pegc) (diff pegc pega)
    (diff pegb pegc) (diff pegc pegb)
  )

  (:goal (and
    ;; final stacking on right peg (pegc) from top to bottom: A,B,C,D,E,F
    (on-disk diska diskb)
    (on-disk diskb diskc)
    (on-disk diskc diskd)
    (on-disk diskd diske)
    (on-peg diske diskf) ;; incorrect type: fix to reflect base on peg
    ;; Correct final chain: diska on diskb, diskb on diskc, diskc on diskd, diskd on diske, diske on diskf, diskf on pegc
    (on-disk diske diskf)
    (on-peg diskf pegc)

    ;; ensure left and middle pegs are empty
    (empty pega)
    (empty pegb)

    ;; final stage reached
    (current step63)
  )))