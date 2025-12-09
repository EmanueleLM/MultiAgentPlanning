(define (problem hanoi-3)
  :domain hanoi
  :objects
    d1 d2 d3 - disk
    peg1 peg2 peg3 - peg
  :init
    ;; initial stacked configuration on peg1: d3 (largest) bottom, d2 middle, d1 smallest on top
    (on d1 d2)
    (on d2 d3)
    (on d3 peg1)

    ;; clear places: top disk and empty pegs
    (clear d1)
    (clear peg2)
    (clear peg3)

    ;; size ordering (static): d1 < d2 < d3
    (smaller d1 d2)
    (smaller d1 d3)
    (smaller d2 d3)
  :goal
    (and
      ;; all disks moved to peg3 with correct stacking order: d3 on peg3, d2 on d3, d1 on d2
      (on d1 d2)
      (on d2 d3)
      (on d3 peg3)
    )
)