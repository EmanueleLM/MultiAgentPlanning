(define (problem hanoi-4-disks)
  (:domain hanoi-mover-4)

  (:objects
    diska diskb diskc diskd - disk
    left middle right - peg
    ;; stages: 16 stage objects to allow exactly 15 sequential moves (stage0 -> ... -> stage15)
    stage0 stage1 stage2 stage3 stage4 stage5 stage6 stage7
    stage8 stage9 stage10 stage11 stage12 stage13 stage14 stage15 - stage
  )

  (:init
    ;; initial stack on right peg: top->bottom diska on diskb, diskb on diskc, diskc on diskd, diskd on right
    (on-disk diska diskb)
    (on-disk diskb diskc)
    (on-disk diskc diskd)
    (on-peg diskd right)

    ;; top/clear facts initially: only top disk diska is clear; left and middle pegs are empty
    (clear-disk diska)
    (clear-peg left)
    (clear-peg middle)

    ;; static size ordering (diska < diskb < diskc < diskd)
    (smaller diska diskb)
    (smaller diska diskc)
    (smaller diska diskd)
    (smaller diskb diskc)
    (smaller diskb diskd)
    (smaller diskc diskd)

    ;; explicit stage successor relations for 15 moves
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

    ;; final stack on left: top->bottom diska on diskb, diskb on diskc, diskc on diskd, diskd on left
    (on-disk diska diskb)
    (on-disk diskb diskc)
    (on-disk diskc diskd)
    (on-peg diskd left)

    ;; middle and right pegs must be empty at the end
    (clear-peg middle)
    (clear-peg right)
  ))