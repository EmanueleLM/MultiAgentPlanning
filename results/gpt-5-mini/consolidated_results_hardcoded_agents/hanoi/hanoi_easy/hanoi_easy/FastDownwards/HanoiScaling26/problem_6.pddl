(define (problem hanoi_4_orchestrated)
  (:domain hanoi_orchestrated)

  (:objects
    peg_left peg_middle peg_right - peg
    disk_a disk_b disk_c disk_d - disk
    stage0 stage1 stage2 stage3 stage4 stage5 stage6 stage7 stage8 stage9 stage10 stage11 stage12 stage13 stage14 stage15 - stage
  )

  (:init
    ;; temporal ordering of stages (15 moves required)
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

    ;; start stage
    (current stage0)

    ;; initial pegs: middle peg holds from top to bottom: disk_a, disk_b, disk_c, disk_d
    (empty peg_left)
    (empty peg_right)

    (top peg_middle disk_a)
    (on-disk disk_a disk_b)
    (on-disk disk_b disk_c)
    (on-disk disk_c disk_d)
    (on disk_d peg_middle)

    ;; static size relations (smaller X Y means X is smaller than Y)
    (smaller disk_a disk_b)
    (smaller disk_a disk_c)
    (smaller disk_a disk_d)
    (smaller disk_b disk_c)
    (smaller disk_b disk_d)
    (smaller disk_c disk_d)
  )

  (:goal (and
    ;; final stack on left peg: disk_a (top), disk_b, disk_c, disk_d (bottom)
    (top peg_left disk_a)
    (on-disk disk_a disk_b)
    (on-disk disk_b disk_c)
    (on-disk disk_c disk_d)
    (on disk_d peg_left)

    ;; middle and right pegs empty
    (empty peg_middle)
    (empty peg_right)

    ;; require that execution advanced to final stage (ensures exactly 15 moves)
    (current stage15)
  ))