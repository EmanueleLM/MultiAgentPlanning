(define (problem hanoi-4-staged)
  (:domain towers-of-hanoi-staged)

  (:objects
    ;; disks (from smallest to largest)
    diskA diskB diskC diskD - disk

    ;; pegs (left,middle,right)
    pegLeft pegMid pegRight - peg

    ;; stages: stage0 .. stage15 (exactly 15 single-disk moves required for 4 disks)
    stage0 stage1 stage2 stage3 stage4 stage5 stage6 stage7 stage8 stage9 stage10 stage11 stage12 stage13 stage14 stage15 - stage

    ;; single operator token to enforce sequential single-disk moves
    operator1 - operator
  )

  (:init
    ;; operator instance (serializes moves)
    (is-operator operator1)

    ;; initial stacking on pegLeft: top->bottom diskA,diskB,diskC,diskD on pegLeft
    (on diskA diskB)
    (on diskB diskC)
    (on diskC diskD)
    (on diskD pegLeft)

    ;; supports that are clear initially: topmost disk and empty pegs
    (clear diskA)
    (clear pegMid)
    (clear pegRight)

    ;; strict size ordering facts
    (smaller diskA diskB)
    (smaller diskA diskC)
    (smaller diskA diskD)
    (smaller diskB diskC)
    (smaller diskB diskD)
    (smaller diskC diskD)

    ;; linear successor relation between consecutive stages (enforces contiguous single-step progression)
    (next stage0 stage1) (next stage1 stage2) (next stage2 stage3) (next stage3 stage4)
    (next stage4 stage5) (next stage5 stage6) (next stage6 stage7) (next stage7 stage8)
    (next stage8 stage9) (next stage9 stage10) (next stage10 stage11) (next stage11 stage12)
    (next stage12 stage13) (next stage13 stage14) (next stage14 stage15)

    ;; start at stage0
    (current stage0)
  )

  (:goal
    (and
      ;; all disks on pegRight in same stacking order (diskD bottom)
      (on diskD pegRight)
      (on diskC diskD)
      (on diskB diskC)
      (on diskA diskB)

      ;; topmost disk clear
      (clear diskA)

      ;; other pegs empty in the final state
      (clear pegLeft)
      (clear pegMid)

      ;; final stage must be reached (enforces exactly 15 sequential single-disk moves)
      (current stage15)
    )
  )
)