(define (problem hanoi6-problem)
  (:domain hanoi6)
  (:objects
    d1 d2 d3 d4 d5 d6 - disk
    p1 p2 p3 - peg
  )

  (:init
    ;; typing markers
    (disk d1) (disk d2) (disk d3) (disk d4) (disk d5) (disk d6)
    (peg p1) (peg p2) (peg p3)

    ;; size ordering: d1 is smallest, d6 largest
    (smaller d1 d2) (smaller d1 d3) (smaller d1 d4) (smaller d1 d5) (smaller d1 d6)
    (smaller d2 d3) (smaller d2 d4) (smaller d2 d5) (smaller d2 d6)
    (smaller d3 d4) (smaller d3 d5) (smaller d3 d6)
    (smaller d4 d5) (smaller d4 d6)
    (smaller d5 d6)

    ;; initial stacking on peg p1 (bottom d6, then d5, ..., top d1)
    (on-peg d6 p1)
    (on-disk d5 d6)
    (on-disk d4 d5)
    (on-disk d3 d4)
    (on-disk d2 d3)
    (on-disk d1 d2)

    ;; peg tops / empties
    (top p1 d1)
    (top-empty p2)
    (top-empty p3)
  )

  (:goal (and
    ;; all disks must be stacked on peg p3 in the same order (d6 bottom ... d1 top)
    (on-peg d6 p3)
    (on-disk d5 d6)
    (on-disk d4 d5)
    (on-disk d3 d4)
    (on-disk d2 d3)
    (on-disk d1 d2)
    (top p3 d1)
    ;; explicit emptiness of other pegs implied by disks being on p3; include top-empty for clarity
    (top-empty p1)
    (top-empty p2)
  ))
)