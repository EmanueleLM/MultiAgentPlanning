(define (problem hanoi-7)
  (:domain hanoi-integrated)

  (:objects
    d1 d2 d3 d4 d5 d6 d7 - disk
    left middle right - peg
  )

  (:init
    ;; Initial stack on the left peg: d1 (smallest) on d2 on d3 ... on d7 on left.
    (on d1 d2)
    (on d2 d3)
    (on d3 d4)
    (on d4 d5)
    (on d5 d6)
    (on d6 d7)
    (on d7 left)

    ;; Only the topmost disk is clear (no disk on top of it).
    (clear d1)

    ;; Peg occupancy: left has disks (so not clear), middle and right are empty.
    (clear middle)
    (clear right)

    ;; Size (static) relations: explicit strict ordering for all disk pairs.
    ;; d1 smallest, d7 largest; include all pairs i<j as (smaller di dj).
    (smaller d1 d2) (smaller d1 d3) (smaller d1 d4) (smaller d1 d5) (smaller d1 d6) (smaller d1 d7)
    (smaller d2 d3) (smaller d2 d4) (smaller d2 d5) (smaller d2 d6) (smaller d2 d7)
    (smaller d3 d4) (smaller d3 d5) (smaller d3 d6) (smaller d3 d7)
    (smaller d4 d5) (smaller d4 d6) (smaller d4 d7)
    (smaller d5 d6) (smaller d5 d7)
    (smaller d6 d7)
  )

  ;; Goal: full legal transfer of the complete stack onto the right peg,
  ;; preserving the strict smaller-on-larger ordering (each disk directly on the next larger).
  ;; Also explicitly require that the other pegs are empty at termination.
  (:goal (and
    ;; target stack: d1 on d2, d2 on d3, ..., d6 on d7, and d7 directly on right peg
    (on d1 d2)
    (on d2 d3)
    (on d3 d4)
    (on d4 d5)
    (on d5 d6)
    (on d6 d7)
    (on d7 right)

    ;; explicit terminal conditions: left and middle must be clear (no disks remaining)
    (clear left)
    (clear middle)

    ;; top disk must be clear (no disk on top of the smallest disk)
    (clear d1)
  ))
)