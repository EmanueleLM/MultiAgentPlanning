(define (problem hanoi-3)
  (:domain hanoi)
  (:objects
    p1 p2 p3 - peg
    d1 d2 d3 - disk
  )

  (:init
    ;; initial stack: all disks on peg p1 with d3 largest at bottom
    (on d3 p1)
    (on d2 d3)
    (on d1 d2)

    ;; clear places (top-of-stack): only the smallest disk and empty pegs
    (clear d1)
    (clear p2)
    (clear p3)

    ;; size relations: d1 < d2 < d3
    (smaller d1 d2)
    (smaller d1 d3)
    (smaller d2 d3)
  )

  (:goal (and
    ;; goal: same stack order but moved to peg p3
    (on d3 p3)
    (on d2 d3)
    (on d1 d2)
  ))
)