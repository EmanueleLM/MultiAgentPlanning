(define (problem hanoi-4-staged)
  (:domain towers-of-hanoi-staged)

  (:objects
    ; disks: disk1 smallest, disk4 largest
    disk1 disk2 disk3 disk4 - disk

    ; pegs
    pega pegb pegc - peg

    ; stages: stage0 .. stage15 (exactly 15 moves required for 4 disks)
    stage0 stage1 stage2 stage3 stage4 stage5 stage6 stage7 stage8 stage9 stage10 stage11 stage12 stage13 stage14 stage15 - stage

    ; single operator token to enforce sequential single-disk moves
    operator1 - operator
  )

  (:init
    ; operator instance
    (is-operator operator1)

    ; initial stacking on pega: disk1 on disk2 on disk3 on disk4 on pega
    (on disk1 disk2)
    (on disk2 disk3)
    (on disk3 disk4)
    (on disk4 pega)

    ; clear supports initially: only the topmost disk and empty pegs are clear
    (clear disk1)
    (clear pegb)
    (clear pegc)

    ; size ordering (smaller relations)
    (smaller disk1 disk2)
    (smaller disk1 disk3)
    (smaller disk1 disk4)
    (smaller disk2 disk3)
    (smaller disk2 disk4)
    (smaller disk3 disk4)

    ; define linear successor relation between stages (enforces contiguous single-step progression)
    (next stage0 stage1) (next stage1 stage2) (next stage2 stage3) (next stage3 stage4)
    (next stage4 stage5) (next stage5 stage6) (next stage6 stage7) (next stage7 stage8)
    (next stage8 stage9) (next stage9 stage10) (next stage10 stage11) (next stage11 stage12)
    (next stage12 stage13) (next stage13 stage14) (next stage14 stage15)

    ; start at stage0
    (current stage0)
  )

  (:goal
    (and
      ; all disks moved to pegc in same stacking order (disk4 bottom)
      (on disk4 pegc)
      (on disk3 disk4)
      (on disk2 disk3)
      (on disk1 disk2)

      ; topmost disk clear
      (clear disk1)

      ; other pegs must be empty in the final state
      (clear pega)
      (clear pegb)

      ; final stage must be reached (enforces exactly 15 moves)
      (current stage15)
    )
  )
)