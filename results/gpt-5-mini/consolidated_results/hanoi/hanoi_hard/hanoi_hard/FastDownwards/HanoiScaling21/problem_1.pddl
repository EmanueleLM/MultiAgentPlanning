(define (problem hanoi6-multiagent-problem)
  (:domain hanoi_multiagent)
  (:objects
    disk_A disk_B disk_C disk_D disk_E disk_F - disk
    peg-left peg-middle peg-right - peg
  )
  (:init
    ;; initial stack on peg-left: disk_F bottom, then disk_E, disk_D, disk_C, disk_B, disk_A top
    (on disk_A disk_B)
    (on disk_B disk_C)
    (on disk_C disk_D)
    (on disk_D disk_E)
    (on disk_E disk_F)
    (on disk_F peg-left)

    ;; clear markers: only the topmost disk and the empty pegs are clear
    (clear disk_A)
    (clear peg-middle)
    (clear peg-right)

    ;; static size ordering (smaller X Y when X is strictly smaller than Y)
    (smaller disk_A disk_B) (smaller disk_A disk_C) (smaller disk_A disk_D) (smaller disk_A disk_E) (smaller disk_A disk_F)
    (smaller disk_B disk_C) (smaller disk_B disk_D) (smaller disk_B disk_E) (smaller disk_B disk_F)
    (smaller disk_C disk_D) (smaller disk_C disk_E) (smaller disk_C disk_F)
    (smaller disk_D disk_E) (smaller disk_D disk_F)
    (smaller disk_E disk_F)
  )

  ;; Goal: all disks moved from left peg to middle peg in the correct order,
  ;; right peg must be empty; left peg must be empty as a terminal condition.
  (:goal (and
    ;; target stack on peg-middle: disk_F bottom on peg-middle, then disk_E..disk_A above
    (on disk_F peg-middle)
    (on disk_E disk_F)
    (on disk_D disk_E)
    (on disk_C disk_D)
    (on disk_B disk_C)
    (on disk_A disk_B)

    ;; ensure both side pegs are empty (no disk directly on them) at the end
    (clear peg-left)
    (clear peg-right)
  ))
)