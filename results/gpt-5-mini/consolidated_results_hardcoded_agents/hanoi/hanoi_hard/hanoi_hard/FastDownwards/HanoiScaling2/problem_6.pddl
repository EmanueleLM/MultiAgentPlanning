(define (problem hanoi-6disk-steps-problem)
  (:domain hanoi-6disk-steps)

  (:objects
    pega pegb pegc - peg
    diska diskb diskc diskd diske diskf - disk
    ;; steps 0..63: exactly 64 distinct stages to enforce contiguous single-action progression.
    step0 step1 step2 step3 step4 step5 step6 step7 step8 step9
    step10 step11 step12 step13 step14 step15 step16 step17 step18 step19
    step20 step21 step22 step23 step24 step25 step26 step27 step28 step29
    step30 step31 step32 step33 step34 step35 step36 step37 step38 step39
    step40 step41 step42 step43 step44 step45 step46 step47 step48 step49
    step50 step51 step52 step53 step54 step55 step56 step57 step58 step59
    step60 step61 step62 step63 - step
  )

  (:init
    ;; Initial stacking on pega: from bottom to top: diskf (bottom), diske, diskd, diskc, diskb, diska (top)
    (on-peg diskf pega)
    (on-disk diske diskf)
    (on-disk diskd diske)
    (on-disk diskc diskd)
    (on-disk diskb diskc)
    (on-disk diska diskb)

    ;; only the topmost disk is marked top initially
    (top diska)

    ;; peg occupancy: pega has disks (no (empty pega) fact), pegb and pegc are empty
    (empty pegb)
    (empty pegc)

    ;; size ordering: diska < diskb < diskc < diskd < diske < diskf
    (smaller diska diskb) (smaller diska diskc) (smaller diska diskd) (smaller diska diske) (smaller diska diskf)
    (smaller diskb diskc) (smaller diskb diskd) (smaller diskb diske) (smaller diskb diskf)
    (smaller diskc diskd) (smaller diskc diske) (smaller diskc diskf)
    (smaller diskd diske) (smaller diskd diskf)
    (smaller diske diskf)

    ;; discrete step successor chain from step0 to step63 (63 moves allowed; final required is step63)
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

    ;; initial current step
    (current step0)
  )

  (:goal (and
    ;; final stack on pegc: from bottom to top: diskf (bottom), diske, diskd, diskc, diskb, diska (top)
    (on-peg diskf pegc)
    (on-disk diske diskf)
    (on-disk diskd diske)
    (on-disk diskc diskd)
    (on-disk diskb diskc)
    (on-disk diska diskb)

    ;; pegs pega and pegb must be empty at the end
    (empty pega)
    (empty pegb)

    ;; final required stage reached exactly (after 63 moves)
    (current step63)
  ))