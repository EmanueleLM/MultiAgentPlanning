(define (problem hanoi-4-staged)
  (:domain towers-of-hanoi-staged)

  (:objects
    diskA diskB diskC diskD - disk
    pegLeft pegMid pegRight - peg
    stage0 stage1 stage2 stage3 stage4 stage5 stage6 stage7 stage8 stage9 stage10 stage11 stage12 stage13 stage14 stage15 - stage
    operator1 - operator
  )

  (:init
    (is-operator operator1)

    ;; initial stacking (top -> bottom): diskA on diskB on diskC on diskD on pegLeft
    (on diskA diskB)
    (on diskB diskC)
    (on diskC diskD)
    (on diskD pegLeft)

    ;; topmost disk and empty pegs are clear initially
    (clear diskA)
    (clear pegMid)
    (clear pegRight)

    ;; strict size ordering (smaller relations)
    (smaller diskA diskB)
    (smaller diskA diskC)
    (smaller diskA diskD)
    (smaller diskB diskC)
    (smaller diskB diskD)
    (smaller diskC diskD)

    ;; linear stage successor relation for 15 moves (stages 0..15, 15 transitions)
    (next stage0 stage1) (next stage1 stage2) (next stage2 stage3) (next stage3 stage4)
    (next stage4 stage5) (next stage5 stage6) (next stage6 stage7) (next stage7 stage8)
    (next stage8 stage9) (next stage9 stage10) (next stage10 stage11) (next stage11 stage12)
    (next stage12 stage13) (next stage13 stage14) (next stage14 stage15)

    ;; start at stage0
    (current stage0)
  )

  (:goal
    (and
      ;; final stacking on pegRight (top -> bottom): diskA, diskB, diskC, diskD
      (on diskA diskB)
      (on diskB diskC)
      (on diskC diskD)
      (on diskD pegRight)

      ;; topmost disk clear
      (clear diskA)

      ;; left and middle pegs empty in the final state
      (clear pegLeft)
      (clear pegMid)

      ;; final stage reached: exactly 15 single-disk moves progressed
      (current stage15)
    )
  )
)