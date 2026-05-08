(define (problem hanoi_4_orchestrated)
  (:domain hanoi_orchestrated)

  (:objects
    peg_left peg_middle peg_right - peg
    disk_A disk_B disk_C disk_D - disk
    stage0 stage1 stage2 stage3 stage4 stage5 stage6 stage7 stage8 stage9 stage10 stage11 stage12 stage13 stage14 stage15 - stage
  )

  (:init
    ;; temporal ordering of stages (15 moves -> advance from stage0 to stage15)
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

    ;; initial pegs: middle peg holds A (top), B, C, D (bottom); left and right are empty
    (empty peg_left)
    (empty peg_right)

    (top peg_middle disk_A)
    (on-disk disk_A disk_B)
    (on-disk disk_B disk_C)
    (on-disk disk_C disk_D)
    (on disk_D peg_middle)

    ;; static size relations
    (smaller disk_A disk_B)
    (smaller disk_A disk_C)
    (smaller disk_A disk_D)
    (smaller disk_B disk_C)
    (smaller disk_B disk_D)
    (smaller disk_C disk_D)
  )

  (:goal (and
    ;; final stack on left peg: A (top), B, C, D (bottom)
    (top peg_left disk_A)
    (on-disk disk_A disk_B)
    (on-disk disk_B disk_C)
    (on-disk disk_C disk_D)
    (on disk_D peg_left)

    ;; middle and right pegs empty
    (empty peg_middle)
    (empty peg_right)

    ;; require that we have advanced to final stage exactly (ensures exactly 15 moves were executed)
    (current stage15)
  ))