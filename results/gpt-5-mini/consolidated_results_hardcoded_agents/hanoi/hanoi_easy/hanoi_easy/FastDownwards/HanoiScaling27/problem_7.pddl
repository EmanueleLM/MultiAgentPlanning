(define (problem hanoi-4-disks)
  (:domain hanoi-mover-4)

  (:objects
    diska diskb diskc diskd - disk
    left middle right - peg
    stage0 stage1 stage2 stage3 stage4 stage5 stage6 stage7
    stage8 stage9 stage10 stage11 stage12 stage13 stage14 stage15 - stage
  )

  (:init
    (on-disk diska diskb)
    (on-disk diskb diskc)
    (on-disk diskc diskd)
    (on-peg diskd right)

    (clear-disk diska)
    (clear-peg left)
    (clear-peg middle)

    (smaller diska diskb)
    (smaller diska diskc)
    (smaller diska diskd)
    (smaller diskb diskc)
    (smaller diskb diskd)
    (smaller diskc diskd)

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

    (current-stage stage0)
  )

  (:goal (and
    (current-stage stage15)

    (on-disk diska diskb)
    (on-disk diskb diskc)
    (on-disk diskc diskd)
    (on-peg diskd left)

    (clear-peg middle)
    (clear-peg right)
  ))
)