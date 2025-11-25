(define (problem hanoi-5)
  (:domain tower-of-hanoi)
  (:objects
    d1 d2 d3 d4 d5 - disk
    p1 p2 p3       - peg
  )

  (:init
    ;; initial stack on peg p1 (d5 bottom, then d4, d3, d2, d1 top)
    (on d5 p1)
    (on d4 d5)
    (on d3 d4)
    (on d2 d3)
    (on d1 d2)

    ;; clear: topmost disk and empty pegs p2 and p3 are clear
    (clear d1)
    (clear p2)
    (clear p3)

    ;; disk ordering (strict): smaller X Y iff X is smaller than Y
    (smaller d1 d2)
    (smaller d1 d3)
    (smaller d1 d4)
    (smaller d1 d5)

    (smaller d2 d3)
    (smaller d2 d4)
    (smaller d2 d5)

    (smaller d3 d4)
    (smaller d3 d5)

    (smaller d4 d5)
  )

  (:goal
    (and
      ;; all five disks must be stacked on peg p3 in the same order
      (on d5 p3)
      (on d4 d5)
      (on d3 d4)
      (on d2 d3)
      (on d1 d2)
    )
  )
)