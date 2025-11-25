(define (problem hanoi-4)
  (:domain hanoi)
  (:objects
    p1 p2 p3 - peg
    d1 d2 d3 d4 - disk
  )
  (:init
    ;; Initial stack on peg p1: d4 on peg, d3 on d4, d2 on d3, d1 on d2
    (on d4 p1)
    (on d3 d4)
    (on d2 d3)
    (on d1 d2)

    ;; top-of-peg bookkeeping: top of p1 is d1; p2 and p3 are empty
    (top p1 d1)
    (top-peg-empty p2)
    (top-peg-empty p3)

    ;; clear disks (no disk on top)
    (clear d1)
    ;; d2, d3, d4 initially have disks on top, so they are not clear (absent)

    ;; size ordering (smaller relations)
    (smaller d1 d2) (smaller d1 d3) (smaller d1 d4)
    (smaller d2 d3) (smaller d2 d4)
    (smaller d3 d4)
  )
  (:goal (and
    ;; All disks moved to peg p3 in correct order: d4 on peg, d3 on d4, d2 on d3, d1 on d2
    (on d4 p3)
    (on d3 d4)
    (on d2 d3)
    (on d1 d2)
  ))
)