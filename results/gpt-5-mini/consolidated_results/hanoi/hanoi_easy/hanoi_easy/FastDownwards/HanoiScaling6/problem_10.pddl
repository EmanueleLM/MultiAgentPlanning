(define (problem hanoi-4-staged)
  (:domain towers-of-hanoi-staged)

  (:objects
    diska diskb diskc diskd - disk
    pegleft pegmid pegright - peg
    stage0 stage1 stage2 stage3 stage4 stage5 stage6 stage7 stage8 stage9 stage10 stage11 stage12 stage13 stage14 stage15 - stage
    operator1 - operator
  )

  (:init
    (is-operator operator1)

    ;; initial stacking (top -> bottom): diska on diskb on diskc on diskd on pegleft
    (on diska diskb)
    (on diskb diskc)
    (on diskc diskd)
    (on diskd pegleft)

    ;; initial clear facts: topmost disk and empty pegs
    (clear diska)
    (clear pegmid)
    (clear pegright)

    ;; strict static size ordering (smaller relations)
    (smaller diska diskb)
    (smaller diska diskc)
    (smaller diska diskd)
    (smaller diskb diskc)
    (smaller diskb diskd)
    (smaller diskc diskd)

    ;; linear stage successor relation for exactly 15 single-disk moves (2^4 - 1 = 15)
    (next stage0 stage1) (next stage1 stage2) (next stage2 stage3) (next stage3 stage4)
    (next stage4 stage5) (next stage5 stage6) (next stage6 stage7) (next stage7 stage8)
    (next stage8 stage9) (next stage9 stage10) (next stage10 stage11) (next stage11 stage12)
    (next stage12 stage13) (next stage13 stage14) (next stage14 stage15)

    ;; start at stage0
    (current stage0)
  )

  (:goal
    (and
      ;; final stacking on pegright (top -> bottom): diska, diskb, diskc, diskd
      (on diska diskb)
      (on diskb diskc)
      (on diskc diskd)
      (on diskd pegright)

      ;; topmost disk clear
      (clear diska)

      ;; left and middle pegs must be empty in the final state
      (clear pegleft)
      (clear pegmid)

      ;; final stage reached: exactly 15 contiguous single-disk moves progressed
      (current stage15)
    )
  )
)