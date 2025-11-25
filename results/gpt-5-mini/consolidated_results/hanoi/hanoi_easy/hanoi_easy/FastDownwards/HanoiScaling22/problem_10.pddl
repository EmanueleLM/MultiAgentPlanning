(define (problem hanoi-4-middle-to-left)
  (:domain hanoi)
  (:objects
    disk_a disk_b disk_c disk_d - disk
    peg_left peg_middle peg_right - peg
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 - stage
  )

  (:init
    ;; initial stacking on middle peg (bottom to top): disk_d, disk_c, disk_b, disk_a
    (on-peg disk_d peg_middle)
    (on-disk disk_c disk_d)
    (on-disk disk_b disk_c)
    (on-disk disk_a disk_b)

    ;; top disk and empty pegs
    (clear-disk disk_a)
    (clear-peg peg_left)
    (clear-peg peg_right)

    ;; stage progression: start at s0 and allow exactly 15 moves to reach s15
    (current s0)
    (succ s0 s1) (succ s1 s2) (succ s2 s3) (succ s3 s4)
    (succ s4 s5) (succ s5 s6) (succ s6 s7) (succ s7 s8)
    (succ s8 s9) (succ s9 s10) (succ s10 s11) (succ s11 s12)
    (succ s12 s13) (succ s13 s14) (succ s14 s15)

    ;; static disk size ordering (A < B < C < D)
    (smaller disk_a disk_b) (smaller disk_a disk_c) (smaller disk_a disk_d)
    (smaller disk_b disk_c) (smaller disk_b disk_d)
    (smaller disk_c disk_d)
  )

  (:goal (and
    ;; require reaching the final stage after exactly 15 moves
    (current s15)

    ;; all disks stacked on the left peg (bottom to top: disk_d, disk_c, disk_b, disk_a)
    (on-peg disk_d peg_left)
    (on-disk disk_c disk_d)
    (on-disk disk_b disk_c)
    (on-disk disk_a disk_b)

    ;; middle and right pegs must be empty at the goal
    (clear-peg peg_middle)
    (clear-peg peg_right)
  ))