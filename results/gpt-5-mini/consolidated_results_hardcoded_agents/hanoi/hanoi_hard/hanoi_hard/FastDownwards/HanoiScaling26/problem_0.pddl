(define (problem hanoi-6)
  (:domain tower-of-hanoi)
  (:objects
    d1 d2 d3 d4 d5 d6 - disk
    left middle right - peg
  )

  (:init
    ;; initial stack on left: d6 bottom, then d5, d4, d3, d2, d1 top
    (on d6 left)
    (on d5 d6)
    (on d4 d5)
    (on d3 d4)
    (on d2 d3)
    (on d1 d2)

    ;; clear facts: only the topmost disk and empty pegs are clear
    (clear d1)
    (clear middle)
    (clear right)

    ;; size ordering (static): d1 < d2 < d3 < d4 < d5 < d6
    (smaller d1 d2) (smaller d1 d3) (smaller d1 d4) (smaller d1 d5) (smaller d1 d6)
    (smaller d2 d3) (smaller d2 d4) (smaller d2 d5) (smaller d2 d6)
    (smaller d3 d4) (smaller d3 d5) (smaller d3 d6)
    (smaller d4 d5) (smaller d4 d6)
    (smaller d5 d6)
  )

  (:goal
    (and
      ;; all disks must be moved to the right peg preserving the stack order
      (on d6 right)
      (on d5 d6)
      (on d4 d5)
      (on d3 d4)
      (on d2 d3)
      (on d1 d2)
    )
  )
)