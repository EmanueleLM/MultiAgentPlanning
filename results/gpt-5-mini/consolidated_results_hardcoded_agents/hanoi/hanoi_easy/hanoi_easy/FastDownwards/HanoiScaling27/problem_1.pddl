(define (problem hanoi-4-disks)
  (:domain hanoi-mover-4)

  (:objects
    ;; disks (A = smallest, D = largest)
    diskA diskB diskC diskD - disk
    ;; pegs
    left middle right - peg
    ;; discrete stages: for 4 disks minimal moves = 2^4 - 1 = 15, stages 0..15
    stage0 stage1 stage2 stage3 stage4 stage5 stage6 stage7
    stage8 stage9 stage10 stage11 stage12 stage13 stage14 stage15 - stage
  )

  (:init
    ;; initial stack on right peg: top->bottom A on B, B on C, C on D, D on right
    (on diskA diskB)
    (on diskB diskC)
    (on diskC diskD)
    (on diskD right)

    ;; clear/top facts initially: only top disk (diskA) is clear; empty pegs are clear
    (clear diskA)
    (clear left)
    (clear middle)
    ;; right peg is not clear (has disks) -- do not assert (clear right)
    ;; diskB, diskC, diskD are not clear -- do not assert their clear facts

    ;; static size ordering (A < B < C < D)
    (smaller diskA diskB)
    (smaller diskA diskC)
    (smaller diskA diskD)
    (smaller diskB diskC)
    (smaller diskB diskD)
    (smaller diskC diskD)

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

    ;; initial current stage
    (now stage0)
  )

  (:goal (and
    ;; require the exact goal configuration to hold only at final stage
    (now stage15)
    ;; final stack on left peg: top->bottom A on B, B on C, C on D, D on left
    (on diskA diskB)
    (on diskB diskC)
    (on diskC diskD)
    (on diskD left)
    ;; intermediate pegs must be empty at the end
    (clear middle)
    (clear right)
  ))
)