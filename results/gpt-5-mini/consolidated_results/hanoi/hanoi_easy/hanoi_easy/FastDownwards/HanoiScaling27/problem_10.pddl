(define (problem hanoi-4-disks)
  (:domain hanoi-mover-4)

  (:objects
    diska diskb diskc diskd - disk
    left middle right - peg
    stage0 stage1 stage2 stage3 stage4 stage5 stage6 stage7
    stage8 stage9 stage10 stage11 stage12 stage13 stage14 stage15 - stage
  )

  (:init
    ;; initial stack on right peg: top -> bottom = diska, diskb, diskc, diskd
    (on diska diskb)
    (on diskb diskc)
    (on diskc diskd)
    (on diskd right)

    ;; top-of-stack facts
    (top diska)
    ;; diskb, diskc, diskd are not declared top (absence indicates false)

    ;; peg emptiness
    (empty left)
    (empty middle)
    ;; right is not empty (no (empty right) fact)

    ;; static size ordering (smaller relations)
    (smaller diska diskb)
    (smaller diska diskc)
    (smaller diska diskd)
    (smaller diskb diskc)
    (smaller diskb diskd)
    (smaller diskc diskd)

    ;; explicit contiguous stages; exactly 15 moves allowed (stage0 -> stage15)
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

    ;; start at stage0
    (current-stage stage0)
  )

  (:goal (and
    ;; require the plan to reach the terminal stage after 15 contiguous moves
    (current-stage stage15)

    ;; final stack on left peg: top -> bottom = diska, diskb, diskc, diskd
    (on diska diskb)
    (on diskb diskc)
    (on diskc diskd)
    (on diskd left)

    ;; both other pegs empty in final state
    (empty middle)
    (empty right)
  ))