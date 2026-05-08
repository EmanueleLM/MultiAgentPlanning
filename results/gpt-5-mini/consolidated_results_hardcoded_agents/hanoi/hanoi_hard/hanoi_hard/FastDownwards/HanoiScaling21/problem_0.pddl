(define (problem hanoi6-multiagent-problem)
  (:domain hanoi_multiagent)
  (:objects
    d1 d2 d3 d4 d5 d6 - disk
    peg-left peg-middle peg-right - peg
  )
  (:init
    ;; initial stack on peg-left: d6 bottom, then d5, d4, d3, d2, d1 top
    (on d1 d2)
    (on d2 d3)
    (on d3 d4)
    (on d4 d5)
    (on d5 d6)
    (on d6 peg-left)

    ;; clear markers: only the topmost disk and the empty pegs are clear
    (clear d1)
    (clear peg-middle)
    (clear peg-right)

    ;; static size ordering (smaller dX dY when X < Y)
    (smaller d1 d2) (smaller d1 d3) (smaller d1 d4) (smaller d1 d5) (smaller d1 d6)
    (smaller d2 d3) (smaller d2 d4) (smaller d2 d5) (smaller d2 d6)
    (smaller d3 d4) (smaller d3 d5) (smaller d3 d6)
    (smaller d4 d5) (smaller d4 d6)
    (smaller d5 d6)
  )

  ;; Goal: all disks moved from left peg to middle peg in the correct order,
  ;; right peg must be empty; left peg must be empty as a terminal condition.
  (:goal (and
    ;; target stack on peg-middle: d6 bottom on peg-middle, then d5..d1 above
    (on d6 peg-middle)
    (on d5 d6)
    (on d4 d5)
    (on d3 d4)
    (on d2 d3)
    (on d1 d2)

    ;; ensure both side pegs are empty at the end as required
    (clear peg-left)
    (clear peg-right)
  ))
)