(define (problem hanoi-4-disks)
  (:domain hanoi-mover-4)

  (:objects
    ;; disks (diska = smallest, diskd = largest)
    diska diskb diskc diskd - disk
    ;; pegs
    left middle right - peg
    ;; discrete stages: 0..15 (minimal moves for 4 disks = 15)
    stage0 stage1 stage2 stage3 stage4 stage5 stage6 stage7
    stage8 stage9 stage10 stage11 stage12 stage13 stage14 stage15 - stage
  )

  (:init
    ;; initial stack on right peg: top->bottom diska on diskb, diskb on diskc, diskc on diskd, diskd on right
    (on diska diskb)
    (on diskb diskc)
    (on diskc diskd)
    (on diskd right)

    ;; clear/top facts initially: only top disk (diska) and empty pegs are clear
    (clear diska)
    (clear left)
    (clear middle)
    ;; note: right is not clear (has disks); diskb, diskc, diskd are not clear (not asserted)

    ;; static size ordering (diska < diskb < diskc < diskd)
    (smaller diska diskb)
    (smaller diska diskc)
    (smaller diska diskd)
    (smaller diskb diskc)
    (smaller diskb diskd)
    (smaller diskc diskd)

    ;; stage successor relations (explicit ordered stages)
    (succ stage0 stage1)
    (succ stage1 stage2)
    (succ stage2 stage3)
    (succ stage3 stage4)
    (succ stage4 stage5)
    (succ stage5 stage6)
    (succ stage6 stage7)
    (succ stage7 stage8)
    (succ stage8 stage9)
    (succ stage9 stage10)
    (succ stage10 stage11)
    (succ stage11 stage12)
    (succ stage12 stage13)
    (succ stage13 stage14)
    (succ stage14 stage15)

    ;; initial current stage marker
    (now stage0)
  )

  (:goal (and
    ;; require the exact goal configuration to hold at final stage
    (now stage15)
    ;; final stack on left peg: top->bottom diska on diskb, diskb on diskc, diskc on diskd, diskd on left
    (on diska diskb)
    (on diskb diskc)
    (on diskc diskd)
    (on diskd left)
    ;; intermediate pegs must be empty at the end
    (clear middle)
    (clear right)
  ))
)