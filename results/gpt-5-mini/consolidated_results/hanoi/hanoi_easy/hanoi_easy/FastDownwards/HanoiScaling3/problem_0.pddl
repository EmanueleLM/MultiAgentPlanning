(define (problem hanoi-4-3)
  (:domain hanoi)

  (:objects
    ;; disks: d1 is smallest, d4 largest
    d1 d2 d3 d4 - disk

    ;; pegs:
    p1 p2 p3 - peg

    ;; single agent (keeps agent distinction explicit)
    mover - agent
  )

  (:init
    ;; agent available
    (available mover)

    ;; initial stacking on peg p1: d1 on d2 on d3 on d4 on p1
    (on-disk d1 d2)
    (on-disk d2 d3)
    (on-disk d3 d4)
    (on-peg  d4 p1)

    ;; clear/top facts: only top disk d1 is clear; p1 not clear; p2 and p3 empty
    (clear-disk d1)
    ;; d2, d3, d4 are not listed as clear in the init (they are implicitly not clear)
    (clear-peg p2)
    (clear-peg p3)

    ;; explicit size ordering (smaller relations) enforcing disk ordering constraints
    (smaller d1 d2)
    (smaller d1 d3)
    (smaller d1 d4)
    (smaller d2 d3)
    (smaller d2 d4)
    (smaller d3 d4)
  )

  (:goal (and
    ;; all disks moved to peg p3 in same order: d1 on d2 on d3 on d4 on p3
    (on-disk d1 d2)
    (on-disk d2 d3)
    (on-disk d3 d4)
    (on-peg  d4 p3)

    ;; final pegs p1 and p2 must be empty (explicit terminal conditions)
    (clear-peg p1)
    (clear-peg p2)

    ;; explicit top disk clear condition for terminal state
    (clear-disk d1)
  ))