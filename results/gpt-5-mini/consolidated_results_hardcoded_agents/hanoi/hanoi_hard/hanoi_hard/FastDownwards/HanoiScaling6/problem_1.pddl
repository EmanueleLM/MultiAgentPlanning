(define (problem hanoi-6-disks-revised)
  (:domain hanoi-multiagent-revised)

  (:objects
    diskA diskB diskC diskD diskE diskF - disk
    left middle right - peg

    ;; explicit stages: stage0 .. stage63 (63 = 2^6 - 1 moves required for 6 disks)
    stage0 stage1 stage2 stage3 stage4 stage5 stage6 stage7 stage8 stage9
    stage10 stage11 stage12 stage13 stage14 stage15 stage16 stage17 stage18 stage19
    stage20 stage21 stage22 stage23 stage24 stage25 stage26 stage27 stage28 stage29
    stage30 stage31 stage32 stage33 stage34 stage35 stage36 stage37 stage38 stage39
    stage40 stage41 stage42 stage43 stage44 stage45 stage46 stage47 stage48 stage49
    stage50 stage51 stage52 stage53 stage54 stage55 stage56 stage57 stage58 stage59
    stage60 stage61 stage62 stage63 - stage
  )

  (:init
    ;; Initial stack on left: top->bottom diskA, diskB, diskC, diskD, diskE, diskF
    (on diskA diskB)
    (on diskB diskC)
    (on diskC diskD)
    (on diskD diskE)
    (on diskE diskF)
    (on diskF left)

    ;; Top-clear facts initially:
    (clear diskA)
    (not (clear diskB))
    (not (clear diskC))
    (not (clear diskD))
    (not (clear diskE))
    (not (clear diskF))

    ;; Peg clear facts initially:
    (not (clear left))
    (clear middle)
    (clear right)

    ;; Stage initialization: start at stage0
    (cur-stage stage0)

    ;; Successor relations for stages (explicit, contiguous progression)
    (next stage0 stage1)
    (next stage1 stage2)
    (next stage2 stage3)
    (next stage3 stage4)
    (next stage4 stage5)
    (next stage5 stage6)
    (next stage6 stage7)
    (next stage7 stage8)
    (next stage8 stage9)
    (next stage9 stage10)
    (next stage10 stage11)
    (next stage11 stage12)
    (next stage12 stage13)
    (next stage13 stage14)
    (next stage14 stage15)
    (next stage15 stage16)
    (next stage16 stage17)
    (next stage17 stage18)
    (next stage18 stage19)
    (next stage19 stage20)
    (next stage20 stage21)
    (next stage21 stage22)
    (next stage22 stage23)
    (next stage23 stage24)
    (next stage24 stage25)
    (next stage25 stage26)
    (next stage26 stage27)
    (next stage27 stage28)
    (next stage28 stage29)
    (next stage29 stage30)
    (next stage30 stage31)
    (next stage31 stage32)
    (next stage32 stage33)
    (next stage33 stage34)
    (next stage34 stage35)
    (next stage35 stage36)
    (next stage36 stage37)
    (next stage37 stage38)
    (next stage38 stage39)
    (next stage39 stage40)
    (next stage40 stage41)
    (next stage41 stage42)
    (next stage42 stage43)
    (next stage43 stage44)
    (next stage44 stage45)
    (next stage45 stage46)
    (next stage46 stage47)
    (next stage47 stage48)
    (next stage48 stage49)
    (next stage49 stage50)
    (next stage50 stage51)
    (next stage51 stage52)
    (next stage52 stage53)
    (next stage53 stage54)
    (next stage54 stage55)
    (next stage55 stage56)
    (next stage56 stage57)
    (next stage57 stage58)
    (next stage58 stage59)
    (next stage59 stage60)
    (next stage60 stage61)
    (next stage61 stage62)
    (next stage62 stage63)

    ;; Static size ordering: diskA < diskB < diskC < diskD < diskE < diskF
    (smaller diskA diskB)
    (smaller diskA diskC)
    (smaller diskA diskD)
    (smaller diskA diskE)
    (smaller diskA diskF)

    (smaller diskB diskC)
    (smaller diskB diskD)
    (smaller diskB diskE)
    (smaller diskB diskF)

    (smaller diskC diskD)
    (smaller diskC diskE)
    (smaller diskC diskF)

    (smaller diskD diskE)
    (smaller diskD diskF)

    (smaller diskE diskF)
  )

  (:goal (and
    ;; final stack on right: bottom diskF on right, then diskE on diskF, ..., diskA on diskB
    (on diskF right)
    (on diskE diskF)
    (on diskD diskE)
    (on diskC diskD)
    (on diskB diskC)
    (on diskA diskB)

    ;; require both left and middle pegs to be empty at the end (explicit)
    (clear left)
    (clear middle)
    (not (clear right))

    ;; top/bottom clear facts consistent with final stack
    (clear diskA)
    (not (clear diskB))
    (not (clear diskC))
    (not (clear diskD))
    (not (clear diskE))
    (not (clear diskF))

    ;; require the exact terminal stage after the required number of moves:
    (cur-stage stage63)
  ))

)